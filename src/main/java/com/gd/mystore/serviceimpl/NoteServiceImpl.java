package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.NoteDao;
import com.gd.mystore.dto.SendNoteDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.NoteService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service

public class NoteServiceImpl implements NoteService {
	private final NoteDao noteDao;

	@Override
	public int selectInBoxCount(String empNo) {
		return noteDao.selectInBoxCount(empNo);
	}

	@Override
	public List<SendNoteDto> selectInBox(PageInfoDto pi, String empNo) {
		return noteDao.selectInBox(pi,empNo);
	}

	@Override
	public int sendNote(SendNoteDto noteDto) {
		return noteDao.sendNote(noteDto);
	}
}
