package com.gd.mystore.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.BoardFileDto;
import com.gd.mystore.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class BoardDao {
	
	private final SqlSessionTemplate sqlSession;

	public int selectBoardListCount() {
		return sqlSession.selectOne("boardMapper.selectBoardListCount");
	}
	
	public List<BoardDto> selectBoardList(PageInfoDto pi) {
		
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1 ) * pi.getBoardLimit() ,  pi.getBoardLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardList", null, rowBounds);
	}
	
	public int selectSearchListCount(Map<String, String> search) {
		return sqlSession.selectOne("boardMapper.selectSearchListCount", search);
	}
	
	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1 ) * pi.getBoardLimit() ,  pi.getBoardLimit());
		
		return sqlSession.selectList("boardMapper.selectSearchList", search, rowBounds);
	}

	public int insertBoard(BoardDto b) {
			
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertAttach(BoardFileDto attach) {
		return sqlSession.insert("boardMapper.insertAttach", attach);
	}
	

    public List<BoardDto> selectDeptList() {
    	
        return sqlSession.selectList("boardMapper.deptName");
    }


    public List<BoardDto> selectBoardNameList() {
        return sqlSession.selectList("boardMapper.boardtName");
    }


	
}
