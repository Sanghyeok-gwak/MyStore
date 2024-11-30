package com.gd.mystore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	
	
	@GetMapping("/departmentModify.do")
	public String searchDepartment(@RequestParam(value = "empName", required = false) String empName,
	                               @RequestParam(value = "deptName", required = false) String deptName,  // deptName을 추가
	                               Model model) {
	    List<DepartmentDto> searchResult = new ArrayList<>();
	    List<EmpMemberDto> departmentTree = new ArrayList<>();
	 
	
	    
	    // 부서 트리 조회
	    departmentTree = departmentService.DeptTree();
	    
	    // empName 파라미터가 제공되면 이름으로 직원 검색
	    if (empName != null && !empName.trim().isEmpty()) {
	        searchResult = departmentService.selectSearchEmployeeByName(empName);
	    } else {
	        searchResult = departmentService.selectMemberList();
	    }

	    // 모델에 부서 트리와 직원 검색 결과 추가
	    if (!searchResult.isEmpty()) {
	        model.addAttribute("searchResult", searchResult);  // 직원 검색 결과
	    }
	    if (!departmentTree.isEmpty()) {
	        model.addAttribute("departmentTree", departmentTree);  // 부서 트리 결과
	    }
	  
	    // 결과가 없을 때 메시지 처리
	    if (searchResult.isEmpty()) {
	        model.addAttribute("noEmployeesFound", "해당하는 직원이 없습니다.");
	    }

	    if (departmentTree.isEmpty() && empName != null && !empName.trim().isEmpty()) {
	        model.addAttribute("noDepartmentsFound", "직원에 대한 부서 정보가 없습니다.");
	    }

	    // JSP 페이지 반환
	    return "department/departmentModify";
	}




	// 직원 또는 부서 트리 데이터를 반환하는 API
	@GetMapping("/departmentModify/data")
	public @ResponseBody Map<String, Object> searchDepartmentData(
	        @RequestParam(value = "empName", required = false) String empName,
	        @RequestParam(value = "deptName", required = false) String deptName  // deptName을 추가
	) {
	    List<EmpMemberDto> departmentTree = new ArrayList<>();
	    List<DepartmentDto> searchResult = new ArrayList<>();
	 
	    
	    // 부서 트리 조회
	    departmentTree = departmentService.DeptTree();
	    
	    // 직원 검색
	    if (empName != null && !empName.trim().isEmpty()) {
	        searchResult = departmentService.selectSearchEmployeeByName(empName);
	    } else {
	        searchResult = departmentService.selectMemberList();
	    }

	    // 결과를 담을 Map 생성
	    Map<String, Object> response = new HashMap<>();
	    if (!searchResult.isEmpty()) {
	        response.put("searchResult", searchResult);
	    }
	    if (!departmentTree.isEmpty()) {
	        response.put("departmentTree", departmentTree);
	    }
	   

	    return response;
	}

	
	@PostMapping("/departmentModify/data")
	@ResponseBody
	public Map<String, Object> modifyDepartment(@RequestBody DepartmentDto departmentDto) {

	    Map<String, Object> response = new HashMap<>();

	    try {
	        // 부서 추가 처리
	        if (departmentDto.getDeptCode() == null || departmentDto.getDeptCode().isEmpty()) {
	            // 부서 추가 로직
	            int insertResult = departmentService.insertDepartment(departmentDto);
	            if (insertResult > 0) {
	                response.put("success", true);
	                response.put("message", "부서 추가 완료");
	            } else {
	                response.put("success", false);
	                response.put("message", "부서 추가에 실패했습니다.");
	            }
	            return response;
	        }

	       

	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "오류 발생: " + e.getMessage());
	    }

	    return response;
	}

	// 부서 삭제 처리
	@PostMapping("/departmentModify/update")
	@ResponseBody
	public Map<String, Object> updateDepartment(@RequestBody DepartmentDto departmentDto) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        // 부서 삭제 처리
	    	 // 부서명 변경 처리
	        if (departmentDto.getDeptName() != null && !departmentDto.getDeptName().isEmpty()) {
	            int updateResult = departmentService.updateDepartmentName(departmentDto);
	            if (updateResult > 0) {
	                response.put("success", true);
	                response.put("message", "부서명이 변경되었습니다.");
	            } else {
	                response.put("success", false);
	                response.put("message", "부서명 변경에 실패했습니다.");
	            }
	        } else {
	            response.put("success", false);
	            response.put("message", "변경할 부서명이 존재하지 않습니다.");
	        }
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "오류 발생: " + e.getMessage());
	    }
	    return response;
	}

	
	
	
	
	// 부서 삭제 처리
	@PostMapping("/departmentModify/delete")
	@ResponseBody
	public Map<String, Object> deleteDepartment(@RequestBody DepartmentDto departmentDto) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        // 부서 삭제 처리
	        if (departmentDto.getDeptCode() != null && !departmentDto.getDeptCode().isEmpty()) {
	            int deleteResult = departmentService.deleteDepartment(departmentDto);
	            if (deleteResult > 0) {
	                response.put("success", true);
	                response.put("message", "부서 삭제 완료");
	            } else {
	                response.put("success", false);
	                response.put("message", "부서 삭제에 실패했습니다.");
	            }
	        } else {
	            response.put("success", false);
	            response.put("message", "삭제할 부서가 존재하지 않습니다.");
	        }
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "오류 발생: " + e.getMessage());
	    }
	    return response;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    @GetMapping("/departmentChangeHistory.do")
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


    

    @GetMapping("/departmentModify/search")
    @ResponseBody
    public Map<String, Object> getDepartmentInfo(@RequestParam String deptName) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // 부서 정보를 서비스에서 가져옴
            List<EmpMemberDto> deptList = departmentService.TeamList(deptName);
            
            // 부서 정보가 존재하는 경우
            if (deptList != null && !deptList.isEmpty()) {
                response.put("success", true);
                response.put("data", deptList);  // 부서 정보 리스트
            } else {
                response.put("success", false);
                response.put("message", "부서 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "오류 발생: " + e.getMessage());
        }
        
        return response;  // 응답을 JSON 형태로 반환
    }


	
	
}
