package com.gd.mystore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.LogDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.BoardService;
import com.gd.mystore.service.SystemService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/system")
@Controller
public class SystemController {
	
	private final SystemService systemService;
	private final PagingUtil pagingUtil;
	
	//사이드 게시판 리스트 조회
	@ResponseBody
	@GetMapping("/sideBoardsList.do")
	public List<BoardTypeDto> sideBoards(Model model) {
		List<BoardTypeDto> list = systemService.selectBodrList();
		return list;
	}
	
	
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
		
		return "redirect:/system/systemBoardsList.do";
	}
	
	/*
	 * =================================================================================
	 * 시스템 레벨 페이지 컨트롤러
	 */
	
	@GetMapping("/systemLv.do")
	public void list(@RequestParam(value="page", defaultValue = "1") int currentPage
					, @RequestParam(value="search", defaultValue="") String scData
					, Model model) {
		
		if(scData == "") {
			int listCount = systemService.selectEmpMemberCount();
			
			PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
			List<EmpMemberDto> list = systemService.selectEmpMemberList(pi);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		}else {
			int listCount = systemService.selectSearchListCount(scData);
			PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
			
			List<EmpMemberDto> list = systemService.selectSearchEmpMemberList(pi, scData);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		}
		
		
	}
	
	@PostMapping("/lvUpdate.do")
	public String lvUpdate(EmpMemberDto em, RedirectAttributes rdAttributes) {
		int result = 0;
		
		for(int i=0; i < em.getLvList().size(); i++) {
			result = systemService.updateEmpLv(em.getLvList().get(i));
		}
		
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "수정되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "수정을 실패 하였습니다.");
		}
		return "redirect:/system/systemLv.do";
	}
	
	@GetMapping("/lvNameUpdate.do")
	public String lvNameUpdate(RedirectAttributes rdAttributes) {
		rdAttributes.addFlashAttribute("alertMsg", "기능 개발 중..");
		
		return "redirect:/system/systemLv.do";
	}
	
	/*
	 * =================================================================================
	 * 시스템 로그 컨트롤러
	 */
	
	/*
	 * - insert 할 수 있는 모듈(Class) 제작
	 * 
	 * - 
	 * 
	 * 로그 조회
	 * - 로그 타입은 CHAR 형식이라 조건문 처리 필요
	 * 		ㄴ 1 : 부서이동 , 2: 조회, 3: 추가, 4: 수정, 5: 삭제
	 * 
	 * - 이전 데이터는 jsp에서 숨겨 컨트롤러에서 해당 데이터를 먼저 insert 진행
	 *   이후 
	 * 
	 */
	
	//데이터 테스트
	@GetMapping("/log.do")
	public void systemlog(@RequestParam(value="page", defaultValue = "1") int currentPage) {
		int listCount = systemService.selectLogCount();
		
		log.debug("시스템 로그 갯수 : {}", listCount);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<LogDto> list = systemService.selectLogList(pi);
		
		
		
	}
}
