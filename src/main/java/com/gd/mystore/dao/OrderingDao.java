package com.gd.mystore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.OrderingListDto;
import com.gd.mystore.dto.OrderingProductDto;
import com.gd.mystore.dto.ProductDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class OrderingDao {
	private final SqlSessionTemplate sqlSession;
	
	public List<ProductDto> selectProductList(){
		return sqlSession.selectList("orderingMapper.selectProductList");
	}
	public int insertOrderingList(OrderingListDto orderingDto) {
		log.debug("orderingDto : {}",orderingDto);
		return sqlSession.insert("orderingMapper.insertOrderingList",orderingDto);
	}
	public int insertOrderingPro(OrderingProductDto productList) {
		log.debug("productList : {}",productList);
		return sqlSession.insert("orderingMapper.insertOrderingPro",productList);
	}
}
