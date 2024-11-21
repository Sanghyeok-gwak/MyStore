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
public class EDocAttachDto {

	private int attachNo;					// 첨부파일번호
	private int attachEDocRef;				// 전자문서번호
	private String attachOriginalName;		// 수정 전 이름
	private String attachRenameFileName;	// 수정 후 이름
	private int empNo;						// 생성자(사원번호)
	private String createDt;				// 생성일
	private int modyfy;						// 수정자(사원번호)
	private String modifyDt;				// 수정일
	private String filePath;				// 파일경로
}
