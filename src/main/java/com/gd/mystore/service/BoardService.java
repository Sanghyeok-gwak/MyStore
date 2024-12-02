package com.gd.mystore.service;

import java.util.List;
import java.util.Map;

import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.BoardFileDto;
import com.gd.mystore.dto.GoodDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ReplyDto;

public interface BoardService {
	
	// 게시글 목록 조회 (페이징 처리)
		int selectBoardListCount(String type);
		List<BoardDto> selectBoardList(PageInfoDto pi, String type);
		
		
		// 게시글 검색 조회 (페이징 처리)
		int selectSearchListCount(Map<String, String> search);
		List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi);
		

		// 게시글 등록
		int insertBoard(BoardDto b);
		
	
		List<BoardDto> selectDeptList();
		
		List<BoardDto> selectBoardNameList();
	
		// 게시글 상세 - 조회수 증가
		int updateIncreaseCount(int boardNo);
		
		// 게시글 상세 - 게시글 조회 
		BoardDto selectBoard(int boardNo);
				
		// 게시글 수정
		List<BoardFileDto> selectDelAttach(String[] delFileNo);
		int updateBoard(BoardDto board, String[] delFileNo);
		
		int replycount(int boardNo);
		
		
		List<ReplyDto> replylist(int boardNo);
		
		// 댓글 등록 
		int insertReply(ReplyDto r);
		
		// 좋아요 등록
		int insertGood(GoodDto d);
		
		// 좋아요 상태확인
		int checkGoodStatus(GoodDto g);
		
		// 좋아요 상태변경
		int updateGood(GoodDto d);
		
		int countGood(int replyNo);
		
		// 게시글 삭제 
		int deleteBoard(int boardNo);
		
		// 댓글 완전삭제 (스케줄러에 의해 작동)
		int deleteReplyCompletely(int replyNo);
		
		int replyUpdate(ReplyDto r);
		
		List<BoardDto> selectmainBoardList();
		
		BoardDto getBoardTypeName(String boardTypeNo);
		
		
}
