package com.gd.mystore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.BoardTypeDto;
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
	
	//게시판 리스트 조회
	@GetMapping("/systemBoardsList.do")
	public void systemBoards(Model model) {
		
		List<BoardTypeDto> list = systemService.selectBodrList();
		
		model.addAttribute("list", list);
	}
	
	//게시판 추가
	@GetMapping("/boardsAdd.do")
	public String systemBoardAdd(String userData){
		systemService.insertBoard(userData);
		return "redirect:/system/systemBoardsList.do";
	}
	
	//게시판 삭제
	@PostMapping("/boardsDelete.do")
	public String systemBoardDelete(BoardTypeDto bt ,RedirectAttributes rdAttributes){
		
		int result = systemService.boardDelete(bt);
		
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 삭제 되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "시스템 에러, 삭제 실패.");
		}
		return "redirect:/system/systemBoardsList.do";
	}
	
	//게시판 수정
	@PostMapping("/boardUpdate.do")
	public String systemBoardsEdit(BoardTypeDto bt
								 , RedirectAttributes rdAttributes) {
		//체크박스 변환처리
		if(bt.getBoardtUse() != null) {
			bt.setBoardtUse("N");
		}else {
			bt.setBoardtUse("Y");
		}
		
		int result = systemService.boardUpdate(bt);
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "수정되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "수정을 실패하였습니다.");
		}
		
		// 추후 히스토리백 적용
		return "redirect:/system/systemBoardsList.do";
	}
	
}
