package com.gd.mystore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class EDocSampleDto {

	private int sampleNo;			// 양식번호
	private String sampleDotCode;	// 양식유형(일반, 휴가)
	private String sampleDesc;		// 샘플양식설명
	private String sampleFormat;	// 양식 서식
	private int empNo;				// 생성자
	private String createDt;		// 생성일
	private int modyfy;				// 수정자
	private String modifyDt;		// 수정일
	private String useYN;			// 사용여부(Y/N)
}
