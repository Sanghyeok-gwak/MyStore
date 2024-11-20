package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.mystore.dao.SystemDao;
import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.service.SystemService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SystemServiceImpl implements SystemService {
	
	private final SystemDao systemDao;
	
	@Override
	public List<BoardTypeDto> selectBodrList() {
		return systemDao.selectBoardList();
	}
	
	@ResponseBody
	@Override
	public void insertBoard(String userData) {
		systemDao.insertBoard(userData);
	}

	@Override
	public int boardUpdate(BoardTypeDto bt) {
		return systemDao.boardsUpdate(bt);
	}

}
