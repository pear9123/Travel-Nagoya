package com.user.price.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.user.blog.service.BlogService;
import com.user.price.service.PriceService;

@Controller
public class PriceController {
	
	@Autowired
	private PriceService PRICESERVICE;
	
	@RequestMapping("/PriceCreate.do")
	public String PriceCreate(HttpServletRequest request) throws Exception{
		String state = request.getParameter("message-title");
		String comment = request.getParameter("message-text");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("comment", comment);
		
		PRICESERVICE.insertpricemain(map);
		
		return "redirect:/Price.do";
	}

	@RequestMapping("/Price.do")
	public String Price(Model model) throws Exception{
		List<Map<String, Object>> list = PRICESERVICE.selectpricemain();
		model.addAttribute("list", list);
		
		return "price/pricemain";
	}
	
	@RequestMapping("/PriceContent.do")
	public String PriceContent(HttpServletRequest request, Model model) throws Exception{
		
		String uid = request.getParameter("primary");
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		System.out.println("=============================================");
		System.out.println("uid : "+uid);
		System.out.println("=============================================");
		if(uid == null) {
			String pkey = (String) flashMap.get("uid");
			uid = pkey;
			System.out.println("=============================================");
			System.out.println("uid null: "+uid);
			System.out.println("=============================================");
		}
		List<Map<String, Object>> list = PRICESERVICE.selectpricecontent(uid);
		// DAY
		String day_t = PRICESERVICE.selectpriceday(uid);
		
		model.addAttribute("Contentlist", list);
		model.addAttribute("day", day_t);
		model.addAttribute("uid", uid);
		return "price/pricecontent";
	}
	
	
	@RequestMapping("/PriceContentProc.do")
	public String PriceCreateProc(HttpServletRequest request, @RequestParam HashMap<String, Object> map, Principal principal,RedirectAttributes redirect ) throws Exception{
		String flag = (String) map.get("flag");
		// SECURITY INFO
		String username = principal.getName();
		System.out.println("USERNAME : "+username);
		map.put("name", username);
		PRICESERVICE.insertpricecontent_rest(map);
		
		redirect.addFlashAttribute("uid", map.get("uid"));
		return "redirect:/PriceContent.do";
	}
	
	@RequestMapping("/PriceContentModify.do")
	public String PriceContentModify(@RequestParam HashMap<String, Object> map, RedirectAttributes redirect) throws Exception {
		//PARAM == modify_select_box, modify_uid, modify_flag, modify_price, modify_state, modify_cnt
		System.out.println("=============modify_uid===========" + map.get("modify_uid"));
		System.out.println("=============modify_flag===========" + map.get("modify_flag"));
		System.out.println("=============uid===========" + map.get("uid"));
		String flag = (String)map.get("modify_flag");
		if(flag.equals("rest") || flag.equals("etc")) {
			map.put("modify.cnt",0);
		} else if(flag.equals("trans")) {
			map.put("modify_state","nstate");
			int modify_price = Integer.parseInt((String) map.get("modify_price"));
			int modify_cnt   = Integer.parseInt((String) map.get("modify_cnt"));
			int person_price = modify_price / modify_cnt;
			map.put("person_price",person_price);
		}
		
		PRICESERVICE.updatepricecontent(map);
		redirect.addFlashAttribute("uid", map.get("uid"));
		
		return "redirect:/PriceContent.do";
	}
	
	@RequestMapping("/PriceContentDelete.do")
	public String PriceContentDelete(HttpServletRequest request, RedirectAttributes redirect) throws Exception {
		String pid = request.getParameter("pid");
		String uid = request.getParameter("uid");
		PRICESERVICE.deletecontent(pid);
		
		redirect.addFlashAttribute("uid", uid);
		return "redirect:/PriceContent.do";
	}
}
