package com.gd.mystore.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EmpMemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class EmpMemberDao {
	
	private final SqlSessionTemplate sqlSession;
	
	public EmpMemberDto selectEmpMember(EmpMemberDto em) {
		System.out.println("다오 진입" + em.getEmpNo());
		return sqlSession.selectOne("empMemberMapper.selectEmpMember", em);
	}
	
	
	
}
