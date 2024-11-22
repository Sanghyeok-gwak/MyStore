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
	
	// 기안서 작성
	int edocInsert(EDocDto edoc, List<EDocApprovalDto> approvalList);
	
	
	// 결재 목록 조회
	// 결재 대기 목록(페이징)
	int aprvlWaitListCount(String no);
	List<EDocDto> aprvlWaitList(String no, PageInfoDto pi);
	
	// 결재 예정 목록(페이징)
	int aprvlScheduledListCount(String no);
	List<EDocDto> aprvlScheduledList(String no, PageInfoDto pi);
	
	// 결재 완료 목록(페이징)
	int aprvlCompleteListCount(String no);
	List<EDocDto> aprvlCompleteList(String no, PageInfoDto pi);
	
	
	// 기안서 목록 조회
	// 기안 대기 목록(페이징)
	int draftWaitListCount(String no);
	List<EDocDto> draftWaitList(String no, PageInfoDto pi);
	
	// 기안 진행 문서(페이징)
	int draftProgressListCount(String no);
	List<EDocDto> draftProgressList(String no, PageInfoDto pi);
	
	// 기안 승인 문서(페이징)
	int draftCompleteListCount(String no);
	List<EDocDto> draftCompleteList(String no, PageInfoDto pi);
	
	// 기안 반려 문서(페이징)
	int draftRejectListCount(String no);
	List<EDocDto> draftRejectList(String no, PageInfoDto pi);
	
	// 기안 회수 문서(페이징)
	int draftRecoveryListCount(String no);
	List<EDocDto> draftRecoveryList(String no, PageInfoDto pi);
	
}
