package com.gd.mystore.service;

import java.util.List;
import java.util.Map;

import com.gd.mystore.dto.OrderingListDto;
import com.gd.mystore.dto.OrderingProductDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;

public interface OrderingService {
	
	// 상품 리스트
	List<ProductDto> selectProductList();
	
	// 발주 카운트
	int selectOrderListCount();
	
	// 발주 리스트
	List<OrderingListDto> selectOrderList(PageInfoDto pi);
	
	// 발주 상품 리스트
	List<OrderingProductDto> selectOrderProductList(int orderingNo);
	
	
	// 발주 등록 
	int insertOrderingList(OrderingListDto orderingDto,List<OrderingProductDto> orderingProList );
	
	// 발주 반려 
	int updateCompanion(OrderingListDto olDto);
}
