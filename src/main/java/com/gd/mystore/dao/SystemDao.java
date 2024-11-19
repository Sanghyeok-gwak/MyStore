package com.gd.mystore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.BoardTypeDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class SystemDao {
	
	private final SqlSessionTemplate sqlSession;
	
	public List<BoardTypeDto> selectBoardList() {
		return sqlSession.selectList("systemMapper.selectSystemBoardList");
	}

	public void insertBoard(String userData) {
		sqlSession.insert("systemMapper.insertBoard", userData);
	}

	public void boardsUpdate(BoardTypeDto bt) {
		sqlSession.update("systemMapper.boardsUpdate", bt);
	}

}
