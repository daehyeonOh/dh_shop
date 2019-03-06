package com.devdh.shopping.commons.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.devdh.shopping.member.domain.MemberVO;
import com.devdh.shopping.member.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	MemberService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("login");
		
		// 세션정보 확인
		if (object != null) {
			MemberVO member = (MemberVO) object;
			String role = service.selectMemberRole(member.getId());
			
			// MEMBER 권한으로 접근시
			if (role.equals("ROLE_MEMBER")) {
				if (uri.equals("/admin")) {
					response.sendRedirect(request.getContextPath() + "/");
					return false;
				}
			} 
		} else {
			// 세션정보 없을 때
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		return true;
	}
	
	
}
