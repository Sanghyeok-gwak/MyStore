package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.mystore.dao.SystemDao;
import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
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

	@Override
	public int boardDelete(BoardTypeDto bt) {
		return systemDao.boardDelete(bt);
	}

	/*
	 * 시스템 레벨 설정 관련
	 */
	@Override
	public int selectEmpMemberCount() {
		return systemDao.selectEmpMemberCount();
	}

	@Override
	public List<EmpMemberDto> selectEmpMemberList(PageInfoDto pi) {
		return systemDao.selectEmpMemberList(pi);
	}

	@Override
	public int selectSerchListCount(Map<String, String> search) {
		return 0;
	}

	@Override
	public List<EmpMemberDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}

}
