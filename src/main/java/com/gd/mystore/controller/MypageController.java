package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	 @GetMapping("/myInfo")
	    public void myInfo() {
	        // 내 정보 조회 및 수정 기능
	    }

	    @GetMapping("/passwordRecovery")
	    public void passwordChange() {
	        // 비밀번호 변경 기능
	    }

	    @GetMapping("/workStatus")
	    public void workStatus() {
	        // 근무 상태 확인 기능
	    }
	
	
	
	
}
