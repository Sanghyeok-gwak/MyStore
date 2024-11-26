package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class NoteDao {
	private final SqlSessionTemplate sqlSession;
	
	public int selectInBoxCount(String empNo){
		return sqlSession.selectOne("noteMapper.selectInBoxCount",empNo);
	}

	public List<NoteDto> selectInBox(PageInfoDto pi, String empNo){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("noteMapper.selectInBox",empNo,rowBounds);
	}
	
	public int sendNote(NoteDto noteDto) {
		return sqlSession.insert("noteMapper.sendNote",noteDto);
	}
	
}
