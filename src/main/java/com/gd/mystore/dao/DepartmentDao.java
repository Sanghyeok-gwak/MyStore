package com.gd.mystore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.DepTransferDto;
import com.gd.mystore.dto.DepartmentDto;

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

}
