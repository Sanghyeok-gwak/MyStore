package com.gd.mystore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.SalaryDto;
import com.gd.mystore.service.SalaryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
@RequestMapping("/salary")
@Controller
public class SalaryController {

	private final SalaryService salaryservice;

	// 급여 확인 
	@GetMapping("/payCheck")
	public String payCheck(HttpSession session,
						   Model model) {
	// 현재 세션에 로그인된 사용자 정보 가져오기
	EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
	
	  // 로그인한 사용자가 존재할 경우 급여 정보 조회
    if (loginUser != null) {
        // 서비스 계층에서 급여 정보 조회
        SalaryDto salary = salaryservice.selectSalary(loginUser.getEmpNo());
        
        // 조회한 급여 정보를 모델에 추가하여 뷰에 전달
        model.addAttribute("salary", salary);
    }
    
	return "salary/payCheck";
	
	}
	
	
	
	// 급여 관리 및 등록 기능
	@GetMapping("/salaryMaster")
	public void salaryMaster() {
	}

}
