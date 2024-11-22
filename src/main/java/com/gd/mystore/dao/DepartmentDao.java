package com.gd.mystore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.DepTransferDto;
import com.gd.mystore.dto.DepartmentDto;
import com.gd.mystore.dto.EmpMemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class DepartmentDao {
	private final SqlSessionTemplate sqlSession;

	public List<DepartmentDto> selectMemberList() {
		return sqlSession.selectList("departmentMapper.selectMemberList");
	}


	   public List<DepTransferDto> selectChangeHistory(String startDate, String endDate, String searchType, String searchValue) {
		   Map<String, Object> params = new HashMap<>();
		   params.put("startDate", startDate);  // 시작 날짜
		   params.put("endDate", endDate);      // 종료 날짜
	        params.put("searchType", searchType);
	        params.put("searchValue", searchValue);

	        return sqlSession.selectList("departmentMapper.selectChangeHistory", params);
	    }


	   public List<DepartmentDto> selectSearchEmployeeByName(String empName) {
		    // 서비스에서 검색 조건으로 부서원 목록을 가져오는 코드
		    return sqlSession.selectList("departmentMapper.selectSearchEmployeeByName", empName);  // 예시: Mapper 호출
		}



		public List<EmpMemberDto> DeptTree() {
			 return sqlSession.selectList("departmentMapper.DeptTree");
		}


		public int insertDepartment(String deptName) {
			return sqlSession.insert("departmentMapper.insertDepartment",deptName);
		}


		public int updateDepartmentName(DepartmentDto d) {
			return sqlSession.update("departmentMapper.updateDepartmentName",d);
		}
		
		public List<DepartmentDto> getDeptCodeByName(String deptName) {
			return sqlSession.selectList("departmentMapper.getDeptCodeByName", deptName);
		}
		
		
		
		
}
