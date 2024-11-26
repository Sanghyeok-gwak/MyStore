package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.CalendarDto;

public interface CalendarService {
	
	// 이벤트 조회
	List<CalendarDto> selectEvents(String empNo);

	List<CalendarDto> selectPersonalEvents(String empNo);
	
	List<CalendarDto> selectAllCompanyEvents(String empNo);

    // 새로운 이벤트 추가
    int addEvent(CalendarDto calendarDto);

    // 기존 이벤트 수정
    int updateEvent(CalendarDto calendarDto);

    // 기존 이벤트 삭제
    int deleteEvent(int calNo);

}
