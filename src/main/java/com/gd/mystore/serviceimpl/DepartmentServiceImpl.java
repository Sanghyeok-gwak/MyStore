package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.DepartmentDao;
import com.gd.mystore.dto.DepTransferDto;
import com.gd.mystore.dto.DepartmentDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.DepartmentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class DepartmentServiceImpl implements DepartmentService {

	 private final DepartmentDao departmentDao;
	
	@Override
	public List<DepartmentDto> selectMemberList() {
		
		return departmentDao.selectMemberList();
	}

	@Override
	public List<DepTransferDto> selectChangeHistory(String searchType, String searchValue, String startDate,
			String endDate) {
		 return departmentDao.selectChangeHistory(startDate, endDate, searchType, searchValue);
	}
	
	@Override
	public List<DepartmentDto> selectSearchEmployeeByName(String empName) {
		return departmentDao.selectSearchEmployeeByName(empName);
	}

	@Override
	public List<EmpMemberDto> DeptTree() {
		return departmentDao.DeptTree();
	}


	
}
