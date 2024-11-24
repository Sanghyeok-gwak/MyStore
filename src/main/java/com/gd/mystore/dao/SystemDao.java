package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;

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

	public int boardsUpdate(BoardTypeDto bt) {
		return sqlSession.update("systemMapper.boardsUpdate", bt);
	}

	public int boardDelete(BoardTypeDto bt) {
		return sqlSession.delete("systemMapper.boardsDelete", bt);
	}
	/*
	 *  ======================사원 레벨 페이지====================
	 */
	public int selectEmpMemberCount() {
		return sqlSession.selectOne("systemMapper.selectEmpMemberCount");
	}

	public List<EmpMemberDto> selectEmpMemberList(PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("systemMapper.selectEmpMemberList", null, rowBounds);
	}
	
	public int updateEmpLv(EmpMemberDto em2) {
		return sqlSession.update("systemMapper.updateEmpLv", em2);
	}

	public int selectSearchListCount(String scData) {
		return sqlSession.selectOne("systemMapper.selectSearchListCount", scData);
	}

	public List<EmpMemberDto> selectSearchEmpMemberList(PageInfoDto pi, String scData) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("systemMapper.selectSearchList", scData, rowBounds);
	}


}
