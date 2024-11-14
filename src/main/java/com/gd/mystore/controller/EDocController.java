package com.gd.mystore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EDocSampleDto;
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
	
	// 샘플 양식 리스트 조회
	@GetMapping("/list.do")
	public String edocmodelist(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = edocService.selectEDocListCount();
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<EDocSampleDto> list = edocService.selectEDocList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		log.debug("list: {}", list);
		
		return "edoc/edocmodelist";
	}
	
	// 샘플 양식 리스트 추가
	@GetMapping("/sampleadd.do")
	public String edocmodewriter() {
		return "edoc/edocmodewriter";
	}
	
	@PostMapping("/forminsert.do")
	public String edocmodeinsert(EDocSampleDto se
								, RedirectAttributes rdAttributes
								//, HttpSession session
								) {
//		se.setEmpNo( ((EDocSampleDto)session.getAttribute("loginUser")).getEmpNo() );

		log.debug("se: {}", se);
		
		int result = edocService.insertEDocSample(se);	
		
		if(result == 1) {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 실패");
		}
		
		return "redirect:/edoc/list.do";
		
	}
	
	@PostMapping("/sampledelete.do")
	public String sampledelete(String[] deleteNo, Model model) {
		
		int result = edocService.deleteEdocSample(deleteNo);
		
	    if (result == deleteNo.length) {
	        model.addAttribute("alertMsg", "문서가 성공적으로 삭제되었습니다.");
	    } else {
	        model.addAttribute("alertMsg", "삭제에 실패했습니다.");
	    }
	    
	    return "redirect:/edoc/list.do";
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
	
	@GetMapping("edocwrite")
	public void edocwrite() {}
	
	@GetMapping("pendingdetail")
	public void pendingdetail() {}
	
	@GetMapping("pendinglist")
	public void pendinglist() {}
	
	@GetMapping("scheduleddetail")
	public void scheduleddetail() {}
	
	@GetMapping("scheduledlist")
	public void scheduledlist() {}
	

	
	
	
}
