package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.mystore.dto.DepartmentDto;
import com.gd.mystore.service.DepartmentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/department")
public class DepartmentController {

	private final DepartmentService departmentService;
	
	@GetMapping("/departmentModify")
	public void list() {
		
		List<DepartmentDto> list = departmentService.selectMemberList();
	}
	
	@GetMapping("/departmentChangeHistory")
	public void test1() {
	}
	
	@GetMapping("/departmentSearch")
	public void test2() {
	}
	

	
	
}
