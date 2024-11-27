package com.gd.mystore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class NoteDao {
	private final SqlSessionTemplate sqlSession;
	
	public int selectRecepCount(Map<String,Object> map){
		return sqlSession.selectOne("noteMapper.selectRecepCount",map);
	}
	public int selectSendCount(Map<String,Object> map){
		return sqlSession.selectOne("noteMapper.selectSendCount",map);
	}

	public List<NoteDto> selectInBox(PageInfoDto pi, String empNo){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("noteMapper.selectInBox",empNo,rowBounds);
	}
	
	public List<NoteDto> selectSendList(PageInfoDto pi, String empNo){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("noteMapper.selectSendList",empNo,rowBounds);
	}
	
	public List<NoteDto> selectTemporayList(PageInfoDto pi, String empNo){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("noteMapper.selectTemporayList",empNo,rowBounds);
	}
	public List<NoteDto> selectTrashNote(PageInfoDto pi, String empNo){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("noteMapper.selectTrashNote",empNo,rowBounds);
	}
	
	
	//public int sendNote(ReceptionNoteDto recepDto) {
	//	return sqlSession.insert("noteMapper.sendNote",recepDto);
	//}
	
}
