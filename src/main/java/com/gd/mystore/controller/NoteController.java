package com.gd.mystore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.NoteService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/note")
@RequiredArgsConstructor
@Controller
public class NoteController {
	
	private final NoteService noteService;
	private final PagingUtil pagingUtil;
	//받은 쪽지함
	@GetMapping("list.no")
	public String testPage1(@RequestParam(value="page", defaultValue="1") int currentPage ,HttpSession session,Model model) {
		String empNo =( String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ) );
		int listCount = noteService.selectInBoxCount(empNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<NoteDto> list = noteService.selectInBox(pi,empNo);
		log.debug("list확인 : {}",list);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "note/noteinbox";
	}
	@GetMapping("write.no")
	public String testPage12() {
		return "note/writenote";
	}
	@PostMapping("send.do")
	public String sendNote(NoteDto noteDto, Model model) {
		int result = noteService.sendNote(noteDto);
		
		return "note/noteinbox" ;
	}
}
