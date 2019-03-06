package com.devdh.shopping.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devdh.shopping.member.domain.MemberVO;
import com.devdh.shopping.member.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberController {

	@Inject
	MemberService service;

	// --------- Page Router --------------

	@RequestMapping("/page/join")
	public ModelAndView signUpPage(@ModelAttribute MemberVO vo) {
		return new ModelAndView("member/join_agree");
	}

	@RequestMapping("/page/update")
	public ModelAndView updatePage() {
		return new ModelAndView("member/pwChk");
	}

	// ----------- Action -----------------

	@RequestMapping(value="/action", method=RequestMethod.POST)
	public ModelAndView signUp(@ModelAttribute MemberVO vo, RedirectAttributes redirectAttributes) {
		
		if (!vo.getId().isEmpty() && !vo.getPassword().isEmpty() && !vo.getName().isEmpty() && !vo.getEmail().isEmpty()) {
			String hashPw = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
			
			vo.setPassword(hashPw);
			service.signUp(vo);
			// redirectAttributes.addFlashAttribute("msg", "REGISTERED");
				
			return new ModelAndView("home");
		} else {
			return new ModelAndView("/member/signUp");
		}
	}
	
	@RequestMapping(value="/action/update", method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute MemberVO vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		// 아이디가 변경되는 것을 방지하기 위해 세션정보 가져와서 처리
		MemberVO member = (MemberVO) session.getAttribute("login");
		if(member != null) {
			member.setName(vo.getName());
			member.setEmail(vo.getEmail());
			member.setPassword(BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt()));
			service.updateMember(member);
			session.setAttribute("login", member);	// 세션정보 업데이트
			mav.setViewName("home");
		} else {
			mav.addObject("message", "세션정보 없음.");
			mav.setViewName("home");
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="/action/pwChk", method=RequestMethod.POST)
	public ModelAndView passwordCheck(String password, HttpSession session, @ModelAttribute MemberVO memberVO) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		if (member != null) {
			if (BCrypt.checkpw(password, member.getPassword())) {
				mav.addObject("member", member);
				mav.setViewName("/member/update.page");
			} else {
				mav.addObject("message", "비밀번호가 다릅니다.");
				mav.setViewName("/member/pwChk");
			}
		} else {
			mav.addObject("message", "세션정보 없음.");
			mav.setViewName("/member/pwChk");
		}
		return mav;
	}
	
	@RequestMapping("/action/check/{id}")
	public int checkId(@PathVariable String id) {
		return service.checkId(id);
	}
	
}
