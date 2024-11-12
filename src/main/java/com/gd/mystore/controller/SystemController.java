package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/system")
@Controller

public class SystemController {
	
	@GetMapping("/log.do")
	public void systemlog() {}

	@GetMapping("/systemLv.do")
	public void systemLv() {}
	
	@GetMapping("/systemBoardsList.do")
	public void systemBoards() {}
	
	
	
	
}
