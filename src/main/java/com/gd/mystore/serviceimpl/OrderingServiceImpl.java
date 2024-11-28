package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.OrderingDao;
import com.gd.mystore.dto.DispatchDto;
import com.gd.mystore.dto.OrderingListDto;
import com.gd.mystore.dto.OrderingProductDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;
import com.gd.mystore.service.OrderingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class OrderingServiceImpl implements OrderingService{
	
	private final OrderingDao orderingDao;
	
	@Override
	public List<ProductDto> selectProductList(String dateTime) {
		return orderingDao.selectProductList(dateTime);
	}

	@Override
	public int selectOrderListCount() {
		return orderingDao.selectOrderListCount();
	}
	
	@Override
	public List<OrderingListDto> selectOrderList(PageInfoDto pi) {
		return orderingDao.selectOrderList(pi);
	}
	@Override
	public List<OrderingProductDto> selectOrderProductList(int orderingNo) {
		return orderingDao.selectOrderProductList(orderingNo);
	}
	
	@Override
	public int insertOrderingList(OrderingListDto orderingDto, List<OrderingProductDto> orderingProList) {
		
		int result = orderingDao.insertOrderingList(orderingDto);
		
		if(result> 0 && !orderingProList.isEmpty()) {
			result=0;
			for(OrderingProductDto list :orderingProList ) {
				result += orderingDao.insertOrderingPro(list);
			}
		}else {
			log.debug("버그다");
		}
		
		return result;
	}

	@Override
	public int updateCompanion(OrderingListDto olDto) {
		return orderingDao.updateCompanion(olDto);
	}
	@Override
	public int updateApproval(OrderingListDto olDto) {
		return orderingDao.updateApproval(olDto);
	}
	@Override
	public List<DispatchDto> selectDispatchList() {
		return orderingDao.selectDispatchList();
	}

	@Override
	public DispatchDto selectRandomDispatch(int orderingNo) {
		return orderingDao.selectRandomDispatch(orderingNo);
	}

	@Override
	public int selectCount(String search) {
		return orderingDao.searchCount(search);
	}
	
	@Override
	public List<OrderingListDto> selectSearchList(PageInfoDto pi, String search) {
		return orderingDao.selectSearchList(pi, search);
	}

	@Override
	public int updateOrderPro(List<OrderingProductDto> productList,Map<String, Object> map) {
		log.debug("Map : {}",map);
		log.debug("productList : {}",productList);
		int result = orderingDao.updateOrderList(map);
		if(result> 0 && !productList.isEmpty()) {
			result=0;
			for(OrderingProductDto list :productList ) {
				result += orderingDao.updateOrderPro(list);
			}
		}
		
		return result;
	}

	@Override
	public List<ProductDto> selectAddProList() {
		return orderingDao.selectAddProList();
	}




	

	




	

}
