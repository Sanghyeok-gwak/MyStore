package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.mystore.dto.DepTransferDto;
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
	public String list1(@RequestParam(required = false) String searchValue, Model model) {
	    log.info("Received searchValue: {}", searchValue);
	    
	    // null이나 빈 값이 전달될 경우, 모든 데이터를 반환하는 방식 처리
	    if (searchValue == null || searchValue.trim().isEmpty()) {
	        searchValue = "";
	    }

	    // 서비스에서 부서 이동 이력 조회
	    List<DepTransferDto> changeHistoryList = departmentService.selectChangeHistory(searchValue);
	    
	    // 검색 결과를 모델에 추가
	    model.addAttribute("changeHistoryList", changeHistoryList);

	    // JSP 페이지 이름 반환 (departmentChangeHistory.jsp)
	    return "department/departmentChangeHistory";
	}



	
	@GetMapping("/departmentSearch")
	public void test2() {
	}
	

	
	
}
