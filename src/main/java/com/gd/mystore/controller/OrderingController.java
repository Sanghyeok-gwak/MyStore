package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.mystore.dto.ProductDto;
import com.gd.mystore.service.BranchOfficeService;
import com.gd.mystore.service.OrderingService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/ordering")
public class OrderingController {
	
	private final PagingUtil pagingUtil;
	private final OrderingService orderingService;
	
	@GetMapping("regist.or")
	public String list(Model model) {
		
		List<ProductDto> list = orderingService.selectProductList();
		
		model.addAttribute("pro",list);
		
		return "branchoffice/ordering/regist";
	}
	
	
	
}
