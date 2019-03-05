package com.user.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.blog.service.BlogService;


@Service("BlogService")
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	BlogDAO BlogDAO;
	
	public Map<String, Object> selectmember(String username) throws Exception {
		Map<String, Object> ResultMap = BlogDAO.selectmember(username);
		return ResultMap;
	}
	
	public List<Map<String, Object>> selectbloglist() throws Exception {
		return BlogDAO.selectbloglist();
	}

}
