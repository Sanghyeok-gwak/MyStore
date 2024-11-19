package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.CommonCodeDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;

public interface BranchOfficeService {
	
	
	// 상품 리스트 카운트 (본사)
	int selectProductListCount();
	
	// 상품 리스트 조회 (본사)
	List<ProductDto> selectList(PageInfoDto pi);
	
	// 상품 상세 조회 (본사)
	ProductDto selectDto(int prono);

	// 상품 공통 코드 조회 (본사)
	List<CommonCodeDto> selectCommonDto();
	 
	// 상품 수정 (본사)
	int updateProduct (ProductDto productDto);
	
	// 상품 등록 (본사)
	int insertProduct (ProductDto productDto);
	
	// 상품 삭제 (본사)
	int deleteProduct (String[] checkedValues);
	
	// 상품 검색 카운트 (본사)
	int searchCount (String searchValue);
	
	// 상품 검색 리스트 (본사)
	List<ProductDto> selectSearchList(PageInfoDto pi,String search);
	
	// 상품 리스트 조회(지점)
	List<ProductDto> selectProductList();
}
