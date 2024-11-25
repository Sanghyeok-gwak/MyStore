package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gd.mystore.dao.BoardDao;
import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.BoardFileDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.BoardService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardDao boardDao;
	   
	@Override
	public int selectBoardListCount() {
		
		return boardDao.selectBoardListCount();
	}
	
	@Override
	public List<BoardDto> selectBoardList(PageInfoDto pi) {
		
		return boardDao.selectBoardList(pi);
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
	

	
	
	
}
