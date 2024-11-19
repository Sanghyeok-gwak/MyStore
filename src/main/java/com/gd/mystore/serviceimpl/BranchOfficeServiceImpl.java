package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.BranchOfficeDao;
import com.gd.mystore.dto.CommonCodeDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;
import com.gd.mystore.service.BranchOfficeService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BranchOfficeServiceImpl implements BranchOfficeService {
	
	private final BranchOfficeDao boDao;
	
	@Override
	public int selectProductListCount() {
		return boDao.selectProductListCount();
	}

	@Override
	public List<ProductDto> selectList(PageInfoDto pi) {
		return boDao.selectList(pi);
	}

	@Override
	public ProductDto selectDto(int prono) {
		return boDao.selectDto(prono);
	}

	@Override
	public List<CommonCodeDto> selectCommonDto() {
		return boDao.selectCommonDto();
	}

	@Override
	public int updateProduct(ProductDto productDto) {
		return boDao.updateProduct(productDto);
	}

	@Override
	public int insertProduct(ProductDto productDto) {
		return boDao.insertProduct(productDto);
	}

	@Override
	public int deleteProduct(String[] checkedValues) {
		return boDao.deleteProduct(checkedValues);
	}

	@Override
	public int searchCount(String searchValue) {
		return boDao.searchCount(searchValue);
	}

	@Override
	public List<ProductDto> selectSearchList(PageInfoDto pi, String search) {
		return boDao.selectSearchList(pi,search);
	}

	@Override
	public List<ProductDto> selectProductList() {
		return boDao.selectProductList();
	}
	
	


}
