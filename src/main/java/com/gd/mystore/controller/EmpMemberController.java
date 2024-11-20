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

	@RequestMapping("/loginPage") // 쿠키 확인
	public void loginCookie(@CookieValue(value = "remember-empNo", required = false) Cookie cookie, Model model) {

		String empNo = ""; // 저장된 아이디
		boolean rememberEmpNo = false; // 아이디 저장 체크 여부

		if (cookie != null) {
			System.out.println("Ck Name : " + cookie.getName());
			System.out.println("Ck Value : " + cookie.getValue());
			empNo = cookie.getValue();
			rememberEmpNo = true;
		}
		model.addAttribute("empNo", empNo);
		model.addAttribute("rememberEmpNo", rememberEmpNo);
	}

	@RequestMapping("/logOut.do") // 로그아웃
	public String logOut(HttpSession session, RedirectAttributes rdAttributes) {

		session.invalidate(); // 세션 무효화
		rdAttributes.addFlashAttribute("alertMsg", "로그아웃 되었습니다.");

		return "redirect:/login/loginPage";
	}

	@PostMapping("/signin.do") // 로그인
	public String login(EmpMemberDto em, HttpServletResponse response, HttpSession session,
			RedirectAttributes rdAttributes) throws IOException {

		response.setContentType("text/html; charset=utf-8");
		EmpMemberDto loginUser = empMemberService.selectEmpMember(em);

//		if(loginUser != null && bcryptPwdEncoder.matches(em.getEmpNo(), loginUser.getEmpPwd())) { // 로그인 성공
		if (loginUser != null && em.getEmpPwd().equals(loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getUseYn().equals("N")) {
				rdAttributes.addFlashAttribute("alertMsg", "신규 입사자님 환영합니다.                                                       비밀번호 조건에 맞춰 비밀번호를 변경해주세요☺️");
				return "redirect:/mypage/passwordRecovery";
			}else {
				return "redirect:/";
			}
		} else { // 로그인 실패
			rdAttributes.addFlashAttribute("alertMsg", "로그인에 실패하였습니다. 사번 및 비밀번호를 다시 확인해주세요.");

			return "redirect:/login/loginPage";
		}
	}

	@PostMapping("/pwdRecovery.do") // 비밀번호 찾기
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
			out.println("alert('인증 성공. 이메일을 확인해주세요');");
			out.println("location.href='/mystore/login/loginPage';"); // 로그인 페이지로 이동
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
