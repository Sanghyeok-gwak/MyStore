package com.gd.mystore.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;

public interface NoteService {
	
	// 쪽지 수신 카운트
	int selectRecepCount(Map<String,Object> map);
	
	// 쪽지 발신 카운트 
	int selectSendCount(Map<String,Object> map);
	
	// 받은 쪽지함 리스트
	List<NoteDto> selectInBox(PageInfoDto pi,String empNo);
	
	// 보낸 쪽지함 리스트
	List<NoteDto> selectSendList(PageInfoDto pi,String empNo);
	
	// 임시 보관함 리스트
	List<NoteDto> selectTemporayList(PageInfoDto pi,String empNo);
	
	// 휴지통 리스트
	List<NoteDto> selectTrashNote(PageInfoDto pi,String empNo);
	
	// 쪽지함 휴지통 보내기
	int updateRece(Map<String, Object> map);
	
	// 휴지통 값 꺼내기
	int updateSendTrash(String[] checkedValues);
	
	// 쪽지 삭제
	int deleteNote(String[] checkedValues);
	
	// 받은 쪽지 상세페이지
	NoteDto selectDetail(Map<String,Object> map);
	
	// 회원 아이디 체크
	int checkEmp (String[] checkEmp);
	
	// 쪽지 보내기
	int insertNote(NoteDto noteDto) throws IOException;
	
	int recInsertTemp(NoteDto noteDto) throws IOException;
	
	// 쪽지 카운트
	int sideCount(String userNo);
	
	// 메인 쪽지 리스트
	List<NoteDto> selectMainNote(String no);
	// 메인 쪽지 카운트 (읽음)
	int selectReadNote(String no);
	// 메인 쪽지 카운트 (안읽음)
	int selectNoReadNote(String no);
}
