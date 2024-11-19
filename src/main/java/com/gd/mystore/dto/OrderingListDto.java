package com.gd.mystore.dto;

import java.sql.Date;

public class OrderingListDto {
	private int orderNo;
	private String empName;
//	ORDER_PRODUCT	VARCHAR2(500 BYTE)
	private String branchName;
	private String orderStatus;
	public String creater;
	public Date createDate;
	public String modifier;
	public Date modifyDate;
	public String deliveryDate;

}
