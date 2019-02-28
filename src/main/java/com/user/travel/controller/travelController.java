package com.user.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class travelController {

	/**  
	 * 지도지도
	**/
	@RequestMapping("/travel.do")
	public String maplist() {
		System.out.println("========지도를 펼쳐라=======");
		return "travel/maplist";
	}

}
