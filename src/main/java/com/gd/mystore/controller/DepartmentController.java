package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void list(Model model) { // Model을 파라미터로 추가
	    // 서비스에서 부서 목록을 가져옵니다.
	    List<DepartmentDto> list = departmentService.selectMemberList();
	    
	    // 모델에 list를 추가하여 JSP로 전달
	    model.addAttribute("list", list);
	    
	}

	
	@GetMapping("/departmentChangeHistory")
	public void test1() {
	}
	
	@GetMapping("/departmentSearch")
	public void test2() {
	}
	

	
	
}
