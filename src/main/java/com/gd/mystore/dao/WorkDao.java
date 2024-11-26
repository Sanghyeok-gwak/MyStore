package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.LogDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.WorkDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class WorkDao {
	
	private final SqlSessionTemplate sqlSession;

	public void empAllWorkInser() {
		sqlSession.insert("workMapper.empAllWorkInser");
	}

	public List<WorkDto> selectWorkCheck() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
