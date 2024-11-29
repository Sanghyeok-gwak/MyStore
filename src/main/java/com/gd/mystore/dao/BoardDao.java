package com.gd.mystore.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.BoardFileDto;
import com.gd.mystore.dto.GoodDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ReplyDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class BoardDao {
	
	private final SqlSessionTemplate sqlSession;

	public int selectBoardListCount(String type) {
		return sqlSession.selectOne("boardMapper.selectBoardListCount", type);
	}
	
	public List<BoardDto> selectBoardList(PageInfoDto pi, String type) {
		
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1 ) * pi.getBoardLimit() ,  pi.getBoardLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardList", type, rowBounds);
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

	public BoardDto selectBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int updateIncreaseCount(int boardNo) {
		return sqlSession.update("boardMapper.updateIncreaseCount", boardNo);
	}
	

	public List<BoardFileDto> selectDelAttach(String[] delFileNo) {
		return sqlSession.selectList("boardMapper.selectDelAttach", delFileNo);
	}
	
	public int updateBoard(BoardDto b) {
		return sqlSession.update("boardMapper.updateBoard" ,b);
		
	}
	
	public int deleteAttach(String[] delFileNo) {
		return sqlSession.delete("boardMapper.deleteAttach" , delFileNo);
	}
	
	
	public int replycount(int boardNo) {
		return sqlSession.selectOne("boardMapper.replycount", boardNo);
	}
	

	public List<ReplyDto> replylist(int boardNo){
		return sqlSession.selectList("boardMapper.replylist", boardNo);
	}
	
	
	public int insertReply(ReplyDto r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	public int insertGood(GoodDto d) {
		return sqlSession.insert("boardMapper.insertGood", d);
	}
	
	public int updateGood(GoodDto d) {
		return sqlSession.update("boardMapper.updateGood" , d);
		
	}
	public int checkGoodStatus(GoodDto g) {
		return sqlSession.update("boardMapper.checkGoodStatus" , g);
		
	}
	
	
	
	
	public int countGood(int replyNo) {
		return sqlSession.selectOne("boardMapper.countGood", replyNo);
	}
	
	public int deleteBoard(int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}
	
	public int deleteReplyCompletely(int replyNo) {
		return sqlSession.update("boardMapper.deleteReplyCompletely", replyNo);
	}

	public int replyUpdate(ReplyDto r) {
		return sqlSession.update("boardMapper.replyUpdate", r);
	}




	
}
