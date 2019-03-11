package com.user.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.user.common.AbstractDAO;

@Repository("BlogDAO")
public class BlogDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectmember(String username) throws Exception {
		return (Map<String, Object>) selectOne("Blog.selectmember", username);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectbloglist() throws Exception {
		return selectList("Blog.selectbloglist");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectblogimages(String pid) throws Exception {
		return selectList("Blog.selectblogimages", pid);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectbloginfo(String pid) throws Exception {
		return (Map<String, Object>) selectOne("Blog.selectbloginfo", pid);
	}
	
	public void updatecount(String pid) throws Exception {
		update("Blog.updatecount", pid);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectnotice() throws Exception {
		return selectList("Blog.selectnotice");
	}
	
	public void insertreply(Map<String, Object> map) throws Exception {
		insert("Blog.insertreply", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectreply(String uid) throws Exception {
		return selectList("Blog.selectreply", uid);
	}
	
	public String selectreplycount(String uid) throws Exception {
		return (String) selectOne("Blog.selectreplycount", uid);
	}
}
