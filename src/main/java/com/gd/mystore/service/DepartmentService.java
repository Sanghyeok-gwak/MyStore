package com.gd.mystore.service;

import java.util.List;
import java.util.Map;

import com.gd.mystore.dto.DepTransferDto;
import com.gd.mystore.dto.DepartmentDto;
import com.gd.mystore.dto.EmpMemberDto;

public interface DepartmentService {

	List<DepartmentDto> selectMemberList();

	List<DepTransferDto> selectChangeHistory(String startDate, String endDate, String searchType, String searchValue);

	List<DepartmentDto> selectSearchEmployeeByName(String empName);

	List<EmpMemberDto> DeptTree();

	int insertDepartment(DepartmentDto departmentDto);

	int updateDepartmentName(DepartmentDto d);
	
	int deleteDepartment (DepartmentDto d );
	
	List<DepartmentDto> getDeptCodeByName(String deptName);

	List<EmpMemberDto> TeamList(String deptName);

	int moveDept(Map<String, Object> params);

	List<DepartmentDto> getUpDepartments();

	List<DepartmentDto> getDeptNames();



	

}
