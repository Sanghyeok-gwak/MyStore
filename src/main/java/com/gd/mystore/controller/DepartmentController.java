package com.gd.mystore.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.DepartmentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/department")
public class DepartmentController {

	private final DepartmentService departmentService;
	
	// 부서 수정 페이지를 로드하는 메서드
	@GetMapping("/departmentModify")
	public String searchDepartment(@RequestParam(value = "empName", required = false) String empName,
	                               @RequestParam(value = "deptUpStair", required = false) String deptUpStair,
	                               Model model) {
	    List<DepartmentDto> searchResult = new ArrayList<>();
	    List<DepartmentDto> departmentTree = new ArrayList<>();

	    // empName 파라미터가 제공되면 이름으로 직원 검색
	    if (empName != null && !empName.trim().isEmpty()) {
	        // 이름이 있을 경우 검색된 직원 리스트
	        searchResult = departmentService.selectSearchEmployeeByName(empName);
	    } else {
	        // empName이 없으면 전체 직원 리스트
	        searchResult = departmentService.selectMemberList();
	    }

	    // deptUpStair 파라미터가 제공되면 부서 트리 조회
	    if (deptUpStair != null && !deptUpStair.trim().isEmpty()) {
	        // 상위 부서에 속하는 부서들 조회
	        departmentTree = departmentService.DeptTree(deptUpStair);
	    } else {
	        // deptUpStair가 없으면 전체 부서 트리 조회
	        departmentTree = departmentService.DeptTree("root");  // 예를 들어, 'root'로 모든 부서 트리 조회
	    }

	    // 결과가 있는 경우에만 모델에 데이터를 추가
	    if (!searchResult.isEmpty()) {
	        model.addAttribute("searchResult", searchResult);  // 직원 검색 결과
	    }

	    if (!departmentTree.isEmpty()) {
	        model.addAttribute("departmentTree", departmentTree);  // 부서 트리 결과
	    }

	    // 모델에 기본값을 추가할 수도 있음 (예: 빈 리스트 또는 메시지 등)
	    if (searchResult.isEmpty() && deptUpStair != null && !deptUpStair.trim().isEmpty()) {
	        model.addAttribute("noEmployeesFound", "상위 부서에 속한 직원이 없습니다.");
	    }

	    if (departmentTree.isEmpty() && empName != null && !empName.trim().isEmpty()) {
	        model.addAttribute("noDepartmentsFound", "직원에 대한 부서 정보가 없습니다.");
	    }

	    return "department/departmentModify";  // 부서 수정 페이지 JSP
	}



	// 직원 또는 부서 트리 데이터를 반환하는 API
	@GetMapping("/departmentModify/data")
	public @ResponseBody Map<String, Object> searchDepartmentData(
	        @RequestParam(value = "empName", required = false) String empName,
	        @RequestParam(value = "deptUpStair", required = false) String deptUpStair) {

	    List<DepartmentDto> departmentTree = new ArrayList<>();
	    List<DepartmentDto> searchResult = new ArrayList<>();
	    
	    // 직원 검색
	    if (empName != null && !empName.trim().isEmpty()) {
	        searchResult = departmentService.selectSearchEmployeeByName(empName);
	    } else {
	        searchResult = departmentService.selectMemberList();
	    }

	    // 부서 트리 조회
	    if (deptUpStair != null && !deptUpStair.trim().isEmpty()) {
	        departmentTree = departmentService.DeptTree(deptUpStair);
	    } else {
	        departmentTree = departmentService.DeptTree("root");
	    }

	    // 응답 전 로그 출력
	    log.debug("searchResult: {}", searchResult);  // 직원 검색 결과 확인
	    log.debug("departmentTree: {}", departmentTree);  // 부서 트리 결과 확인

	    Map<String, Object> response = new HashMap<>();
	    if (!searchResult.isEmpty()) {
	        response.put("searchResult", searchResult);
	    }
	    if (!departmentTree.isEmpty()) {
	        response.put("departmentTree", departmentTree);
	    }

	    return response;
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
