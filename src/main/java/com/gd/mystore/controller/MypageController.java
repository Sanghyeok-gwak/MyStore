package com.gd.mystore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.EmpMemberService;
import com.gd.mystore.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mypage")
@RequiredArgsConstructor
@Controller
public class MypageController {
	
	private final MypageService mypageService;
	private final EmpMemberService selectEmpMember;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	
	// 내 정보 조회 및 수정 기능
	@GetMapping("/myInfo")
	public void myInfo() {}
	
	@PostMapping("/update.do")
	public String modify(EmpMemberDto e
					   , RedirectAttributes rdAttributes
					   , HttpSession session) {
		
		int result = mypageService.updateEmployee(e);
		
		if(result > 0) {
			// 로그인 유저 세션업데이트인데 select부분이 EmpMemberService에 있음
			session.setAttribute("loginUser", selectEmpMember.selectEmpMember(e));
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 정보수정 되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "정보수정에 실패했습니다 다시 시도해주세요.");
			
		}
			
		return "redirect:/mypage/myInfo";
		
	}
	
	@ResponseBody
	@GetMapping("/pwdcheck.do")
	public String pwdcheck(String checkpwd, HttpSession session) {
	    // 현재 세션에 로그인된 사용자 정보 가져오기
	    EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
	    
	    
	    if (loginUser != null && bcryptPwdEncoder.matches(checkpwd, loginUser.getEmpPwd())) {
	        return "YYYYY"; // 비밀번호가 일치할 경우
	    } else {
	        return "NNNNN"; // 비밀번호가 일치하지 않을 경우
	    }
	}
	

	// 비밀번호 변경 기능
	@GetMapping("/passwordRecovery")
	public void passwordRecovery() {}
	
	@PostMapping("/passwordRecovery")
	public String passwordRecovery(String EmpPwd,
	                               String newPassword,
	                               String confirmPassword,
	                               RedirectAttributes rdAttributes,
	                               HttpSession session) {

	    // 세션에서 로그인 정보 가져오기
	    EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");
	    
	    
	    
	    if(bcryptPwdEncoder.matches(EmpPwd, loginUser.getEmpPwd())) {
	    	
	    	loginUser.setEmpPwd( bcryptPwdEncoder.encode(newPassword));
	    	
		    int result = mypageService.passwordRecovery(loginUser);
	    	
		 // 5. 처리 결과 메시지 설정
		    if (result > 0) {
		        session.setAttribute("loginUser", loginUser); // 세션 갱신
		        rdAttributes.addFlashAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
		    } else {
		        rdAttributes.addFlashAttribute("alertMsg", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
		    }

	    }
	    
	    return "redirect:/mypage/passwordRecovery";
	    
	}
	    
	    
	    
	    

	    
	
	

	// 근무 상태 확인 기능
	@GetMapping("/workStatus")
	public void workStatus() {
	}

}
