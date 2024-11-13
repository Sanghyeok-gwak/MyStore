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
public class EDocApprovalDto {

	private int aprvlNo;			// 결재시퀀스번호
	private int aprvlEdocNo;		// 전자문서번호
	private int aprvlRank;			// 결재순서
	private String aprvlStatus;		// 결재여부(W / Y / N)
	private String aprvlComment;	// 결재의견
	private String aprvlDt;			// 결재일
	private String empNo;			// 결재자(사원번호)
}
