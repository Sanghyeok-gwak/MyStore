package com.gd.mystore.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class WorkStatusDto {

	private int empNo;			 // 사번
	private Date workDay;        // 일자
    private String dayOfWeek;    // 요일
    private String workType;     // 구 분
    private String workStartTime; // 출근시간
    private String workEndTime;   // 퇴근시간
    private int assignedLeave;   // 부여된연차
    private int availableLeave;  // 사용가능연차
    
    private String empName; 
    
}
