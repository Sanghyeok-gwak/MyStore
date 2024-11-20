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

public class OrderingListDto {
	private int orderNo;
	private String empNo;
	private String branchName;
	private String orderStatus;
	private String orderCheckDate;
	private String createDate;
	private String modifier;
	private String modifyDate;
	private String useYn;
	private List<OrderingProductDto> productList;
	
}
