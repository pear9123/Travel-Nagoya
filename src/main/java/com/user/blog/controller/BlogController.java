package com.user.blog.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.user.blog.service.BlogService;


@Controller
public class BlogController {
	
	@Autowired
	private BlogService BLOGSERVICE;
	
	/* BLOG LIST MAIN */
	@RequestMapping(value = "/BlogMain.do")
	public String BlogMain(Model model, Principal principal) throws Exception {
		System.out.println("=============== BLOG LIST MAIN ===============");
		
		// SECURITY INFO
		String username = principal.getName();
		System.out.println("USERNAME : "+username);
		// SELECT MEMBER INFO
		Map<String, Object> map =  BLOGSERVICE.selectmember(username);
		// SELECT MODEL
		model.addAttribute("map", map);
		System.out.println("IMG : "+map.get("IMG"));
		// SELECT NOTICE
		List<Map<String, Object>> notice = BLOGSERVICE.selectnotice();
		System.out.println("NOTICE 1번 : "+notice.get(0).get("notice"));
		model.addAttribute("notice", notice);
		
		// BLOG CONTENTS LIST
		List<Map<String, Object>> Listmap = BLOGSERVICE.selectbloglist();
		model.addAttribute("list", Listmap);
		
		return "blog/main";
	}
	
	/* BLOG DETAIL */
	@RequestMapping(value = "/BlogDetail.do")
	public String BlogDetail(Model model, HttpServletRequest request, Principal principal) throws Exception {
		System.out.println("=============== BLOG DETAIL ===============");
		String pid = request.getParameter("pid");
		
		// UPDATE COUNT
		BLOGSERVICE.updatecount(pid);
		
		// SELECT IMAGES
		List<Map<String, Object>> list = BLOGSERVICE.selectblogimages(pid);
		model.addAttribute("list", list);
		
		// SELECT INFO
		Map<String, Object> map = BLOGSERVICE.selectbloginfo(pid);
		model.addAttribute("map", map);
		
		// SELECT USER INFO
		String username = principal.getName();
		Map<String, Object> usermap = BLOGSERVICE.selectmember(username);
		model.addAttribute("usermap", usermap);
		
		// SELECT REPLY COUNT
		String count = BLOGSERVICE.selectreplycount(pid);
		model.addAttribute("count", count);
		
		return "blog/detail";
	}
	
	/* BLOG REPLY VIEW */
	@RequestMapping("/BlogReply.do")
	public String BlogReply(HttpServletRequest request, Model model) throws Exception {
		
		String uid = request.getParameter("uid");
		model.addAttribute("uid", uid);
		
		List<Map<String, Object>> listmap = BLOGSERVICE.selectreply(uid);
		model.addAttribute("listmap", listmap);
		
		return "blog/reply";
	}
	
	/* BLOG REPLY PROC */
	@RequestMapping("/BlogReplyProc.do")
	public String BlogReplyProc(HttpServletRequest request, Principal principal) throws Exception {
		String reply = request.getParameter("reply");
//		int uid = Integer.parseInt(request.getParameter("uid"));
		String uid = request.getParameter("uid");
		String name = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply", reply);
		map.put("uid", uid);
		map.put("name", name);
		
		// INSERT REPLY
		BLOGSERVICE.insertreply(map);
		
		return "redirect:/BlogReply.do";
	}

}
