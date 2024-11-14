package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/salary")
public class SalaryController {
	
	 @GetMapping("/salaryMaster")
	    public void salaryMaster() {
	        // 급여 관리 및 등록 기능
	    }

	    @GetMapping("/payCheck")
	    public void payCheck() {
	        // 급여 확인 및 출력 기능
	    }

}
