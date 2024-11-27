package com.gd.mystore.service;

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
	
	
	// 쪽지 보내기 
	//int sendNote(SendNoteDto noteDto);
	
	
}
