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
public class SalaryDto {
	
    private int salaryNo;                   // 급여 고유 번호
    private String empNo;                      // 사원 번호
    private String salBase;                 // 기본 급여
    private String salOvertimePay;          // 시간 외 수당
    private String bonus;                   // 상여금
    private String salGrossPay;             // 총 지급 금액
    private String salNp;                   // 국민 연금
    private String salHi;                   // 건강 보험
    private String salEi;                   // 고용 보험
    private String salTotalDd;              // 총 공제 금액
    private String salNetSalary;            // 실 지급액
    private String creater;                 // 생성자
    private String createDate;              // 생성일
    private String modifier;                // 수정자
    private String modifyDate;              // 수정일
    
    private String empName;                 // 사원이름
}
