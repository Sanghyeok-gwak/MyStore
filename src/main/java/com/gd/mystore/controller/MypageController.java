package com.gd.mystore.controller;

import javax.servlet.http.HttpSession;

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
	    
	    if (loginUser != null && checkpwd.equals(loginUser.getEmpPwd())) {
	        return "YYYYY"; // 비밀번호가 일치할 경우
	    } else {
	        return "NNNNN"; // 비밀번호가 일치하지 않을 경우
	    }
	}
	

	// 비밀번호 변경 기능
	@GetMapping("/passwordRecovery")
	public void passwordRecovery() {}
	
	@PostMapping("/passwordRecovery")
	public String passwordRecovery(String EmpPwd
						     , String newPassword
						     , String confirmPassword
				    		 , RedirectAttributes rdAttributes
							 , HttpSession session){
		
		// 세션에 담긴 로그인 정보 가져오기
		EmpMemberDto loginUser = (EmpMemberDto)session.getAttribute("loginUser");
		
		// 변경할 비밀번호 서로맞는지 확인
		if (!newPassword.equals(confirmPassword)) {
			rdAttributes.addFlashAttribute("alertMsg", "변경할 비밀번호가 일치하지않습니다.");
			return "redirect:/mypage/passwordRecovery";
			
		}
		
		   // 현재 비밀번호와 세션에 담긴 비밀번호 비교
		   /*(bcryptPwdEncoder.matches  비밀번호 암호화 진행시 추가해야됨*/
		if  (EmpPwd.equals(loginUser.getEmpPwd())) {
			
			// 새 비밀번호 설정
			loginUser.setEmpPwd(newPassword);
			
			// 비밀번호 변경용 서비스 실행
			int result = mypageService.passwordRecovery(loginUser);
			
			if(result > 0) {
				// 비밀번호 변경 성공시
				session.setAttribute("loginUser", selectEmpMember.selectEmpMember(loginUser));
				rdAttributes.addFlashAttribute("alertMsg", "비밀번호가 변경되었습니다.");
				// 비밀번호 변경 실패시
			} else {
				rdAttributes.addFlashAttribute("alertMsg", "비밀번호 변경에 실패했습니다. 다시 시도해주세요");
			}
			
			
		}else {
			// 현재 비밀번호가 일치하지 않는 경우
			rdAttributes.addFlashAttribute("alertMsg", "현재 비밀번호가 일치하지않습니다.");
		}
		
		return "redirect:/mypage/passwordRecovery";
		
	}
	
	/*
	@PostMapping("/passwordRecovery")
	public String passwordRecovery(String EmpPwd,
	                               String newPassword,
	                               String confirmPassword,
	                               RedirectAttributes rdAttributes,
	                               HttpSession session) {

	    // 세션에서 로그인 정보 가져오기
	    EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");

	    // 1. 새 비밀번호가 일치하는지 확인
	    if (!newPassword.equals(confirmPassword)) {
	        rdAttributes.addFlashAttribute("alertMsg", "변경할 비밀번호가 일치하지 않습니다.");
	        return "redirect:/mypage/passwordRecovery";
	    }

	    // 2. 현재 비밀번호 검증
	    String storedPassword = mypageService.getEncryptedPassword(loginUser.getEmpNo()); // DB에서 암호화된 비밀번호 가져오기
	    if (!passwordEncoder.matches(EmpPwd, storedPassword)) {
	        rdAttributes.addFlashAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
	        return "redirect:/mypage/passwordRecovery";
	    }

	    // 3. 새 비밀번호 암호화
	    String encodedPassword = passwordEncoder.encode(newPassword);
	    loginUser.setEmpPwd(encodedPassword);

	    // 4. 비밀번호 업데이트
	    int result = mypageService.updatePassword(loginUser);

	    // 5. 처리 결과 메시지 설정
	    if (result > 0) {
	        session.setAttribute("loginUser", loginUser); // 세션 갱신
	        rdAttributes.addFlashAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
	    } else {
	        rdAttributes.addFlashAttribute("alertMsg", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
	    }

	    return "redirect:/mypage/passwordRecovery";
	}
	 
	 */
	
	

	// 근무 상태 확인 기능
	@GetMapping("/workStatus")
	public void workStatus() {
	}

}
