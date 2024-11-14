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
public class PersonnelDto {
	
    private int empNo;                    // 사번
    private String empName;                  // 이름
    private String empGender;                // 성별 (M/F)
    private String empBirth;                 // 생년월일
    private String empPhone;                 // 전화번호
    private String empEmail;                 // 이메일
    private String empAddress;               // 주소
    private String empEmployment;            // 재직 상태 (Y/N)
    private String empDetailAddress;         // 상세 주소
    private String empPostcode;              // 우편번호
    private String empPassword;              // 비밀번호
    private String empAuth;                  // 직책 코드 (PS004 등)
    private String empRank;                  // 직급 코드 (RK004 등)
    private String empProfile;               // 프로필 사진 경로
    private String deptCode;                 // 부서 코드
    private String createDate;               // 생성일
    private String modifyDate;               // 수정일
    private String creater;                  // 생성자
    private String modifier;                 // 수정자
    private String useYn;                    // 사용 여부 (Y/N)
    private String acNo;                     // 계좌번호
    private String acBank;                   // 은행명
    
}

