package com.gd.mystore.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EmpMemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MypageDao {
	
	private final SqlSessionTemplate sqlSession;

	// 마이페이지 수정
	public int updateEmployee(EmpMemberDto e) {
		return sqlSession.update("personnelMapper.updateEmployee", e);
	}
	
	// 비밀번호 변경
	public int passwordRecovery(EmpMemberDto e) {
		return sqlSession.update("personnelMapper.passwordRecovery", e);
	}
	
	// 비밀번호 확인
	public int selectEmpPwd(String checkpwd)	{
		return sqlSession.selectOne("personnelMapper.selectEmpPwd", checkpwd);
	}
	
	
	
}
