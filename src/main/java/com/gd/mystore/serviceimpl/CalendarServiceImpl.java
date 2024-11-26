package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.CalendarDao;
import com.gd.mystore.dto.CalendarDto;
import com.gd.mystore.service.CalendarService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService {
	
	private final CalendarDao calendarDao;

	@Override
	public List<CalendarDto> selectEvents(String empNo) {
		return calendarDao.selectEvents(empNo);
	}
	@Override
	public List<CalendarDto> selectPersonalEvents(String empNo) {
		return calendarDao.selectPersonalEvents(empNo);
	}
	
	@Override
	public List<CalendarDto> selectAllCompanyEvents(String empNo) {
		return calendarDao.selectAllCompanyEvents(empNo);
	}

	@Override
	public int addEvent(CalendarDto c) {
		return calendarDao.addEvent(c);
	}

	@Override
	public int updateEvent(CalendarDto c) {
		return calendarDao.updateEvent(c);
	}

	@Override
	public int deleteEvent(int calNo) {
		return calendarDao.deleteEvent(calNo);
	}


}
