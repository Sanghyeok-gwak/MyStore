package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.BoardTypeDto;

public interface SystemService {
	//시스템 게시글 유형 조회
	List<BoardTypeDto> selectBodrList();
	
	
	
}
