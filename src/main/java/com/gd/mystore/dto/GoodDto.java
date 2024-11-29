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
public class GoodDto {

	
	private int replyNo;
	private String goodReply;
	private String creater;
	private String createDate;
	private int modifier;
	private String modifyDate;
	private String empName;
}
