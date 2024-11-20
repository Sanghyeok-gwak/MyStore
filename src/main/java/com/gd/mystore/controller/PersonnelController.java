package com.gd.mystore.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.PersonnelService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/personnel")
@RequiredArgsConstructor
@Controller
public class PersonnelController {

	private final PersonnelService personnelService;
	private final PagingUtil pagingUtil;
	
	// 직원 리스트 조회 
	// 사이드바에 있는 메뉴 클릭시 /personnel/employeeManager             => 1번페이지 요청
	// 페이징바에 있는 페이지 클릭시 /personnel/employeeManager?page=xx
	@GetMapping("/employeeManager")
    public void employeeManager(@RequestParam(value="page", defaultValue="1") int currentPage
    						    ,Model model) {

		int listCount = personnelService.selectEmpListCount();
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EmpMemberDto> list = personnelService.selectEmpList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
    }
	
	@GetMapping("/search")
	public String search(@RequestParam(value="page", defaultValue="1") int currentPage
					   , @RequestParam Map<String, String> search
					   , Model model) {
		// Map<String ,String> => 
		
		int listCount = personnelService.selectSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EmpMemberDto> list = personnelService.selectSearchList(search, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "personnel/employeeManager";
	}

	
	
	
	// 직원 상세 조회 및 수정 기능
    @GetMapping("/detailEmp")
    public void detailEmp(String no, Model model) {
    	EmpMemberDto e = personnelService.selectEmpByNo(no);
    	model.addAttribute("e", e);
    	
    }
    
    // 직원 수정 
    @PostMapping("/updateEmp")
    public String updateEmp(EmpMemberDto e
			   			  , RedirectAttributes rdAttributes) {
    	
    	int result = personnelService.updateEmp(e);
    	
    	if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 정보수정 되었습니다.");
    		return "redirect:/personnel/detailEmp?no=" + e.getEmpNo();
    		
    	}else {
			rdAttributes.addFlashAttribute("alertMsg", "정보수정에 실패했습니다 다시 시도해주세요.");
    		return "redirect:/personnel/employeeManager";
    	}
    }
    
    
    // 직원 등록 페이지로
    @GetMapping("/empEntry")
    public void empEntry() {
    }
    
    // 직원 등록
    @PostMapping("/insert")
     public String insertEmp(EmpMemberDto e
    		 			   , RedirectAttributes rdAttributes) {	
    	
    	int result = personnelService.insertEmp(e);
    	
    	if(result > 0) { // 성공 => 리스트페이지
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 직원등록 되었습니다.");
    		return "redirect:/personnel/employeeManager";
    		
    	}else { // 실패 => 메인페이지
			rdAttributes.addFlashAttribute("alertMsg", "직원등록에 실패했습니다 다시 시도해주세요.");
    		return "redirect:/";
    	}
    	
    	
    }
   
    
    
    
    
    
    
    
    
    
    
    
	
}
