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
public class EDocDto {
	private int edocNo;				// 전자문서 번호
	private String edocDotType;		// 문서양식 타입
	private String edocTitle;		// 문서제목
	private String edocContent;		// 문서내용
	private String startDt;			// 시작일시
	private String endDt;			// 종료일시 (시작일 + 14일)
	private String finalDt;			// 완료일시
	private String edocStatus;		// 문서상태( t(임시저장), s(결재대기), o(결재진행), f(결재완료), r(결재반려) )
	private int empNo;				// 기안자(생성자)
	private int modyfy;				// 수정자
	private	String modifyDt;		// 수정일
	private String useYN;			// 사용여부(Y/N)
}
