package com.gd.mystore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.OrderingListDto;
import com.gd.mystore.dto.OrderingProductDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;
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
	
	
	@GetMapping("adminList.or")
	public String adminList(@RequestParam(value="page", defaultValue="1") int currentPage , Model model) {
		int listCount = orderingService.selectOrderListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<OrderingListDto> list = orderingService.selectOrderList(pi);
		
		
		log.debug("list : {} ",list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "branchoffice/ordering/adminlist";
	}
	
	
	
	@GetMapping("regist.or")
	public String list(Model model) {
		
		List<ProductDto> list = orderingService.selectProductList();
		
		model.addAttribute("pro",list);
		
		return "branchoffice/ordering/regist";
	}
	@PostMapping("insert.or")
	public String insertOrdering(@ModelAttribute OrderingListDto orderingListDto,HttpSession session,RedirectAttributes rdAttributes) {
	    orderingListDto.setEmpNo( String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ) );
	    orderingListDto.setDeptCode(((EmpMemberDto)session.getAttribute("loginUser")).getDeptCode() );
	    
	    log.debug(((EmpMemberDto)session.getAttribute("loginUser")).getDeptCode() );
	    
	    List<OrderingProductDto> productList = orderingListDto.getProductList();
	    
	    int result = orderingService.insertOrderingList(orderingListDto, productList);
	    if(productList.isEmpty() && result == 1 
				|| !productList.isEmpty() && result == productList.size()) {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 실패");			
		}
	    
	    return "redirect:/ordering/regist.or";
	}
	@ResponseBody
	@PostMapping("orderingPro.or")
	public List<OrderingProductDto> selectOrderingProList(@RequestParam int orderNo) {
		
		List<OrderingProductDto> list = orderingService.selectOrderProductList(orderNo);
		
		return list;
		
	}
	
	@ResponseBody
	@PostMapping("companion.or")
	public int companion(@RequestParam String empNo,@RequestParam int orderNo) {
		OrderingListDto olDto = new OrderingListDto();
		olDto.setDispatchNo(empNo);
		olDto.setOrderNo(orderNo);
		
		int result = orderingService.updateCompanion(olDto);
		log.debug("중간 체크 : "+result);
		if(result <0) {
			 result=-1;
		}
		return result;
	}
	
	
}
