package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.CommonCodeDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;
import com.gd.mystore.service.BranchOfficeService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;


@Slf4j
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
	
	@GetMapping("detail.po")
	public String productDetail(int prono,Model model) {
		
		ProductDto pro = boService.selectDto(prono);
		List<CommonCodeDto> cC = boService.selectCommonDto();
		
		model.addAttribute("cC",cC);
		model.addAttribute("pro",pro);
		
		return "branchoffice/product/detail";
		
	}
	
	@PostMapping("modify.po")
	public String productModify(ProductDto productDto,RedirectAttributes rdAttributes) {
		
		int result = boService.updateProduct(productDto);
		if(result >0) {
			rdAttributes.addAttribute("alertMsg","상품 수정이 완료되었습니다");
		}else{
			rdAttributes.addAttribute("alertMsg","상품 수정이 실패되었습니다");
		}
		return "redirect:/branchoffice/adminList.po";	
	}
	@GetMapping("regist.po")
	public String registPage(Model model) {
		
		List<CommonCodeDto> cC = boService.selectCommonDto();
		model.addAttribute("cC",cC);
		
		return "/branchoffice/product/regist";
	}
	@PostMapping("insert.po")
	public String insertProduct(ProductDto productDto,RedirectAttributes rdAttributes) {
		
		int result = boService.insertProduct(productDto);
		
		if(result >0) {
			rdAttributes.addAttribute("alertMsg","상품 수정이 완료되었습니다");
		}else{
			rdAttributes.addAttribute("alertMsg","상품 수정이 실패되었습니다");
		}
		
		return "redirect:/branchoffice/adminList.po";	
	}
}
