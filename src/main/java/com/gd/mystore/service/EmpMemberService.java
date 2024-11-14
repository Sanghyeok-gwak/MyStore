package com.gd.mystore.service;

import com.gd.mystore.dto.EmpMemberDto;

public interface EmpMemberService {
	//로그인
	EmpMemberDto selectEmpMember(EmpMemberDto em);
	
	//비밀번호 찾기
}
