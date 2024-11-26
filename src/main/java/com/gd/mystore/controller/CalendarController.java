package com.gd.mystore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public List<Map<String, Object>> selectEvents(HttpSession session,  boolean personal,  boolean all) {
        EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            throw new IllegalArgumentException("로그인된 사용자 정보가 없습니다.");
        }

        String empNo = loginUser.getEmpNo();
        List<CalendarDto> events = new ArrayList<>();

        // personal과 all 필터에 따라 다른 쿼리 실행
        if (personal && all) {
            // 개인과 전사 일정 모두 조회
            events = calendarService.selectEvents(empNo);
        } else if (personal) {
            // 개인 일정만 조회
            events = calendarService.selectPersonalEvents(empNo);
        } else if (all) {
            // 전사 일정만 조회
            events = calendarService.selectAllCompanyEvents(empNo);
        }

        List<Map<String, Object>> eventList = new ArrayList<>();
        for (CalendarDto event : events) {
            Map<String, Object> eventMap = new HashMap<>();
            eventMap.put("id", event.getCalNo());
            eventMap.put("title", event.getCalSubject());
            eventMap.put("start", event.getCalStartDate().toString());
            eventMap.put("color", event.getCalColor() != null ? event.getCalColor() : "gray"); // 기본값 처리
            eventList.add(eventMap);
        }

        return eventList;
    }




    @ResponseBody
    @PostMapping("/addEvent.do")
    public String addEvent(@RequestBody CalendarDto calendarDto, HttpSession session) {
        EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");

        calendarDto.setEmpNo(loginUser.getEmpNo());
        int result = calendarService.addEvent(calendarDto);
        if (result > 0) {
            return "이벤트가 추가되었습니다.";
        } else {
            return "이벤트 추가 실패.";
        }
    }

    @ResponseBody
    @PostMapping("/updateEvent.do")
    public String updateEvent(@RequestBody CalendarDto calendarDto) {
        int result = calendarService.updateEvent(calendarDto);
        if (result > 0) {
            return "이벤트가 수정되었습니다.";
        } else {
            return "이벤트 수정 실패.";
        }
    }

    @PostMapping("/deleteEvent.do")
    @ResponseBody
    public String deleteEvent(@RequestBody CalendarDto calendarDto) {
        System.out.println("삭제 요청 calNo: " + calendarDto.getCalNo());
        int calNo = calendarDto.getCalNo();
        int result = calendarService.deleteEvent(calNo);
        return result > 0 ? "이벤트가 삭제되었습니다." : "이벤트 삭제 실패.";
    }

}
