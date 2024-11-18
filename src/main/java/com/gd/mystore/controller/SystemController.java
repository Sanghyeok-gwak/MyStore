package com.gd.mystore.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.service.BoardService;
import com.gd.mystore.service.SystemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/system")
@Controller
public class SystemController {
	
	private final SystemService systemService;
	
	@GetMapping("/log.do")
	public void systemlog() {}

	@GetMapping("/systemLv.do")
	public void systemLv() {}
	
	@GetMapping("/systemBoardsList.do")
	public void systemBoards(Model model) {
		
		List<BoardTypeDto> list = systemService.selectBodrList();
		
		model.addAttribute("list", list);
		
	}
	
	
	
	
}
