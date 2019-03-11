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
	
	public List<Map<String, Object>> selectblogimages(String pid) throws Exception {
		return BlogDAO.selectblogimages(pid);
	}
	
	public Map<String, Object> selectbloginfo(String pid) throws Exception {
		return BlogDAO.selectbloginfo(pid);
	}
	
	public void updatecount(String pid) throws Exception {
		BlogDAO.updatecount(pid);
	}
	
	public List<Map<String, Object>> selectnotice() throws Exception {
		return BlogDAO.selectnotice();
	}
	
	public void insertreply(Map<String, Object> map) throws Exception {
		BlogDAO.insertreply(map);
	}
	
	public List<Map<String, Object>> selectreply(String uid) throws Exception {
		return BlogDAO.selectreply(uid);
	}
	
	public String selectreplycount(String uid) throws Exception {
		return BlogDAO.selectreplycount(uid);
	}
	
}
