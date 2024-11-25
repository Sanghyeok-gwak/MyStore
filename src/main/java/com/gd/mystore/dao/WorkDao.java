package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.LogDto;
import com.gd.mystore.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class WorkDao {
	
	private final SqlSessionTemplate sqlSession;

	public void empAllWorkInser() {
		sqlSession.insert("workMapper.empAllWorkInser");
	}
	
	
	
	
}
