package com.user.admin.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.admin.service.BlogAdminService;

@Service("BlogAdminService")
public class BlogAdminServiceImpl implements BlogAdminService{
	
	@Autowired
	BlogAdminDAO BlogAdminDAO;

	// config - ImagePath LOAD
	public String configimgpath() throws Exception {
		return BlogAdminDAO.configimgpath();
	}
	
	// BlogImage - INSERT
	public void InsertImage(Map<String, String> map) throws Exception{
		BlogAdminDAO.InsertImage(map);
	}
	
	// BlogContent - INSERT
	public void contentinsert(Map<String, String> ContentMap) throws Exception{
		BlogAdminDAO.contentinsert(ContentMap);
	}
	
	// BlogNotice - INSERT
	public void insertnotice(Map<String, Object> map) throws Exception{
		BlogAdminDAO.insertnotice(map);
	}
	
	// BlogContentDelete - DELETE
	public void deletecontent(String pid) throws Exception {
		BlogAdminDAO.deletecontent(pid);
	}
	
}
