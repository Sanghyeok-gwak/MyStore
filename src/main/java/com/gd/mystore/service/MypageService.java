package com.gd.mystore.service;

import com.gd.mystore.dto.EmpMemberDto;

public interface MypageService {
	
	// 마이페이지 수정
	int updateEmployee(EmpMemberDto e);
			
	// 사원비밀번호변경
	int passwordRecovery(EmpMemberDto e);

	// 비밀번호 확인
	int selectEmpPwd(String checkpwd);

}
