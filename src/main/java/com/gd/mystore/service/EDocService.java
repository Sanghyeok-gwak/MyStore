package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.DepartmentDto;
import com.gd.mystore.dto.EDocApprovalDto;
import com.gd.mystore.dto.EDocDto;
import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;

public interface EDocService {
	
	// 문서 양식 관리
	// 양식 목록 조회(페이징)
	int selectEDocListCount();
	List<EDocSampleDto> selectEDocFormList(PageInfoDto pi);
	
	// 양식 등록
	int insertEDocSample(EDocSampleDto es);
	
	// 양식 삭제
	int deleteEdocSample(String[] deleteNo);
	
	
	// 기안서 작성
	// 양식유형만 조회
	List<EDocSampleDto> selectEDocFormList();
	
	// 양식유형 선택후 양식을 가져오기
	EDocSampleDto selectEDocForm(int sampleNoInt);
	
	// jstree에 데이터 담기
	List<EmpMemberDto> selectEmployees(String no);
	
	// 기안서 담기
	int edocInsert(EDocDto edoc, List<EDocApprovalDto> approvalList);
}
