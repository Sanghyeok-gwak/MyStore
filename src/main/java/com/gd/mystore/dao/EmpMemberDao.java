package com.gd.mystore.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EmpMemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class EmpMemberDao {
	
	private final SqlSessionTemplate sqlSession;
	
	public EmpMemberDto selectEmpMember(EmpMemberDto em) {
		System.out.println("dao 들어온 값 : " + em.toString());
		return sqlSession.selectOne("empMemberMapper.selectEmpMember", em);
	}

	public int updatePwdMember(EmpMemberDto em) {
		return sqlSession.update("empMemberMapper.updateEmpMember", em);
	}
	
	
	
}
