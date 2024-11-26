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

    
	   private int workNo
    			 , empNo;
    private String workTypeCode;
	  private Date workDay;
    private String workStartTime
			     , workEndTime
			     , workPermit;
	  private Date createDate;
       private int modifier;      		     
      private Date modifyDate;
	private String useYn;
    private String workAttendance;
    
}
