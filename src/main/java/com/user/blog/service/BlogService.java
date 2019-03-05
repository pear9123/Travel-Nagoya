package com.user.blog.service;

import java.util.List;
import java.util.Map;

public interface BlogService {
	
	// USER INFO
	Map<String, Object> selectmember(String username) throws Exception;
	
	// BLOG LIST
	List<Map<String, Object>> selectbloglist() throws Exception;

}
