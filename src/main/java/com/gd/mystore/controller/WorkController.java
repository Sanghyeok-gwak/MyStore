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

	// 출근 버튼
	/*
	 * 출근 버튼 클릭 시 update 진행 -> work_start_time 현재 시간으로 변경 09시 넘으면 WORK_ATTENDANCE
	 * 'A'(지각)으로 변경
	 */
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

	@ResponseBody
	@GetMapping("clockIn")
	public int colockIn(EmpMemberDto em, HttpSession session) {

		int result = workService.updateStTime(em);

		if (result > 0) {
			List<WorkDto> list = workService.selectWorkCheck(em);
			WorkDto workData = list.get(0);
			
			String workStartTime = workData.getWorkStartTime();
			LocalTime lateTime = LocalTime.of(9, 0, 0);//시간 설정
			LocalTime startTime = LocalTime.parse(workStartTime);
			
			if(startTime.isAfter(lateTime)) { //9시 이후 지각 처리
				//지각
				workData.setWorkAttendance("L");
				return workService.updateWorkStatus(workData);
			} else {
				//정상 출근
				workData.setWorkAttendance("O");
				return workService.updateWorkStatus(workData);
			}
		}else {
			return -1;
		}
	}

	// 퇴근 버튼
	/*
	 * 4시간 이상 8시간 미만 조퇴
	 * 9시간 이상 출근
	 */
	@ResponseBody
	@GetMapping("clockOut")
	public int colockOut(EmpMemberDto em, Model model) {
		
		return workService.updateEndTime(em);
	}

}
