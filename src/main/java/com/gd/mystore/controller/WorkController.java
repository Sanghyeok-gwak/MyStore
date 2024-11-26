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
import com.gd.mystore.dto.WorkDto;
import com.gd.mystore.service.BoardService;
import com.gd.mystore.service.SystemService;
import com.gd.mystore.service.WorkService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/work")
@Controller
public class WorkController {
	
	private final WorkService workService;
//	private final PagingUtil pagingUtil;
	
	//출근 버튼
	/*
	 * 출근 버튼 클릭 시 update 진행 -> work_start_time 현재 시간으로 변경
	 * 09시 넘으면 WORK_ATTENDANCE 'A'(지각)으로 변경
	 */
	@ResponseBody
	@GetMapping("clockCheck")
	public List<WorkDto> workCheck(String empData) {
		return workService.selectWorkCheck();
	}
	
	@GetMapping("clockIn")
	public String colockIn() {
		return "test";
	}
	
	//퇴근 버튼
	/*
	 * 퇴근 버튼 클릭 시 update 진행 -> wor_end_time 현재 시간으로 변경
	 * 50% 미만 출근 시 결근 처리 초로 계산하면 될듯? 다른 방법 있으면 그렇게 진행
	 */
	@GetMapping("clockOut")
	public void colockOut() {
		
	}
	
	
}
