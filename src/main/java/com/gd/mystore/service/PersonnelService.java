package com.gd.mystore.service;

import java.util.List;
import java.util.Map;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.SalaryDto;

public interface PersonnelService {
	
	/*
	// 전체 목록 조회
	List<EmpMemberDto> selectEmpList();
	*/
	
	// 사번으로 검색해서 사원 한개 조회
	EmpMemberDto selectEmpByNo(String empNo);
	
	// 사원으로 검색해서 사원 한개 조회
	EmpMemberDto selectEmpByName(String empName);
	
	// 사원등록
	 int insertEmp(EmpMemberDto e);
	 
	// 사원수정
	 int updateEmp(EmpMemberDto e);
	 
	// 퇴사처리
	 int updatequit(EmpMemberDto e);
	 
	// 사원 목록 조회 (페이징 처리)
	 int selectEmpListCount();
	 List<EmpMemberDto> selectEmpList(PageInfoDto pi);
	    
	// 사원 검색 조회 (페이징 처리)
	 int selectSearchListCount(Map<String, String> search);
	 List<EmpMemberDto> selectSearchList(Map<String, String> search, PageInfoDto pi);
	 
	 //신규사원 근태 추가
	 int workInsertEmp(EmpMemberDto e);
	 
}
