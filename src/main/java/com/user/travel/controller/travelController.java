package com.user.travel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.travel.service.KakaoRestApiHelper;

@Controller
public class travelController {
	
	private static KakaoRestApiHelper kapi = new KakaoRestApiHelper();
	/**  
	 * 지도지도
	**/
	@RequestMapping("/travel.do")
	public String maplist() {
		System.out.println("========지도를 펼쳐라=======");
		return "travel/maplist";
	}
	
	/**  
	 * 네비
	**/
	@RequestMapping("/TravelNaviView.do")
	public String TravelNaviView(Model model, HttpServletRequest request) {
		String appkey = "e649516b2c829c7966b88c0a9437a5f7";
		model.addAttribute("appkey", appkey);
		String isend = request.getParameter("isend");
		List<Map<String,Object>> map = kapi.KakaoRestAPI(isend);
		model.addAttribute("items", map);
		return "travel/TravelNavi";
	}
	
	@RequestMapping("/TravelNaviKeyword.do")
	public String TravelNaviKeyword(@RequestParam HashMap<String, Object> map, Model model ) {
		
		List<Map<String,Object>> keymap = kapi.KakaoRestAPI_Keyword(map);
		model.addAttribute("keyitems", keymap);
		return "travel/TravelNavi";
	}


}
