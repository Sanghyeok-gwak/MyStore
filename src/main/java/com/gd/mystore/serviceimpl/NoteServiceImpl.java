package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.NoteDao;
import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.NoteService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service

public class NoteServiceImpl implements NoteService {
	private final NoteDao noteDao;

	@Override
	public int selectRecepCount(Map<String,Object> map) {
		return noteDao.selectRecepCount(map);
	}

	@Override
	public int selectSendCount(Map<String, Object> map) {
		return noteDao.selectSendCount(map);
	}
	
	@Override
	public List<NoteDto> selectInBox(PageInfoDto pi, String empNo) {
		return noteDao.selectInBox(pi,empNo);
	}

	@Override
	public List<NoteDto> selectSendList(PageInfoDto pi, String empNo) {
		return noteDao.selectSendList(pi,empNo);
	}

	@Override
	public List<NoteDto> selectTemporayList(PageInfoDto pi, String empNo) {
		return noteDao.selectTemporayList(pi,empNo);
	}

	@Override
	public List<NoteDto> selectTrashNote(PageInfoDto pi, String empNo) {
		return noteDao.selectTrashNote(pi,empNo);
	}



//	@Override
//	public int sendNote(SendNoteDto noteDto) {
//		return noteDao.sendNote(noteDto);
//	}
}
