package com.user.admin.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.user.common.AbstractDAO;

@Repository("BlogAdminDAO")
public class BlogAdminDAO extends AbstractDAO{
	
	public String configimgpath() throws Exception{
		return (String)selectOne("BlogAdmin.selectconfigimgpath");
	}

	public void InsertImage(Map<String, String> map) throws Exception {
		insert("BlogAdmin.InsertImage", map);
	}

	public void contentinsert(Map<String, String> ContentMap) throws Exception {
		insert("BlogAdmin.contentinsert", ContentMap);
	}
	
	public void insertnotice(Map<String, Object> map) throws Exception{
		insert("BlogAdmin.insertnotice", map);
	}

	public void deletecontent(String pid) throws Exception {
		delete("BlogAdmin.deletecontent", pid);
	}
}
