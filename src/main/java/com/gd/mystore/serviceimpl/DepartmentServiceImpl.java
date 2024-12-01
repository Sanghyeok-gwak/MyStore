package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public int updateDepartmentName(DepartmentDto d) {
		return departmentDao.updateDepartmentName(d);
	}

	@Override
	public List<DepartmentDto> getDeptCodeByName(String deptName) {
		return departmentDao.getDeptCodeByName(deptName);
	}

	@Override
	public List<EmpMemberDto> TeamList(String deptName) {
		
		return departmentDao.TeamList(deptName);
	}

	@Override
	public int insertDepartment(DepartmentDto departmentDto) {
		return departmentDao.insertDepartment(departmentDto);
	}

	@Override
	public int deleteDepartment(DepartmentDto d) {
		return departmentDao.deleteDepartment(d);
	}

	   @Transactional
	    @Override
	    public int moveDept(Map<String, Object> params) {
	        // 1. 부서 이동 기록 삽입
	        int insertHistory = departmentDao.insertTransferHistory(params);
	        if (insertHistory == 0) {
	            throw new RuntimeException("부서 이동 기록 삽입 실패");
	        }

	        // 2. 직원 부서 코드 업데이트
	        int updateEmployee = departmentDao.updateEmployeeDepartment(params);
	        if (updateEmployee == 0) {
	            throw new RuntimeException("직원 부서 코드 업데이트 실패");
	        }

	        // 3. 이동 후 부서 기록 삽입
	        int updateAfterDept = departmentDao.updateAfterDept(params);
	        if (updateAfterDept == 0) {
	            throw new RuntimeException("이동 후 부서 기록 삽입 실패");
	        }

	        return 1;  // 모든 작업이 성공적으로 수행되면 1을 반환
	    }




	
	
}
