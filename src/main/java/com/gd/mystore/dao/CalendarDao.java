package com.gd.mystore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.CalendarDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CalendarDao {

	private final SqlSessionTemplate sqlsession;
	
	// 이벤트 조회
	public List<CalendarDto> selectEvents(String empNo){
		return sqlsession.selectList("calendarMapper.selectCalendarEvents", empNo);
	}
	
	public List<CalendarDto> selectPersonalEvents(String empNo){
		return sqlsession.selectList("calendarMapper.selectPersonalEvents", empNo);
	}
	
	public List<CalendarDto> selectAllCompanyEvents(String empNo){
		return sqlsession.selectList("calendarMapper.selectAllCompanyEvents", empNo);
	}
	
	// 이벤트 등록
	public int addEvent(CalendarDto c) {
		return sqlsession.insert("calendarMapper.insertCalendarEvent", c);
	}
	
	// 이벤트 수정
	public int updateEvent(CalendarDto c) {
		return sqlsession.update("calendarMapper.updateCalendarEvent", c);
	}
	
	// 이벤트 삭제 
	public int deleteEvent(int calNo) {
		return sqlsession.delete("calendarMapper.deleteCalendarEvent", calNo);
	}
	
	
}
