package com.user.blog.service;

import java.util.List;
import java.util.Map;

public interface BlogService {
	
	// USER INFO - SELECT
	Map<String, Object> selectmember(String username) throws Exception;
	
	// BLOG LIST - SELECT
	List<Map<String, Object>> selectbloglist() throws Exception;
	
	// BlogDetailImages - SELECT
	List<Map<String, Object>> selectblogimages(String pid) throws Exception;
		
	// BlogDetailInfo - SELECT
	Map<String, Object> selectbloginfo(String pid) throws Exception;
	
	// UpdateCount - UPDATE
	public void updatecount(String pid) throws Exception;
	
	// BlogNotice - SELECT
	List<Map<String, Object>> selectnotice() throws Exception;
	
	// BlogDetailReply - INSERT
	public void insertreply(Map<String, Object> map) throws Exception;
	
	// BlogReply - SELECT
	List<Map<String, Object>> selectreply(String uid) throws Exception;
	
	// BlogReplyCount - SELECT
	String selectreplycount(String uid) throws Exception;
	
}
