package com.gd.mystore.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EDocApprovalDto;
import com.gd.mystore.dto.EDocDto;
import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.EDocService;
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
	
	// 문서 양식 관리
	// 양식 목록 조회(페이징)
	@GetMapping("/formlist.do")
	public String edocmodelist(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = edocService.selectEDocListCount();
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 5);
		List<EDocSampleDto> list = edocService.selectEDocFormList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/edocmodelist";
	}
	
	// 양식 등록
	@GetMapping("/sampleadd.do")
	public String edocmodewriter() {
		return "edoc/edocmodewriter";
	}
	
	@PostMapping("/forminsert.do")
	public String edocmodeinsert(EDocSampleDto se
								, RedirectAttributes rdAttributes
								, HttpSession session
								) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		se.setEmpNo(loginUser.getEmpNo());		// memberDto EmpNo int로 변경해야함
		
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
	@GetMapping("edocwrite")
	public void edocwrite(Model model
						, HttpSession session) {
		
		EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
		
		List<EDocSampleDto> list = edocService.selectEDocFormList();
        model.addAttribute("list", list);
        model.addAttribute("loginUser", loginUser);
        
     // 오늘 날짜를 설정합니다 
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        String currentDate = dateFormat.format(new Date()); 
        model.addAttribute("currentDate", currentDate);
		
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
	
	@ResponseBody
    @GetMapping(value = "/approvalTree", produces = "application/json")
    public List<EmpMemberDto> getApprovalTree() {
		
        // employeeService를 통해 데이터 가져오기
        List<EmpMemberDto> employees = edocService.selectEmployees();
        
        return employees; // 자동으로 JSON 형식으로 변환되어 반환됨
    }
	
	@PostMapping("/edocinsert.do")
	public String edocinsert(@RequestParam("draftName") int draftName
						   , @RequestParam("languages") int languages
					       , @RequestParam("approvalOrder") String approvalOrder
					       , HttpSession session) {
		
		EDocDto edoc = new EDocDto();
		EDocApprovalDto approval = new EDocApprovalDto();
		
		edoc.setEmpNo(draftName);
	
		return "asd";
	}
    
    
    
    
    @GetMapping("collectlist")
	public void collectlist() {}
	
	@GetMapping("completedetail")
	public void completedetail() {}

	@GetMapping("completelist")
	public void completelist() {}
	
	@GetMapping("draftcompanion")
	public void draftcompanion() {}
	
	@GetMapping("draftcompanionlist")
	public void draftcompanionlist() {}
	
	@GetMapping("draftcomplete")
	public void draftcomplete() {}
	
	@GetMapping("draftcompletelist")
	public void draftcompletelist() {}
	
	@GetMapping("draftprogress")
	public void draftprogress() {}
	
	@GetMapping("draftprogresslist")
	public void draftprogresslist() {}
	
	@GetMapping("draftwait")
	public void draftwait() {}
	
	@GetMapping("draftwaitlist")
	public void draftwaitlist() {}
	
	@GetMapping("pendingdetail")
	public void pendingdetail() {}
	
	@GetMapping("pendinglist")
	public void pendinglist() {}
	
	@GetMapping("scheduleddetail")
	public void scheduleddetail() {}
	
	@GetMapping("scheduledlist")
	public void scheduledlist() {}
	

	
	

	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
