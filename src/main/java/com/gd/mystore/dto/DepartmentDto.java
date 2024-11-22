package com.gd.mystore.dto;

import java.util.List;

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
public class DepartmentDto {

	private String deptCode;
	private String deptUpStair;
	private String deptName;
	private int empNo;
	private String createDate;
	private int modifier;
	private String modifyDate;
	private String useYN;
	
	private String nm; // 부서 이름
	private String empName;
	 
	private List<DepartmentDto> children;

}
