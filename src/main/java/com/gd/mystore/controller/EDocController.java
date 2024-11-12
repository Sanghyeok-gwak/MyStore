package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/edoc")
public class EDocController {
	
	@GetMapping("completedetail")
	public void completedetail() {}
	// 영역 나감

	@GetMapping("completelist")
	public void completelist() {}
	
	@GetMapping("collectlist")
	public void collectlist() {}
	
	@GetMapping("companion")
	public void companion() {}
	// 영역나감
	
	@GetMapping("companionlist")
	public void companionlist() {}
	
	@GetMapping("draftcompletedetail")
	public void draftcompletedetail() {}
	
	@GetMapping("draftcompletelist")
	public void draftcompletelist() {}
	// 영역 나감
	
	
	
	
	
	
	
	
	@GetMapping("edocwrite")
	public void edocwrite() {}
	
	
}
