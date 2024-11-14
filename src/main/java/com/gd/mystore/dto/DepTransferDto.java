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
public class DepTransferDto {

	private String transferCode;
	private String transferBefore;
	private String transferAfter;
	private String transferDate;
	private int empNo;
	private String createDate;
	private int modifier;
	private String modifyDate; 
	private String useYN;
}
