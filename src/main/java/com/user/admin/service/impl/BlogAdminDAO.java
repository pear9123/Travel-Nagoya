package com.user.admin.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.user.common.AbstractDAO;

@Repository("BlogAdminDAO")
public class BlogAdminDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public String configimgpath() throws Exception{
		return (String)selectOne("BlogAdmin.selectconfigimgpath");
	}

	@SuppressWarnings("unchecked")
	public void InsertImage(Map<String, String> map) throws Exception {
		insert("BlogAdmin.InsertImage", map);
	}

	@SuppressWarnings("unchecked")
	public void contentinsert(Map<String, String> ContentMap) throws Exception {
		insert("BlogAdmin.contentinsert", ContentMap);
	}
}
