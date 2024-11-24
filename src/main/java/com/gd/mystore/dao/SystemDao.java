package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.LogDto;
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
	//사원 카운트
	public int selectEmpMemberCount() {
		return sqlSession.selectOne("systemMapper.selectEmpMemberCount");
	}
	//사원 데이터
	public List<EmpMemberDto> selectEmpMemberList(PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("systemMapper.selectEmpMemberList", null, rowBounds);
	}
	//사원 레벨 수정
	public int updateEmpLv(EmpMemberDto em2) {
		return sqlSession.update("systemMapper.updateEmpLv", em2);
	}
	
	//검색 카운트
	public int selectSearchListCount(String scData) {
		return sqlSession.selectOne("systemMapper.selectSearchListCount", scData);
	}
	//검색 데이터
	public List<EmpMemberDto> selectSearchEmpMemberList(PageInfoDto pi, String scData) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("systemMapper.selectSearchList", scData, rowBounds);
	}
	
	/*
	 *  ======================로그 페이지====================
	 */
	//로그 카운트
	public int selectLogCount() {
		return sqlSession.selectOne("systemMapper.selectLogCount");
	}
	//로그 데이터
	public List<LogDto> selectLogList(PageInfoDto pi){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("systemMapper.selectEmpLogList", null, rowBounds);
	}
	
	//검색용
	
	//로그 저장
	
	
}
