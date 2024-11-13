package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/boardList")
	public void test1() {
	}
	
	@GetMapping("/boardDetail")
	public void test2() {
	}
	
	@GetMapping("/boardModify")
	public void test3() {
	}
	
	@GetMapping("/boardRegist")
	public void test4() {
	}
	@GetMapping("/bboardDetail")
	public void test5() {
	}
	
}
