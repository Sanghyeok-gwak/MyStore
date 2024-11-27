package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.SendNoteDto;
import com.gd.mystore.dto.PageInfoDto;

public interface NoteService {
	
	// 받은 쪽지함 카운트
	int selectInBoxCount(String empNo);
	
	// 받은 쪽지함 리스트
	List<SendNoteDto> selectInBox(PageInfoDto pi,String empNo);
	
	// 쪽지 보내기 
	int sendNote(SendNoteDto noteDto);
	
	
}
