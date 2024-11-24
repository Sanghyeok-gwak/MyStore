package com.gd.mystore.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.BoardService;
import com.gd.mystore.util.FileUtil;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {

	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	// 메뉴바에 있는 메뉴 클릭시 /board/list.do   => 1번페이지 요청
	// 페이징바에 있는 페이지 클릭시 /board/list.do?page=xx
	
	@GetMapping("/list.do")
	public String list(@RequestParam(value="page", defaultValue="1") int currentPage
	                   , Model model) {
	    
	    int listCount = boardService.selectBoardListCount();
	    
	    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
	    List<BoardDto> list = boardService.selectBoardList(pi);
	    
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "board/boardList";  // 반환값을 "board/boardList"로 수정
	}

	
	@GetMapping("/search.do")
	public String search(@RequestParam(value="page", defaultValue="1") int currentPage
					,    @RequestParam Map<String, String> search // RequestParam을 쓰면 알아서 map객체에 키 밸류값을 담아줌
					,	 Model model) {
		
		// Map<String, String> search ==> {condition = user_id | board_title | board_content, keyword=란}
		
		int listCount = boardService.selectSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<BoardDto> list = boardService.selectSearchList(search, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "board/boardList";
	}
	
	
	@GetMapping("/boardRegist.do")
	public void registPage() {}
	
	
}
