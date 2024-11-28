package com.gd.mystore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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

import com.gd.mystore.dto.DispatchDto;
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
	
	// 본사 발주 리스트 
	@GetMapping("adminList.or")
	public String adminList(@RequestParam(value="page", defaultValue="1") int currentPage , Model model) {
		int listCount = orderingService.selectOrderListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		
		List<OrderingListDto> list = orderingService.selectOrderList(pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "branchoffice/ordering/adminlist";
	}
	
	// 지점 발주 리스트
	@GetMapping("list.or")
	public String list(@RequestParam(value="page", defaultValue="1") int currentPage , Model model) {
		
		int listCount = orderingService.selectOrderListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		
		List<OrderingListDto> list = orderingService.selectOrderList(pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "branchoffice/ordering/list";
	}
	
	@GetMapping("detail.or")
	public String detailPage(String orderNo,Model model) {
		
		List<ProductDto> list = orderingService.selectProductList(orderNo);
		
		
		model.addAttribute("list", list);
		
		
		return "branchoffice/ordering/detail";
	}
	
	@PostMapping("update.or")
	public String update(@RequestParam("orderNo") String orderNo
						, @ModelAttribute OrderingListDto orderingListDto
						, HttpSession session
						, RedirectAttributes rdAttributes) {
	    String empNo = ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo();
		List<OrderingProductDto> productList = orderingListDto.getProductList();
		
		for(OrderingProductDto pro : productList) {
			pro.setOrderNo(Integer.parseInt(orderNo));
			pro.setModifier(empNo);
		}
		Map <String,Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("orderNo", orderNo);
		int result = orderingService.updateOrderPro(productList, map);
		if(productList.isEmpty() && result == 1 
				|| !productList.isEmpty() && result == productList.size()) {
			rdAttributes.addFlashAttribute("alertMsg", "발주 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "발주 등록 실패");			
		}
		
		log.debug("askldfjioasdjfioasd : {}",productList);
		
	    return "redirect:/ordering/list.or";
	}
	
	@GetMapping("insertpage.or")
	public String insertPage(Model model) {
		
		List<ProductDto> list = orderingService.selectAddProList();
		
		
		model.addAttribute("list", list);
		
		
		return "branchoffice/ordering/regist";
	}
	
	
	@PostMapping("insert.or")
	public String insertOrdering(@ModelAttribute OrderingListDto orderingListDto,HttpSession session,RedirectAttributes rdAttributes) {
	    orderingListDto.setEmpNo( String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ) );
	    orderingListDto.setDeptCode(((EmpMemberDto)session.getAttribute("loginUser")).getDeptCode() );
	    log.debug("orderingListDto : {}",orderingListDto);

	    
	    
	    List<OrderingProductDto> productList = orderingListDto.getProductList();
	    
	    int result = orderingService.insertOrderingList(orderingListDto, productList);
	    if(productList.isEmpty() && result == 1 
				|| !productList.isEmpty() && result == productList.size()) {
			rdAttributes.addFlashAttribute("alertMsg", "발주 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "발주 등록 실패");			
		}
	    
	    return "redirect:/ordering/list.or";
	}
	@ResponseBody
	@PostMapping("orderingPro.or")
	public Map<String,Object> selectOrderingProList(@RequestParam int orderNo) {
		
		List<OrderingProductDto> list = orderingService.selectOrderProductList(orderNo);
		DispatchDto dispatchDto = orderingService.selectRandomDispatch(orderNo);
		log.debug("dis : "+dispatchDto);
		// DispatchDto 로 배차정보 조회 
		// Map에 담아서 반환
		Map<String,Object> map = new HashMap<>(); 
		
		map.put("list", list);
		map.put("dis", dispatchDto);
		
		return map;
		
	}
	
	@ResponseBody
	@PostMapping("companion.or")
	public int companion(@RequestParam String empNo,@RequestParam int orderNo) {
		OrderingListDto olDto = new OrderingListDto();
		olDto.setApprovalNo(empNo);
		olDto.setOrderNo(orderNo);
		
		int result = orderingService.updateCompanion(olDto);
		log.debug("중간 체크 : "+result);
		if(result <0) {
			 result=-1;
		}
		return result;
	}
	@ResponseBody
	@PostMapping("approval.or")
	public DispatchDto approval(@RequestParam String empNo,@RequestParam int orderNo,Model model) {
		OrderingListDto olDto = new OrderingListDto();	
		List<DispatchDto> disList = orderingService.selectDispatchList();
		DispatchDto randomDispatch = disList.get(new Random().nextInt(disList.size()));
		DispatchDto dispatchDto = randomDispatch;
		olDto.setApprovalNo(empNo);
		olDto.setOrderNo(orderNo);
		olDto.setDispatchNo(dispatchDto.getDispathchNo());
		olDto.setDisList(dispatchDto);
		int result =0;
		if(!disList.isEmpty()) {
			 	
			 
			result = orderingService.updateApproval(olDto);
			if(result <0) {
				result=-1;
				olDto = null;
			}
		}
		model.addAttribute("dispatchList",disList);
		
		return olDto.getDisList();
	}
	
	@GetMapping("search.or")
	public String searchProduct(@RequestParam(value="page", defaultValue="1") int currentPage,
								@RequestParam(value="keyword", required=false) String keyword,Model model) {
		
		log.debug("keyword  : {} ",keyword);
		int listCount = orderingService.selectCount(keyword);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<OrderingListDto> list = orderingService.selectSearchList(pi,keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("search", keyword);
		
		return "branchoffice/ordering/adminlist";
	}
	@GetMapping("searchdate.or")
	public String searchOrder(@RequestParam(value="page", defaultValue="1") int currentPage,
			@RequestParam(value="keyword", required=false) String keyword,Model model) {
		
		log.debug("keyword  : {} ",keyword);
		int listCount = orderingService.selectSearchDateCount(keyword);
		log.debug("keyword  : {} ",listCount);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<OrderingListDto> list = orderingService.selectSearchDate(pi,keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("search", keyword);
		
		return "branchoffice/ordering/list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
