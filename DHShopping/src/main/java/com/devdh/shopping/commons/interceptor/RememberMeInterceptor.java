package com.devdh.shopping.commons.interceptor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.devdh.shopping.home.domain.CategoryVO;
import com.devdh.shopping.home.service.HomeService;
import com.devdh.shopping.member.domain.MemberVO;
import com.devdh.shopping.member.service.MemberService;

public class RememberMeInterceptor extends HandlerInterceptorAdapter {

	@Inject
	private MemberService service;
	
	@Inject
	private HomeService homeService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "DHSHOPAUTHCOOKIE");
		if (loginCookie != null) {
			MemberVO member = service.checkSession(loginCookie.getValue());
			if (member != null) {
				session.setAttribute("login", member);
			}
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		// rememberInterceptor가 /**/ 에서 실행되므로 메뉴화면 리턴
		List<CategoryVO> category = homeService.getCategory();
		request.setAttribute("category", category);
		
	}

}
