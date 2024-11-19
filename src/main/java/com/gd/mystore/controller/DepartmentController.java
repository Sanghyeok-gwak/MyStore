package com.gd.mystore.controller;

import java.util.List;
import java.util.Map;

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
    public String search(
            @RequestParam Map<String, String> search,  // 검색 조건을 담을 Map 객체
            Model model) {

        // 검색 조건을 Map에서 추출
        String searchType = search.get("searchType");   // 예: 'empNo' or 'empName'
        String searchValue = search.get("searchValue"); // 예: 검색어
        String startDate = search.get("startDate");     // 시작 날짜
        String endDate = search.get("endDate");         // 종료 날짜

        // 검색 조건에 맞는 부서 이동 이력 리스트 조회
        List<DepTransferDto> list = departmentService.selectChangeHistory(searchType, searchValue, startDate, endDate);

        // 검색된 리스트, 검색 조건을 추가
        model.addAttribute("list", list);
        model.addAttribute("search", search);

        return "department/departmentChangeHistory"; // 결과를 표시할 JSP 뷰
    }

    @GetMapping("/departmentChangeHistory/data")
    public @ResponseBody List<DepTransferDto> getChangeHistoryData(
            @RequestParam Map<String, String> search) {

        // 검색 조건을 Map에서 추출
        String searchType = search.get("searchType");
        String searchValue = search.get("searchValue");
        String startDate = search.get("startDate"); // 시작 날짜
        String endDate = search.get("endDate");     // 종료 날짜

        // 검색 조건에 맞는 부서 이동 이력 리스트 조회
        List<DepTransferDto> list = departmentService.selectChangeHistory(searchType, searchValue, startDate, endDate);

        // JSON 형식으로 리스트 반환
        return list;
    }






	
	@GetMapping("/departmentSearch")
	public void test2() {
	}
	

	
	
}
