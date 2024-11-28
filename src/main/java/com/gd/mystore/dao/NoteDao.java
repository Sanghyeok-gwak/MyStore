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
	
	public int updateRece(String checked) {
		return sqlSession.update("noteMapper.updateRece",checked);
	}
	public int updateSend(String checked) {
		return sqlSession.update("noteMapper.updateSend",checked);
	}
	public int updateRecepTrash(String rValue ) {
		return sqlSession.update("noteMapper.updateRecepTrash",rValue);
	}
	public int updateSendTrash(String sValue) {
		return sqlSession.update("noteMapper.updateSendTrash",sValue);
	}
	public int deletRecepTrash(String rValue) {
		return sqlSession.delete("noteMapper.deletRecepTrash",rValue);
	}
	public int deletSendTrash(String sValue) {
		return sqlSession.delete("noteMapper.deletSendTrash",sValue);
	}
	
	public NoteDto selectRecepDetail(String no) {
		return sqlSession.selectOne("noteMapper.selectRecepDetail",no);
	}
	public NoteDto selectSendDetail(String no){
		return sqlSession.selectOne("noteMapper.selectSendDetail",no);
	}
	public int checkEmp(String empNo) {
		return sqlSession.selectOne("noteMapper.checkEmp",empNo);
	}
	public int insertSendNote(NoteDto noteDto) {
		return sqlSession.insert("noteMapper.insertNote",noteDto);
	}
	public int insertRecepNote(NoteDto noteDto) {
		return sqlSession.insert("noteMapper.insertRecepNote",noteDto);
	}
	//public int sendNote(ReceptionNoteDto recepDto) {
	//	return sqlSession.insert("noteMapper.sendNote",recepDto);
	//}
	
}
