package com.devdh.shopping.member.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.devdh.shopping.member.domain.LoginVO;
import com.devdh.shopping.member.domain.MemberVO;
import com.devdh.shopping.member.service.MemberService;

@Controller
@RequestMapping("/auth")
public class LoginController {

	@Inject
	MemberService service;
	
	@RequestMapping("")
	public String signInPage(@ModelAttribute LoginVO vo) {
		return "member/login";
	}
	
	@RequestMapping(value="/action", method=RequestMethod.POST)
	public String signIn(@ModelAttribute LoginVO vo, Model model) throws Exception {
		
		MemberVO member = service.signIn(vo.getId());
		model.addAttribute("member", member);
		model.addAttribute("login", vo);
		return "home";
	}
	
	@RequestMapping("/logout")
	public String signOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		Object object = session.getAttribute("login");
		if (object != null) {
			MemberVO member = (MemberVO) object;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "DHSHOPAUTHCOOKIE");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				Map<String, Object> map = new HashMap<>();
				map.put("id", member.getId());
				map.put("session_key", "none");
				map.put("session_limit", new Date());
				service.updateMemberSession(map);
			}
		}
		
		return "home";
	}
	
}
