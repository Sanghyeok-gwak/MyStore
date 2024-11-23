package com.gd.mystore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.OrderingListDto;
import com.gd.mystore.dto.OrderingProductDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class OrderingDao {
	private final SqlSessionTemplate sqlSession;
	
	
	public int selectOrderListCount() {
		return sqlSession.selectOne("orderingMapper.selectOrderListCount");
	}
	
	public List<OrderingListDto> selectOrderList(PageInfoDto pi){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("orderingMapper.selectOrderList",null,rowBounds);
	}
	public List<OrderingProductDto> selectOrderProductList(int orderingNo){
		return sqlSession.selectList("orderingMapper.selectOrderProductList",orderingNo);
	}
	
	public List<ProductDto> selectProductList(){
		return sqlSession.selectList("orderingMapper.selectProductList");
	}
	public int insertOrderingList(OrderingListDto orderingDto) {
		return sqlSession.insert("orderingMapper.insertOrderingList",orderingDto);
	}
	public int insertOrderingPro(OrderingProductDto productList) {
		return sqlSession.insert("orderingMapper.insertOrderingPro",productList);
	}
	
	public int updateCompanion(OrderingListDto olDto) {
		return sqlSession.update("orderingMapper.updateCompanion",olDto);
	}
}
