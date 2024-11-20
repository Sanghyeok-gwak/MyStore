package com.gd.mystore.service;

import java.util.List;
import java.util.Map;

import com.gd.mystore.dto.DepTransferDto;
import com.gd.mystore.dto.DepartmentDto;

public interface DepartmentService {

	List<DepartmentDto> selectMemberList();

	List<DepTransferDto> selectChangeHistory(String startDate, String endDate, String searchType, String searchValue);

	List<DepartmentDto> selectSearchEmployeeByName(String empName);

	List<DepartmentDto> DeptTree(String deptUpStair);

	
}
