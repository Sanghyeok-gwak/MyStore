package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.BoardTypeDto;

public interface SystemService {
	//시스템 게시글 유형 조회
	List<BoardTypeDto> selectBodrList();
	
	//시세틈 게시글 추가
	void insertBoard(String userData);

	//시스템 게시글 유형 수정
	void boardUpdate(BoardTypeDto bt);
	
	//시스템 게시글 유형 삭제
	
	
	
	
}
