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
public class WorkDto {
    private int modifier;
    private String 
    			   workNo
    			 , empNo
    			 , workTypeCode
			     , useYn
			     , workAttendance
			     , workStartTime
			     , workEndTime;
    private Date workDay, workPermit, createDate, modifyDate;
    
}
