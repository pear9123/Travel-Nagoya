package com.user.blog.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.user.blog.service.BlogDTO;
import com.user.blog.service.BlogService;


@Controller
public class BlogController {
	
	@Autowired
	private BlogService BLOGSERVICE;
	
	/* BLOG LIST MAIN */
	@RequestMapping(value = "/BlogMain.do")
	public String BlogMain(Model model, Principal principal) throws Exception {
		System.out.println("===============Blog Main 진입===============");
		
		// SECURITY INFO
		String username = principal.getName();
		System.out.println("USERNAME : "+username);
		// SELECT MEMBER INFO
		Map<String, Object> map =  BLOGSERVICE.selectmember(username);
		// SELECT MODEL
		model.addAttribute("map", map);
		System.out.println("IMG : "+map.get("IMG"));
		
		// BLOG CONTENTS LIST
		List<Map<String, Object>> Listmap = BLOGSERVICE.selectbloglist();
		model.addAttribute("list", Listmap);
		
		return "blog/main";
	}

}
