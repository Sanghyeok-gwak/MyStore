package com.gd.mystore.dto;

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

public class OrderingProductDto {
	private int productNo;
	private int orderCount;
	private String createDate;
	private String modifier;
	private String modifyDate;
	private String useYn;
	private int orderNo;
	private String productName;
}
