package com.gd.mystore.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DispatchDto {

	private int dispathchNo;
//	DISPATCH_NO	NUMBER
	private String vehicleType;
//	VEHICLE_TYPE	VARCHAR2(300 BYTE)
	private String licensPlate;
//	LICENSE_PLATE	VARCHAR2(300 BYTE)
	private String opepator;
//	OPERATOR	VARCHAR2(300 BYTE)
	private String empNo;
//	EMP_NO	NUMBER
	private String modifier;
//	MODIFIER	NUMBER
	private String createDate;
//	CREATE_DATE	DATE
	private String modifyDate;
//	MODIFY_DATE	DATE
	private String useYn;
//	USE_YN	CHAR(1 BYTE)
}
