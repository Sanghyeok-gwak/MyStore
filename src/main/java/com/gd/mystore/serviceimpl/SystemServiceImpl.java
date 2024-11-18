package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

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

}
