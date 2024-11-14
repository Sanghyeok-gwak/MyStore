package com.gd.mystore.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class EmpMemberDto {
    private int creater, modifier;
    private String empNo, empName, empGender, empBirth, empPhone, empEmail,
                   empAddress, empEmployment, empDetailAddress, empPostcode,
                   empPwd, empAuth, empRank, empProfile, deptCode,
                   useYn, acNo, acBank;
    private Date createDate, modifyDate;
}
