package com.gd.mystore.service;

import java.util.List;
import java.util.Map;

import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.PageInfoDto;

public interface BoardService {
	
	// 게시글 목록 조회 (페이징 처리)
		int selectBoardListCount();
		List<BoardDto> selectBoardList(PageInfoDto pi);
		
		
		// 게시글 검색 조회 (페이징 처리)
		int selectSearchListCount(Map<String, String> search);
		List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi);
		
		
		int insertBoard(BoardDto b);
}
