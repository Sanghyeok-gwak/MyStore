package com.gd.mystore.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.EmailService;
import com.gd.mystore.service.EmpMemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@RequiredArgsConstructor
@Controller
@Slf4j
public class EmpMemberController {

	private final EmpMemberService empMemberService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final EmailService emailService;

	@RequestMapping("/loginPage.do")
	public void loginCookie() {
		//로그인 페이지 이동
		//web.xml -> ContextLoaderListener -> contextConfigLocation (빈 컨테이너 생성)
		//생성된 빈 컨테이너 servlet-context.xml -> InternalResourceViewResolver로 경로 및 확장자를 다 안적어도 됨
		//void로 아무것도 없을 시 loginPage 즉 /WEB-INF/views/login/loginPage.jsp가 보여짐
	}

	@RequestMapping("/logOut.do") // 로그아웃
	public String logOut(HttpSession session, RedirectAttributes rdAttributes) {
		
		session.invalidate(); // 세션 무효화
		rdAttributes.addFlashAttribute("alertMsg", "로그아웃 되었습니다.");

		return "redirect:/login/loginPage.do";
	}

	//로그인
	@PostMapping("/signin.do")
	public String login(EmpMemberDto em
					  , HttpServletResponse response
					  , HttpSession session
					  , RedirectAttributes rdAttributes) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		
		
		EmpMemberDto loginUser = empMemberService.selectEmpMember(em);
		
//		if(loginUser != null && bcryptPwdEncoder.matches(em.getEmpNo(), loginUser.getEmpPwd())) { // 로그인 성공
		
		if (loginUser != null && em.getEmpPwd().equals(loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getUseYn().equals("N")) {
				rdAttributes.addFlashAttribute("alertMsg", "최초 로그인, 비밀번호를 변경해주세요☺️");
				return "redirect:/mypage/passwordRecovery";
			}else {
				return "main";
			}
		} else { // 로그인 실패
			rdAttributes.addFlashAttribute("alertMsg", "로그인에 실패하였습니다. 사번 및 비밀번호를 다시 확인해주세요.");
			return "redirect:/login/loginPage.do";
		}
	}
	
	@RequestMapping("/pwdRecovery.do")
	public void pwdRecovery() {}

	@PostMapping("/pwdRecoveryCheck.do") // 비밀번호 찾기
	public void pwdRecovery(EmpMemberDto em, HttpServletResponse response, HttpSession session) throws IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		EmpMemberDto loginUser = empMemberService.selectEmpMember(em);// 사번 일치 확인

		if (loginUser != null && em.getEmpEmail().equals(loginUser.getEmpEmail())) { // 이메일 일치 확인

			// 변경할 비밀번호 길이 설정
			String newPwd = emailService.randomPassword(8);

			// 세션에 비밀번호 변경
			loginUser.setEmpPwd(newPwd);

			// 변경된 비밀번호 DB 업데이트 진행
			int result = empMemberService.updatePwdMember(loginUser);

			// DB 업데이트 성공 시 메일 전송
			if (result > 0) {
				emailService.joinEmail(loginUser.getEmpEmail(), newPwd);
			} else {
				log.debug("비밀번호 업데이트 안됨");
			}

			out.println("<script>");
			out.println("alert('임시 비밀번호를 이메일로 발송했습니다. 이메일을 확인해주세요.');");
			out.println("location.href='/mystore/login/loginPage.do';"); // 로그인 페이지로 이동
			out.println("</script>");

		} else { // 비밀번호 찾기 실패
			out.println("<script>");
			out.println("alert('인증에 실패하였습니다. 사번 및 이메일을 다시 확인해주세요.');");
			out.println("history.back();"); // 이전 페이지로 이동
			out.println("</script>");
		}
		out.close();
	}

}
