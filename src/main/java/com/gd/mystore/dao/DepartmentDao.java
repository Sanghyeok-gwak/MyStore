package com.gd.mystore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.DepTransferDto;
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

	public List<DepTransferDto> selectChangeHistory(String searchValue){
		return sqlSession.selectList("departmentMapper.selectChangeHistory", searchValue);
	}
}
