package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.BranchOfficeDao;
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



}
