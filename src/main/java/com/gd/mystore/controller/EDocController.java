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
		
		return "edoc/draftrecoveryList";
	}

    
    
	// 결재 목록 상세페이지
	// 결재 대기 상세페이지
	@GetMapping("/aprvlwait.do")
	public String aprvlWait(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.aprvlWait(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/aprvlwait";		
	}
	
	// 결재 예정 상세페이지
	@GetMapping("/aprvlscheduled.do")
	public String aprvlscheduled(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.aprvlscheduled(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/aprvlscheduled";		
	}
	
	// 결재 완료 상세페이지	
	@GetMapping("/aprvlcomplete.do")
	public String aprvlcomplete(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.aprvlcomplete(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/aprvlcomplete";		
	}
	
	
	
	// 결재 반려
	// 결재하기
	@PostMapping("/aprvlcpl.do")
	public String aprvlcpl(@RequestParam("aprvlNo") List<Integer> aprvlNo,
						   @RequestParam("empNo") List<String> empNo,
	                       @RequestParam("aprvlEdocNo") List<Integer> aprvlEdocNo,
	                       @RequestParam("aprvlRank") List<Integer> aprvlRank,
	                       @RequestParam("edocNo") int edocNo,
	                       HttpSession session,
	                       RedirectAttributes rdAttributes) {

	    EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
	    String no = loginUser.getEmpNo(); // 로그인한 사용자 번호

	    // 결재 정보 전달 객체 생성
	    EDocApprovalDto approval1 = new EDocApprovalDto();
	    EDocApprovalDto approval2 = new EDocApprovalDto();
	    
	    approval1.setAprvlNo(aprvlNo.get(0));
	    approval1.setAprvlEdocNo(aprvlEdocNo.get(0));
	    approval1.setAprvlRank(aprvlRank.get(0));
	    approval1.setEmpNo(empNo.get(0));

	    approval2.setAprvlNo(aprvlNo.get(1));
	    approval2.setAprvlEdocNo(aprvlEdocNo.get(1));
	    approval2.setAprvlRank(aprvlRank.get(1));
	    approval2.setEmpNo(empNo.get(1));

	    EDocDto edocDto = new EDocDto();
	    edocDto.setEdocNo(edocNo);

	    // Service 호출
	    int result = edocService.aprvlcpl(approval1, approval2, edocDto, no);
	    
		if(result ==  1) {
			rdAttributes.addFlashAttribute("alertMsg", "결재가 완료되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "결재 실패");			
		}

	    return "redirect:/edoc/aprvlwaitList.do";
	}
	
	// 반려하기
	@PostMapping("/aprvlrjt.do")
	public String aprvlrjt(@RequestParam("aprvlNo") List<Integer> aprvlNo,
						   @RequestParam("empNo") List<String> empNo,
				           @RequestParam("aprvlEdocNo") List<Integer> aprvlEdocNo,
				           @RequestParam("aprvlRank") List<Integer> aprvlRank,
				           @RequestParam("edocNo") int edocNo,
				           HttpSession session,
				           RedirectAttributes rdAttributes) {

		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo(); // 로그인한 사용자 번호
		
		// 결재 정보 전달 객체 생성
		EDocApprovalDto approval1 = new EDocApprovalDto();
		EDocApprovalDto approval2 = new EDocApprovalDto();
		
		approval1.setAprvlNo(aprvlNo.get(0));
		approval1.setAprvlEdocNo(aprvlEdocNo.get(0));
		approval1.setAprvlRank(aprvlRank.get(0));
		approval1.setEmpNo(empNo.get(0));
		
		approval2.setAprvlNo(aprvlNo.get(1));
		approval2.setAprvlEdocNo(aprvlEdocNo.get(1));
		approval2.setAprvlRank(aprvlRank.get(1));
		approval2.setEmpNo(empNo.get(1));
		
		EDocDto edocDto = new EDocDto();
		edocDto.setEdocNo(edocNo);
		
		// Service 호출
		int result = edocService.aprvlrjt(approval1, approval2, edocDto, no);
		
		if(result ==  1) {
			rdAttributes.addFlashAttribute("alertMsg", "반려가 완료되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "반려 실패");			
		}
		
		return "redirect:/edoc/aprvlwaitList.do";
	}
	
	
	
	// 기안 문서 상세페이지
	// 기안 대기 상세페이지
	@GetMapping("/draftwait.do")
	public String draftwait(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.draftwait(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/draftwait";		
	}
	
	// 기안 진행 상세페이지
	@GetMapping("/draftprogress.do")
	public String draftprogress(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.draftprogress(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/draftprogress";		
	}
	
	// 기안 완료 상세페이지
	@GetMapping("/draftcomplete.do")
	public String draftcomplete(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.draftcomplete(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/draftcomplete";		
	}
	
	// 기안 반려 상세페이지
	@GetMapping("/draftreject.do")
	public String draftreject(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.draftreject(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/draftreject";		
	}
	
	// 기안 회수 상세페이지
	@GetMapping("/draftrecovery.do")
	public String draftrecovery(int no, Model model) {
		
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실제파일명)들 데이터
		EDocDto edoc = edocService.draftrecovery(no);
		
		// 상세페이지에 필요한 결재자 정보
		List<EDocApprovalDto> aprvlList = edocService.aprvlList(no);
		
		String escapedContent = edoc.getEdocContent()
                .replace("\"", "\\\"")  // 큰따옴표만 이스케이프
                .replace("\r", "")      // 줄바꿈 제거
                .replace("\n", "");     // 줄바꿈 제거
		
		model.addAttribute("edoc", edoc);
		model.addAttribute("list", aprvlList);
		model.addAttribute("edocContent", escapedContent);
		
		return "edoc/draftrecovery";		
	}
	
	// 기안서 회수
	@PostMapping("/draftrcv.do")
	public String draftrcv(@RequestParam("aprvlNo") List<Integer> aprvlNo,
						   @RequestParam("empNo") List<String> empNo,
				           @RequestParam("aprvlEdocNo") List<Integer> aprvlEdocNo,
				           @RequestParam("aprvlRank") List<Integer> aprvlRank,
				           @RequestParam("edocNo") int edocNo,
				           RedirectAttributes rdAttributes) {

		
		// 결재 정보 전달 객체 생성
		EDocApprovalDto approval1 = new EDocApprovalDto();
		EDocApprovalDto approval2 = new EDocApprovalDto();
		
		approval1.setAprvlNo(aprvlNo.get(0));
		approval1.setAprvlEdocNo(aprvlEdocNo.get(0));
		approval1.setAprvlRank(aprvlRank.get(0));
		approval1.setEmpNo(empNo.get(0));
		
		approval2.setAprvlNo(aprvlNo.get(1));
		approval2.setAprvlEdocNo(aprvlEdocNo.get(1));
		approval2.setAprvlRank(aprvlRank.get(1));
		approval2.setEmpNo(empNo.get(1));
		
		EDocDto edocDto = new EDocDto();
		edocDto.setEdocNo(edocNo);
		
		// Service 호출
		int result = edocService.draftrcv(approval1, approval2, edocDto);
		
		log.debug("result : {}", result);
		
		if(result ==  1) {
			rdAttributes.addFlashAttribute("alertMsg", "기안서 회수가 완료되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "기안서 회수 실패");			
		}
		
		return "redirect:/edoc/draftwaitList.do";
	}
	
	// 기안서 삭제
	@PostMapping("/draftUseN.do")
	public String draftUseN(@RequestParam("edocNo") int edocNo,
				            RedirectAttributes rdAttributes) {		
		
		EDocDto edocDto = new EDocDto();
		edocDto.setEdocNo(edocNo);
		
		// Service 호출
		int result = edocService.draftUseN(edocDto);
		
		
		if(result ==  1) {
			rdAttributes.addFlashAttribute("alertMsg", "기안서 삭제가 완료되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "기안서 삭제 실패");			
		}
		
		return "redirect:/edoc/draftrecoveryList.do";
	}


	// 메인화면 결재대기문서 기안진행문서 갯수
	@GetMapping("/edocCount")
	public String edocCount(Model model,
							HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		String no = loginUser.getEmpNo(); // 로그인한 사용자 번호
		
		int count1 = edocService.aprvlWaitListCount(no);
		int count2 = edocService.draftProgressListCount(no);
		
		model.addAttribute("count1", count1);
		model.addAttribute("count2", count2);
		
		System.out.println(count1);
		System.out.println(count2);
		
		return "main";
	}

	

	
	

	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
