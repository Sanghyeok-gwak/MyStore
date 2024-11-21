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
	public int selectOrderListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectOrderList(PageInfoDto pi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductDto> selectProductList() {
		return orderingDao.selectProductList();
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
