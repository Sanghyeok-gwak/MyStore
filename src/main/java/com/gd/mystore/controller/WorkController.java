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
import com.gd.mystore.service.EmpMemberService;
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
	private final EmpMemberService empMemberService;
//	private final PagingUtil pagingUtil;
	
	//출근 버튼
	/*
	 * 출근 버튼 클릭 시 update 진행 -> work_start_time 현재 시간으로 변경
	 * 09시 넘으면 WORK_ATTENDANCE 'A'(지각)으로 변경
	 */
	@ResponseBody
	@GetMapping("clockCheck")
	public int workCheck(EmpMemberDto em
						, HttpSession session) {
		/*
		 * 마이바티스에서 날짜는 안 되는 것 같아, 아마 컨트롤러 아니면 서비스에서 Date 객체 생성후
		 * 24/00/00 이런식으로 해서 넣어야 할듯
		 */

		if(em.getWorkStartTime() == null) {	//출근 기록
			//세션 업데이트
			int result = workService.updateStTime(em);
			if(result > 0) {
				EmpMemberDto loginUser = empMemberService.selectEmpMember(em);
				session.setAttribute("loginUser", loginUser);
			}
			return result;
		} else if(em.getWorkEndTime() == null) {
			//퇴근 기록
			return 2;
		} else {
//			return workService.selectWorkCheck(em);
			return 3;
		}
		
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
