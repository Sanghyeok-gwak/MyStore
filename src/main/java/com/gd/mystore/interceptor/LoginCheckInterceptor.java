package com.gd.mystore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("loginUser") != null) {
			return true;
		}else {
			
			FlashMap flashMap = new FlashMap();
			flashMap.put("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			RequestContextUtils.getFlashMapManager(request).saveOutputFlashMap(flashMap, request, response);
			
//			response.sendRedirect(request.getContextPath());
			response.sendRedirect(request.getContextPath() + "/login/loginPage.do");
			
			return false;
		}
		
		
		
	}
	
}
