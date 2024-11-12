package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("myinfo")
	public void test1() {
	}
	
	@GetMapping("passwordRecovery")
	public void test2() {
	}

	@GetMapping("payCheck")
	public void test3() {
	}
	@GetMapping("workStatus")
	public void test4() {
	}
	
	
	
	
	
	
	
	
	
}
