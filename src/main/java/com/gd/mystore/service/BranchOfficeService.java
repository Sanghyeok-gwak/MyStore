package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.CommonCodeDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;

public interface BranchOfficeService {
	
	
	// 페이지네이션
	int selectProductListCount();
	
	// 상품 리스트 조회
	List<ProductDto> selectList(PageInfoDto pi);
	
	// 상품 상세 조회
	ProductDto selectDto(int prono);

	// 상품 공통 코드 조회
	List<CommonCodeDto> selectCommonDto();
	
	// 상품 수정
	int updateProduct (ProductDto productDto);
	
	// 상품 등록
	int insertProduct (ProductDto productDto);
}
