package com.user.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BlogController {
	
	/* BLOG LIST MAIN */
	@RequestMapping(value = "/BlogMain.do")
	public String BlogMain() {
		System.out.println("===Blog Main 진입===");
		return "blog/main";
	}

}
