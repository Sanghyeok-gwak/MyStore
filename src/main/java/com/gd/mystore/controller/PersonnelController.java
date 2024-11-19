package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.PersonnelService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/personnel")
@RequiredArgsConstructor
@Controller
public class PersonnelController {

	private final PersonnelService personnelService;
	
	// 직원 리스트 조회 로직
	@GetMapping("/employeeManager")
    public void employeeList(Model model) {
		List<EmpMemberDto> list = personnelService.selectEmpList();
		log.debug("list: {}", list);
		model.addAttribute("list", list);
		
		//return "personnel/employeeManager";
    }

	// 직원 상세 조회 및 수정 기능
    @GetMapping("/detailEmp")
    public void detailEmp(String no, Model model) {
    	EmpMemberDto e = personnelService.selectEmpByNo(no);
    	model.addAttribute("e", e);
    	
    }
    /*
    // 직원 수정하기
    @GetMapping("/modify")
    public void noticeModify(String empno, Model model) {
    	model.addAttribute("e", personnelService.selectNoticeByNo(empno));
    }
     */
    
    // 직원 등록 페이지로
    @GetMapping("/empEntry")
    public void empEntry() {
    }
    
    @PostMapping("/insert")
     public String insertEmp(EmpMemberDto e) {	
    	int result = personnelService.insertEmp(e);
    	if(result > 0) { // 성공 => 리스트페이지
    		return "redirect:/personnel/employeeManager";
    	}else { // 실패 => 메인페이지
    		return "redirect:/";
    	}
    	
    	
    }
    
    @PostMapping("/updateEmp")
    public String updateEmp(EmpMemberDto e) {
    	int result = personnelService.updateEmp(e);
    	if(result > 0) {
    		return "redirect:/personnel/detailEmp?no=" + e.getEmpNo();
    	}else {
    		return "redirect:/personnel/employeeManager";
    	}
    }
    
    
    
    
    
    
    
	
}
