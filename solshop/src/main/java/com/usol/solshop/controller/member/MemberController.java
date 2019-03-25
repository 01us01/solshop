package com.usol.solshop.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.usol.solshop.HomeController;
import com.usol.solshop.model.member.dto.MemberDTO;
import com.usol.solshop.service.member.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		
		boolean result=memberService.loginCheck(dto, session);
		
		ModelAndView mav = new ModelAndView();
		
		if(result) {
			mav.setViewName("home");
		}else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	@RequestMapping("insert.do")
	public String insert(MemberDTO dto) {
		memberService.insert(dto);
		return "member/login";
	}
	
}
