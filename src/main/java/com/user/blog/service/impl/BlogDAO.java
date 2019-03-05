package com.user.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.user.common.AbstractDAO;

@Repository("BlogDAO")
public class BlogDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectmember(String username) throws Exception{
		return (Map<String, Object>) selectOne("Blog.selectmember", username);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectbloglist() throws Exception{
		return selectList("Blog.selectbloglist");
	}

}
