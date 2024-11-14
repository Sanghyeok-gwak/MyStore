package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/personnel")
public class PersonnelController {

	@GetMapping("/employeeManager")
    public void employeeList() {
        // 직원 리스트 조회 로직
    }

    @GetMapping("/detailEmp")
    public void detailEmp() {
        // 직원 상세 조회 및 수정 기능
    }

    @GetMapping("/empEntry")
    public void empEntry() {
        // 직원 등록 로직
    }
	
}
