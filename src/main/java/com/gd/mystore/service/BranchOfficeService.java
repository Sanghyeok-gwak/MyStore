package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;

public interface BranchOfficeService {
	
	// 페이지네이션
	int selectProductListCount();
	
	// 상품 리스트 조회
	List<ProductDto> selectList(PageInfoDto pi);
	
	
		
}
