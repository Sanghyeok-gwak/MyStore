package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.BoardDao;
import com.gd.mystore.dto.BoardDto;
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
}
