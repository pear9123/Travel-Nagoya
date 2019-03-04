package com.user.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.user.main.controller.HomeController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/* LOGIN FORM VIEW */
	@RequestMapping("/LoginForm.do")
	public String LoginForm() {
		
		return "member/Login";
	}
	
	/* LOGIN RESULT */
	@RequestMapping(value = "/LoginResult.do")
	public String LoginResult(SecurityContextHolderAwareRequestWrapper request) {
	logger.info("=====MemberController ComeIn=====");
	/* View 정보를 반환하는 부분 */
	/*로그인한 계정의 Roll이 ROLE_ADMIN이면 영역로 이동*/
	String result= "";
		if (request.isUserInRole("ROLE_ADMIN")) {
			result = "redirect:BlogMain.do";
		} else {
			result = "redirect:BlogMain.do";
		}
	return result;
	}
	
	/* LOGIN FAIL */
	@RequestMapping("/LoginFail.do")
	public String LoginFail() {
		
		return "member/LoginFail";
	}
	
	/* LOGOUT */
	@RequestMapping("/LogoutForm.do")
	public String LogoutForm() {
		
		return "member/LogoutForm";
	}
	
	

}
