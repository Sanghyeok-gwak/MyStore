package com.gd.mystore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.WorkDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class WorkDao {
	
	private final SqlSessionTemplate sqlSession;

	public void empAllWorkInser() {
		sqlSession.insert("workMapper.empAllWorkInser");
	}

	public List<WorkDto> selectWorkCheck(EmpMemberDto em) {
		return sqlSession.selectList("workMapper.workCheck", em);
	}

	public int updateStTime(EmpMemberDto em) {
		return sqlSession.update("workMapper.empWorkStartTime", em);
	}

	public int updateEndTime(EmpMemberDto em) {
		return sqlSession.update("workMapper.empWorkEndTime", em);
	}
	
	public int updateWorkStatus(WorkDto workData) {
		return sqlSession.update("workMapper.", workData);
	}
}
