package com.gd.mystore.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.BoardDao;
import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.BoardFileDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ReplyDto;
import com.gd.mystore.service.BoardService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardDao boardDao;
	   
	@Override
	public int selectBoardListCount(String type) {
		
		return boardDao.selectBoardListCount(type);
	}
	
	@Override
	public List<BoardDto> selectBoardList(PageInfoDto pi, String type) {
		
		return boardDao.selectBoardList(pi, type);
	}
	
	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return boardDao.selectSearchListCount(search);
	}
	
	@Override
	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return boardDao.selectSearchList(search, pi);
	}
	
	@Override
	public int insertBoard(BoardDto b) {
		
		int result = boardDao.insertBoard(b);
		
		List<BoardFileDto> list = b.getBoardList();
		if( result > 0  && !list.isEmpty()) {
			result = 0;
			for(BoardFileDto attach : list) {
			  result += boardDao.insertAttach(attach);
			}
			
		}
		return result;
	}

    @Override
    public List<BoardDto> selectDeptList() {
        // DAO에서 부서명 리스트 가져오기
        return boardDao.selectDeptList();
    }

    @Override
    public List<BoardDto> selectBoardNameList() {
        // DAO에서 게시판 유형 리스트 가져오기
        return boardDao.selectBoardNameList();
    }
	
	@Override
	public int updateIncreaseCount(int boardNo) {
		return boardDao.updateIncreaseCount(boardNo);
	}

	@Override
	public BoardDto selectBoard(int boardNo) {
		return boardDao.selectBoard(boardNo);
	}
	
	@Override
	public List<BoardFileDto> selectDelAttach(String[] delFileNo) {
		return delFileNo == null ? new ArrayList<>()
								: boardDao.selectDelAttach(delFileNo);
	}
	
	@Override
	public int updateBoard(BoardDto b, String[] delFileNo) {
		
		// 1) board테이블에 udpate
		int result1 = boardDao.updateBoard(b);
		
		// 2) attachment테이블에 delete
		int result2 = 1;
		if(result1 > 0 && delFileNo != null) {
			result2 = boardDao.deleteAttach(delFileNo);
		}
		
		// 3) attachment테이블에 insert
		List<BoardFileDto> list = b.getBoardList();
		int result3 = 0;
		for (BoardFileDto at : list) {
			result3 += boardDao.insertAttach(at);
		}
		
		// 성공에 대한 조건
		// result1이 1이여야됨
		// result2가 0보다 커야됨
		// result3가 list의 사이즈와 동일
		
		
		return result1 == 1
					&& result2 > 0
					 	&& result3 == list.size()
					 		? 1 : -1;
	}
	
	@Override
	public int replycount(int boardNo) {
		
		return boardDao.replycount(boardNo);
	}
	
	@Override
	public List<ReplyDto> replylist(int boardNo) {
		return boardDao.replylist(boardNo);
	}

	
	@Override
	public int insertReply(ReplyDto r) {
		return boardDao.insertReply(r);
	}

	
	
}
