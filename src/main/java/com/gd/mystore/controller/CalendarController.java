package com.gd.mystore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.gd.mystore.dto.CalendarDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.CalendarService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/calendar")
@RequiredArgsConstructor
public class CalendarController {

    private final CalendarService calendarService;

    @GetMapping("/fullCalendar.do")
    public void calendar() {
        // 캘린더 페이지로 이동
    }

    @ResponseBody
    @GetMapping("/selectEvents.do")
    public List<CalendarDto> selectEvents(HttpSession session) {
        EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            throw new IllegalArgumentException("로그인된 사용자 정보가 없습니다.");
        }

        String empNo = loginUser.getEmpNo();
        List<CalendarDto> events = calendarService.selectEvents(empNo);

        return events;
    }

    @ResponseBody
    @PostMapping("/addEvent.do")
    public String addEvent(@RequestBody CalendarDto calendarDto, HttpSession session) {
        EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            throw new IllegalArgumentException("로그인된 사용자 정보가 없습니다.");
        }

        calendarDto.setEmpNo(loginUser.getEmpNo());
        int result = calendarService.addEvent(calendarDto);
        return result > 0 ? "이벤트가 추가되었습니다." : "이벤트 추가 실패.";
    }

    @ResponseBody
    @PostMapping("/updateEvent.do")
    public String updateEvent(@RequestBody CalendarDto calendarDto) {
        int result = calendarService.updateEvent(calendarDto);
        return result > 0 ? "이벤트가 수정되었습니다." : "이벤트 수정 실패.";
    }

    @ResponseBody
    @PostMapping("/deleteEvent.do")
    public String deleteEvent(@RequestBody int calNo) {
        int result = calendarService.deleteEvent(calNo);
        return result > 0 ? "이벤트가 삭제되었습니다." : "이벤트 삭제 실패.";
    }
}
