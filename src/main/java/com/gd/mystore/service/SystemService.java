package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.LogDto;
import com.gd.mystore.dto.PageInfoDto;

public interface SystemService {
	//시스템 게시글 유형 조회
	List<BoardTypeDto> selectBodrList();
	
	//시스템 게시글 추가
	void insertBoard(String userData);

	//시스템 게시글 유형 수정
	int boardUpdate(BoardTypeDto bt);
	
	//시스템 게시글 유형 삭제
	int boardDelete(BoardTypeDto bt);
	
	/*
	 * ======================사원 레벨 관련====================
	 */
	
	//사원 목록 조회 (전체)
	int selectEmpMemberCount(); //카운트
	List<EmpMemberDto> selectEmpMemberList(PageInfoDto pi); // 사원 리스트
	
	//사원 레벨 업데이트
	int updateEmpLv(EmpMemberDto em);
	
	//사원 검색 조회 (검색)
	int selectSearchListCount(String scData); //카운트
	List<EmpMemberDto> selectSearchEmpMemberList(PageInfoDto pi, String scData); // 사원 조회 리스트
	
	/*
	 * ======================시스템 로그 관련====================
	 */
	//로그 데이터 조회
	int selectLogCount(); //카운트
	List<LogDto> selectLogList(PageInfoDto pi); // 사원 리스트
	
	//검색용
	
	//로그 저장
	
	
	
}
