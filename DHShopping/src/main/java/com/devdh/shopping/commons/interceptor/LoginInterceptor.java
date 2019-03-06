package com.devdh.shopping.commons.interceptor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.devdh.shopping.member.domain.LoginVO;
import com.devdh.shopping.member.domain.MemberVO;
import com.devdh.shopping.member.service.MemberService;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Inject
	MemberService service;

	// controller 실행 요청 전 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		// 기존 로그인 정보 제거
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}

		return true;
	}

	// controller 실행 된 이후 view forward 되기 전 수행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		MemberVO member = (MemberVO) modelMap.get("member");
		LoginVO login = (LoginVO) modelMap.get("login");

		if (member == null || !BCrypt.checkpw(login.getPassword(), member.getPassword())) {
			request.setAttribute("message", "아이디 혹은 비밀번호가 다릅니다.");
			request.getRequestDispatcher(request.getContextPath() + "/auth").forward(request, response);
		} else {
			if (!member.isEnabled()) {
				int disabledType = service.getDisabledType(member.getId());
				if (disabledType == 1) {
					request.setAttribute("message", "탈퇴한 계정입니다.");
				} else if (disabledType == 2) {
					request.setAttribute("message", "부적절한 이용으로 계정이 정지됐습니다.");
				} else {
					request.setAttribute("message", "기타 사유로 계정이 정지됐습니다. 관리자에게 문의해 주세요.");
				}
				request.getRequestDispatcher(request.getContextPath() + "/auth").forward(request, response);
			} else {
				if (login.isRemember_me()) {
					// 7일
					final int sessionLimit = 60 * 60 * 24 * 7;
					final String sessionKey = session.getId();

					// DB에 저장할 세션정보
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", member.getId());
					map.put("session_key", sessionKey);
					map.put("session_limit", new Date(System.currentTimeMillis() + (1000 * sessionLimit)));
					service.updateMemberSession(map); // 세션값 저장

					// 세션쿠키 생성
					Cookie loginCookie = new Cookie("DHSHOPAUTHCOOKIE", sessionKey);
					loginCookie.setPath("/");
					loginCookie.setMaxAge(sessionLimit);
					response.addCookie(loginCookie);
				}
				// 로그인 로그 저장
				Map<String, String> map = new HashMap<>();
				map.put("id", member.getId());
				map.put("ip", service.getIp(request));
				service.insertLoginLog(map);

				session.setAttribute("login", member);
				
				response.sendRedirect(request.getContextPath() + "/");
			}
		}
		
	}

	
	

}
