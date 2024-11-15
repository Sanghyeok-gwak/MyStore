package com.gd.mystore.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.EmpMemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@RequiredArgsConstructor
@Controller
public class EmpMemberController {
	
	private final EmpMemberService empMemberService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	
	@GetMapping("/loginPage")
	public void test1() {}
	
	@PostMapping("/signin.do")
	public String test2(EmpMemberDto em
					, HttpServletResponse response
					, HttpServletRequest request
					, HttpSession session
					, RedirectAttributes rdAttributes) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		EmpMemberDto loginUser = empMemberService.selectEmpMember(em);
		PrintWriter out = response.getWriter();
		
//		if(loginUser != null && bcryptPwdEncoder.matches(em.getEmpNo(), loginUser.getEmpPwd())) { // 로그인 성공
		if(loginUser != null && em.getEmpPwd().equals(loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}else { // 로그인 실패
			rdAttributes.addFlashAttribute("alertMsg", "로그인에 실패하였습니다. 사번 및 비밀번호를 다시 확인해주세요.");
			
			return "redirect:/login/loginPage";
		}
		
	}

	
//	@GetMapping("/pwdRecovery")
//	public void test2() {
//	}
	
}
