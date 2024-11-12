package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@GetMapping("/departmentChangeHistory")
	public void test1() {
	}
	
	@GetMapping("/departmentSearch")
	public void test2() {
	}
	
	@GetMapping("/departmentModify")
	public void test3() {
	}
}
