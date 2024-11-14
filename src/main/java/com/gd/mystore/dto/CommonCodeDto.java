package com.gd.mystore.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommonCodeDto {
	public String Cd;
	public String Nm;
	public String classificationNo;
	public String classificationName;
	public String creater;
	public String modify;
	public String createrDate;
	public String modifyDate;
}
