package com.gd.mystore.dto;

import java.sql.Date;
import java.util.ArrayList;

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
public class LogDto {
    private int
    		       logNo
    		     , modifier
    		     , listNo;
    private String 
    			   empNo
    			 , logType
    			 , menuName
    			 , beforData
    			 , afterData
    			 , useYn
    			 , documentNo;
    private Date 
    			   createDate
    		     , modifyDate;
}
