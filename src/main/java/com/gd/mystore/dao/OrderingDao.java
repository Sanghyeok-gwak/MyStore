package com.gd.mystore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.DispatchDto;
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
	
	public List<ProductDto> selectProductList(String dateTime){
		return sqlSession.selectList("orderingMapper.selectProductList",dateTime);
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
	public int updateApproval(OrderingListDto olDto) {
		return sqlSession.update("orderingMapper.updateApproval",olDto);
	}
	public List<DispatchDto> selectDispatchList(){
		return sqlSession.selectList("orderingMapper.selectDispatchList");
	}
	public DispatchDto selectRandomDispatch(int orderingNo) {
		return sqlSession.selectOne("orderingMapper.selectRandomDispatch",orderingNo);
	}
	public int searchCount(String search) {
		return sqlSession.selectOne("orderingMapper.searchCount",search);
	}
	public List<OrderingListDto> selectSearchList(PageInfoDto pi, String search){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("orderingMapper.selectSearchList",search,rowBounds);
	}
	
	public int updateOrderList(Map<String, Object> map) {
		
		return sqlSession.update("orderingMapper.updateOrderList",map);
	}
	
	public int updateOrderPro(OrderingProductDto productList) {
		return sqlSession.update("orderingMapper.updateOrderPro",productList);
	}
	
	
	public List<ProductDto> selectAddProList(){
		return sqlSession.selectList("orderingMapper.selectAddProList");
	}
	
	public int selectSearchDateCount(String date) {
		log.debug("asdf : "+sqlSession.selectOne("orderingMapper.selectSearchDateCount",date));
		return sqlSession.selectOne("orderingMapper.selectSearchDateCount",date);
	}
	public List<OrderingListDto> selectSearchDate(PageInfoDto pi, String date) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("orderingMapper.selectSearchDate",date,rowBounds);
	}
	
	
}
