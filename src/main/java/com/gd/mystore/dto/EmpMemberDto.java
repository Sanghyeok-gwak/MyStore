package com.gd.mystore.dto;

import java.sql.Date;
import java.util.ArrayList;

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

    private String empNo
    			 , empName
    			 , empGender
    			 , empBirth
    			 , empPhone
    			 , empEmail
    			 , empAddress
    			 , empEmployment
    			 , empDetailAddress
    			 , empPostcode
    			 , empPwd
    			 , empAuth
    			 , empRank
    			 , empProfile
    			 , deptCode;
      private Date createDate
      			 , modifyDate;
       private int creater
       			 , modifier;
    private String useYn
    			 , acNo
    			 , acBank
    			 , listNo;
    
    private String workDay	 
				 , workStartTime
				 , workEndTime;
    
    private String nm;  // 부서에서 회원리스트 조회
    private String deptUpStair;
    private String deptName;
    
    private ArrayList<EmpMemberDto> lvList;
    

    
    
    
    
}
