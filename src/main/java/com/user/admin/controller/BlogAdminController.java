package com.user.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogAdminController {

	@RequestMapping("/AdminBlog.do")
	public String BlogAdminMain() {
		return "admin/AdminBlog";
	}
}
