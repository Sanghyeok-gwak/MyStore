package com.gd.mystore.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CalendarDto {
	
	private int calNo;           // 일정 번호
	private String empNo;
    private Date calStartDate;   // 일정 시작 날짜
    private Date calEndDate;     // 일정 종료 날짜
    private String calSubject;   // 일정 제목
    private String calColor;     // 일정 색상 (R, B)
	
	

}
