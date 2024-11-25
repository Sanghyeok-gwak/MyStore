package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/note")
@Controller
public class NoteController {
	
	@GetMapping("inbox.do")
	public String testPage() {
		return "/note/inbox"; 
	}
	@GetMapping("test.do")
	public String testPage1() {
		return "note/noteinbox";
	}
}
