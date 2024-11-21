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
public class BoardTypeDto {

	private int boardTypeNo;
	private String boardtName;
	private String boardtType;
	private String boardtRead;
	private String boardtWrite;
	private String boardtContent;
	private String boardtUse;
	private String officeUse;
	private String deptCode;
	private int empNo;
	private Date createDate;
	private int modifier;
	private Date modifyDate;
	private String useYN;
}
