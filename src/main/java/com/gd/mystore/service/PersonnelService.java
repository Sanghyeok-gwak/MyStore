package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.EmpMemberDto;

public interface PersonnelService {
	
	// 전체 목록 조회
	List<EmpMemberDto> selectEmpList();
	
	// 사번으로 검색해서 사원 한개 조회
	EmpMemberDto selectEmpByNo(String empNo);
	
	// 사원으로 검색해서 사원 한개 조회
	EmpMemberDto selectEmpByName(String empName);
	
	// 사원등록
	 int insertEmp(EmpMemberDto e);
	 
	// 사원수정
	 int updateEmp(EmpMemberDto e);
}
