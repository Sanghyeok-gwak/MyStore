package com.gd.mystore.dto;

import java.util.ArrayList;

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

public class OrderingListDto {
	private int orderNo;
	private String empNo;
	private String deptCode;
	private String orderStatus;
	private String orderCheckDate;
	private String createDate;
	private String modifier;
	private String modifyDate;
	private String useYn;
	private int dispatchNo;
	private String approvalNo;
	private DispatchDto disList;
	private ArrayList<OrderingProductDto> productList;
	
}
