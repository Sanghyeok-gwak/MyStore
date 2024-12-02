package com.gd.mystore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.EmpMemberService;
import com.gd.mystore.service.WorkService;

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
		int result = workService.updateStTime(em);
		session.setAttribute("loginUser", empMemberService.selectEmpMember(em));
		return result;
	}

	
	// 퇴근 버튼
	/*
	 * 출근 지각은 처리 완료
	 */
	@ResponseBody
	@GetMapping("clockOut")
	public int colockOut(EmpMemberDto em, HttpSession session) {
		int result = workService.updateEndTime(em);
		session.setAttribute("loginUser", empMemberService.selectEmpMember(em));
		return result;
	}

}
