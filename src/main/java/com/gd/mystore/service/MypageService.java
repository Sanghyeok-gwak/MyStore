package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.WorkStatusDto;

public interface MypageService {
	
	// 마이페이지 수정
	int updateEmployee(EmpMemberDto e);
			
	// 사원비밀번호변경
	int passwordRecovery(EmpMemberDto e);

	// 비밀번호 확인
	int selectEmpPwd(String checkpwd);
	
	
	int selectworkStatusCount(int empNo);
	List<WorkStatusDto> selectworkStatusList(PageInfoDto pi, int empNo);
	String selectEmpName(int empNo);
	
}
