package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/personnel")
public class PersonnelController {

	@GetMapping("detailEmp")
	public void test1() {
	}
	
	@GetMapping("empEntry")
	public void test2() {
	}

	@GetMapping("employeeManager")
	public void test3() {
	}
	@GetMapping("salaryMaster")
	public void test4() {
	}
	
}
