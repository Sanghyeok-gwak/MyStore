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
public class BoardFileDto {

	private int boardFileNo;
	private String filePath;
	private String fileSystemName;
	private String originalName;
	private String uploadDate;
	private String refType;
	private int refNo;
	private String creater;
	private String createDate;
	private String modifier;
	private String modifyDate;
	private String useYN;
	
	
	
}
