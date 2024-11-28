package com.gd.mystore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	@GetMapping("/getSalary")
	public ResponseEntity<SalaryDto> getSalary(@RequestParam("empNo") String empNo) {
	    SalaryDto s = salaryservice.getSalary(empNo);

	    if (s == null) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	    }

	    return ResponseEntity.ok(s);
	}

	
	

	@PostMapping("/saveSalary")
	public String saveSalary(SalaryDto s 
							,RedirectAttributes rdAttributes) {
		
		int result = salaryservice.saveSalary(s);
		
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "급여등록이 완료되었습니다.");
			return "redirect:/personnel/employeeManager";
					
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "급여등록에 실패했습니다. 다시 시도해주세요");
			return "redirect:/personnel/employeeManager";
		}
		
		
	}
	
	
		
	}

