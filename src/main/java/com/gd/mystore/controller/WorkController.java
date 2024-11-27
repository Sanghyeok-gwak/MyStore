package com.gd.mystore.controller;

import java.time.LocalTime;
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


	@ResponseBody
	@GetMapping("clockCheck")
	public int workCheck(EmpMemberDto em, HttpSession session) {

		if (em.getWorkStartTime() == null) { // 출근 기록
			// 세션 업데이트
			int result = workService.updateStTime(em);

			if (result > 0) {
				EmpMemberDto loginUser = empMemberService.selectEmpMember(em);
				session.setAttribute("loginUser", loginUser);
			}
			return result;
		} else if (em.getWorkEndTime() == null) {
			// 퇴근 기록
			return 2;
		} else {
//			return workService.selectWorkCheck(em);
			return 3;
		}
	}

	
	// 출근 버튼
	/*
	 * 출근 버튼 클릭 시 update 진행 -> work_start_time 현재 시간으로 변경 09시 넘으면 WORK_ATTENDANCE
	 * 'A'(지각)으로 변경
	 */
	@ResponseBody
	@GetMapping("clockIn")
	public int colockIn(EmpMemberDto em, HttpSession session) {
		return workService.updateStTime(em);
	}

	
	// 퇴근 버튼
	/*
	 * 퇴근 버튼 미 클릭 체크는 스케줄러 돌면서 퇴근데이터가 null 인지 확인후 상태를 N으로 변경 해야 할듯
	 * 출근 지각은 처리 완료
	 * 
	 * 내가 해야할 거
	 * ㄴ조퇴 -> 작성중인 쿼리문 활용
	 * ㄴ결근 -> 출석을 안찍으면 자동 결근 처리
	 * ㄴ출근 시간은 있는데 퇴근 데이터 NULL 결근 처리 -> 스케줄러로 퇴근 데이터 NULL이면 결근으로 업데이트?
	 */
	@ResponseBody
	@GetMapping("clockOut")
	public int colockOut(EmpMemberDto em, Model model) {
		
		return workService.updateEndTime(em);
	}

}
