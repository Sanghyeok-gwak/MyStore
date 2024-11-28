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
public class ReplyDto {

	private int replyNo;
	private String replyContent;
	private int refBno;
	private String uprReplyNo;
	private String status;
	private String empNo;
	private String createDate;
	private int modifier;
	private String modifyDate;
	private String useYN;
	private String boardNo;
	
}
