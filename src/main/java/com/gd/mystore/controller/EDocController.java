package com.gd.mystore.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EDocApprovalDto;
import com.gd.mystore.dto.EDocAttachDto;
import com.gd.mystore.dto.EDocDto;
import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.EDocService;
import com.gd.mystore.util.FileUtil;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/edoc")
public class EDocController {
	
	private final EDocService edocService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	// 문서 양식 관리
	// 양식 목록 조회(페이징)
	@GetMapping("/formlist.do")
	public String edocmodelist(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = edocService.selectEDocListCount();
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocSampleDto> list = edocService.selectEDocFormList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/edocmodelist";
	}
	
	// 양식 등록
	@GetMapping("/sampleadd.do")
	public String sampleadd() {
		return "edoc/edocmodewriter";
	}
	
	@PostMapping("/forminsert.do")
	public String edocmodeinsert( EDocSampleDto se
								, RedirectAttributes rdAttributes
								, HttpSession session
								) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		se.setEmpNo(loginUser.getEmpNo());
		
		int result = edocService.insertEDocSample(se);	
		
		if(result == 1) {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 실패");
		}
		
		return "redirect:/edoc/formlist.do";
		
	}
	
	// 양식 삭제
	@PostMapping("/sampledelete.do")
	public String sampledelete(@RequestParam("deleteNo") String[] deleteNo, Model model) {
		
		int result = edocService.deleteEdocSample(deleteNo);
		
	    if (result == deleteNo.length) {
	        model.addAttribute("alertMsg", "문서가 성공적으로 삭제되었습니다.");
	    } else {
	        model.addAttribute("alertMsg", "삭제에 실패했습니다.");
	    }
	    
	    return "redirect:/edoc/formlist.do";
	}
	
	
	
	// 기안서 작성
	// 양식유형만 조회
	@GetMapping("edocwrite.do")
	public String edocwrite(Model model
						, HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		
		List<EDocSampleDto> list = edocService.selectEDocFormList();
        model.addAttribute("list", list);
        model.addAttribute("loginUser", loginUser);
        
        // 오늘 날짜를 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        String currentDate = dateFormat.format(new Date()); 
        model.addAttribute("currentDate", currentDate);
		
        return "edoc/edocwrite";
	}
	
	// 양식유형 선택후 양식을 가져오기
	@ResponseBody
	@GetMapping(value = "/getSampleFormat", produces = "text/plain; charset=UTF-8")
	public String getSampleFormat(@RequestParam("sampleNo") String sampleNo) {
		
	    Integer sampleNoInt = Integer.parseInt(sampleNo);
	    EDocSampleDto sample = edocService.selectEDocForm(sampleNoInt);   

	    // sample 객체에서 sampleFormat을 가져와 반환
	    return sample != null ? sample.getSampleFormat() : "";
	}
	
	// jstree 가져오기
	@ResponseBody
    @GetMapping(value = "/approvalTree", produces = "application/json")
    public List<EmpMemberDto> getApprovalTree(HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
        // employeeService를 통해 데이터 가져오기
        List<EmpMemberDto> employees = edocService.selectEmployees(no);
        
        return employees; // 자동으로 JSON 형식으로 변환되어 반환됨
    }
	
	// 기안서 작성
	@PostMapping("/edocinsert.do")
	public String edocinsert(@RequestParam("draftName") String empNo,				// 기안자 번호	
	                         @RequestParam("languages") String sampleNo,				// 양식유형 번호
	                         @RequestParam("approvalOrder") String approvalOrder,	// 결재자 정보
	                         @RequestParam("title") String EdocTitle,				// 기안 제목
	                         @RequestParam("editorTxt") String EdocContent,			// 기안 내용
	                         List<MultipartFile> uploadFiles,						// 파일 업로드
	                         RedirectAttributes rdAttributes) {						
	    
	    EDocDto edoc = new EDocDto();
	    List<EDocApprovalDto> approvalList = new ArrayList<>();
	    List<EDocAttachDto> attachList = new ArrayList<>();
	    
		for(MultipartFile file : uploadFiles) {
			if(file != null && !file.isEmpty()) {
				Map<String, String> map = fileUtil.fileupload(file, "edoc");
				attachList.add(EDocAttachDto.builder()
										.filePath(map.get("filePath"))
										.attachOriginalName(map.get("originalName"))
										.attachRenameFileName(map.get("filesystemName"))
										.build());
			}
		}
	    
	    // edoc 객체에 담기
	    edoc.setEmpNo(empNo);
	    edoc.setSampleNo(sampleNo);
	    edoc.setEdocTitle(EdocTitle);
	    edoc.setEdocContent(EdocContent);
	    edoc.setAttachList(attachList);
	    
	    // approvalOrder 값 처리
	    String[] approvals = approvalOrder.split(";");
	    for (String approvalDetail : approvals) {
	        String[] detail = approvalDetail.split("-");
	        int aprvlRank = Integer.parseInt(detail[0].trim());
	        String name = detail[1].trim();
	        String rank = detail[2].trim();
	        String dept = detail[3].trim();
	        String no = detail[4].trim();
	        
	        EDocApprovalDto approval = new EDocApprovalDto();
	        
	        // 결재자 정보를 필요한 로직에 따라 처리
	         approval.setAprvlRank(aprvlRank);
	         approval.setEmpNo(no);
	         
	         approvalList.add(approval);
	    }
	    
	    log.debug("approvalList : {}", approvalList);
	    
	    int result = edocService.edocInsert(edoc, approvalList);
	    int totalSize = attachList.size() + approvalList.size();
	    
		if(attachList.isEmpty() && result ==  approvalList.size() + 1
				|| !attachList.isEmpty() && result == totalSize ) {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 실패");			
		}
		
		return "redirect:/edoc/draftwaitList.do";
	    
	}
	
	
	
	// 결재 목록 조회
	// 결재 목록 대기(페이징)
	@GetMapping("/aprvlwaitList.do")
	public String aprvlWaitList(@RequestParam(value="page", defaultValue="1") int currentPage
							  , Model model
							  , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.aprvlWaitListCount(no);		
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.aprvlWaitList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/aprvlwaitList";
	}
	
	// 결재 목록 예정(페이징)
	@GetMapping("/aprvlscheduledList.do")
	public String aprvlScheduledList(@RequestParam(value="page", defaultValue="1") int currentPage
								   , Model model
								   , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.aprvlScheduledListCount(no);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.aprvlScheduledList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/aprvlscheduledList";
	}
	
	// 결재 목록 완료(페이징)
	@GetMapping("/aprvlcompleteList.do")
	public String aprvlCompleteList(@RequestParam(value="page", defaultValue="1") int currentPage
								  , Model model
								  , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.aprvlCompleteListCount(no);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.aprvlCompleteList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/aprvlcompleteList";
	}
	
	
	
	// 기안서 목록 조회
	// 기안 대기 문서(페이징)
	@GetMapping("/draftwaitList.do")
	public String draftWaitList(@RequestParam(value="page", defaultValue="1") int currentPage
								  , Model model
								  , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.draftWaitListCount(no);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.draftWaitList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/draftwaitList";
	}
	
	// 기안 진행 문서(페이징)
	@GetMapping("/draftprogressList.do")
	public String draftProgressList(@RequestParam(value="page", defaultValue="1") int currentPage
								  , Model model
								  , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.draftProgressListCount(no);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.draftProgressList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/draftprogressList";
	}
	
	// 기안 승인 문서(페이징)
	@GetMapping("/draftcompleteList.do")
	public String draftCompleteList(@RequestParam(value="page", defaultValue="1") int currentPage
								  , Model model
								  , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.draftCompleteListCount(no);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.draftCompleteList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/draftcompleteList";
	}
	
	// 기안 반려 문서(페이징)
	@GetMapping("/draftrejectList.do")
	public String draftRejectList(@RequestParam(value="page", defaultValue="1") int currentPage
								  , Model model
								  , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.draftRejectListCount(no);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.draftRejectList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/draftrejectList";
	}
	
	// 기안 회수 문서(페이징)
	@GetMapping("/draftrecoveryList.do")
	public String draftRecoveryList(@RequestParam(value="page", defaultValue="1") int currentPage
								  , Model model
								  , HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo();
		
		int listCount = edocService.draftRecoveryListCount(no);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EDocDto> list = edocService.draftRecoveryList(no, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/draftrecoveryList";
	}

    
    
	// 결재 목록 상세페이지
	// 결재 대기 상세페이지
	@GetMapping("/aprvlwait.do")
	public String aprvlWait(int no, Model model) {
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.aprvlWait(no);
		// boardNo, boardTitle, boardContent, boardWriter, registDt, attachList
		
		model.addAttribute("edoc", edoc);
		
		return "edoc/aprvlwait";
		
	}
    

	

	

	
	

	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
