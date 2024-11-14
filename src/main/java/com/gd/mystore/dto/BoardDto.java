package com.gd.mystore.dto;

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
public class BoardDto {

	private int boardNo;
	private int boardTypeNo;
	private String boardDept;
	private String boardTitle;
	private String boardContent;
	private int count;
	private int empNo;
	private String createDate;
	private int modifier;
	private String modifyDate;
	private String userYN;
	
	
}
