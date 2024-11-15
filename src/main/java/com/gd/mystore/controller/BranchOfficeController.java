package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;
import com.gd.mystore.service.BranchOfficeService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/branchoffice")
public class BranchOfficeController {
	
	private final BranchOfficeService boService;
	private final PagingUtil pagingUtil;
	
	@GetMapping("adminList.po")
	public String selectList(@RequestParam(value="page", defaultValue="1") int currentPage , Model model) {
		int listCount = boService.selectProductListCount();
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
				
		List<ProductDto> list = boService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "branchoffice/product/adminlist";
	}
	
	
}
