package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.OrderingDao;
import com.gd.mystore.dto.OrderingListDto;
import com.gd.mystore.dto.OrderingProductDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;
import com.gd.mystore.service.OrderingService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class OrderingServiceImpl implements OrderingService{
	
	private final OrderingDao orderingDao;
	
	@Override
	public List<ProductDto> selectProductList() {
		return orderingDao.selectProductList();
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
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insertOrderingList(OrderingListDto orderingDto, List<OrderingProductDto> orderingProList) {
		
		int result = orderingDao.insertOrderingList(orderingDto);
		
		if(result> 0 && !orderingProList.isEmpty()) {
			result=0;
			for(OrderingProductDto list :orderingProList ) {
				result += orderingDao.insertOrderingPro(list);
			}
		}
		
		return result;
	}



	

	




	

}
