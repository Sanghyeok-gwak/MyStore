package com.gd.mystore.service;

import java.util.List;
import java.util.Map;

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
	
	// 양식 상세수정페이지
	EDocSampleDto edocMode(int no);
	
	// 양식 수정
	int edocmodeModify(EDocSampleDto esd);
	
	// 게시글 검색 조회 (페이징 처리)
	int selectSearchListCount(Map<String, String> search);
	List<EDocSampleDto> selectSearchList(Map<String, String> search, PageInfoDto pi);
	
	
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
	
	
	// 결재 상세페이지
	// 결재 대기 상세페이지
	EDocDto aprvlWait(int no);
	
	// 결재 예정 상세페이지
	EDocDto aprvlscheduled(int no);
	
	// 결재 완료 상세페이지
	EDocDto aprvlcomplete(int no);
	
	// 결재자 정보 불러오기
	List<EDocApprovalDto>aprvlList(int no);
	
	
	// 결재 반려
	// 결재하기
	int aprvlcpl(EDocApprovalDto approval1, EDocApprovalDto approval2, EDocDto edocDto, String no);
	
	// 반려하기
	int aprvlrjt(EDocApprovalDto approval1, EDocApprovalDto approval2, EDocDto edocDto, String no);
	
	
	// 기안 상세페이지
	// 기안 대기 상세페이지
	EDocDto draftwait(int no);
	
	// 기안 진행 상세페이지
	EDocDto draftprogress(int no);
	
	// 기안 완료 상세페이지
	EDocDto draftcomplete(int no);
	
	// 기안 반려 상세페이지
	EDocDto draftreject(int no);
	
	// 기안 회수 상세페이지
	EDocDto draftrecovery(int no);
	
	// 기안서 회수
	int draftrcv(EDocApprovalDto approval1, EDocApprovalDto approval2, EDocDto edocDto);
	
	// 기안서 삭제
	int draftUseN(EDocDto edocDto);



	

	
}
