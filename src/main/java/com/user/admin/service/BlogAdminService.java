package com.user.admin.service;

import java.util.Map;

public interface BlogAdminService {
	
	// config 이미지 PATH - SELECT
	String configimgpath() throws Exception;
	
	// BlogImage - INSERT
	public void InsertImage(Map<String, String> map) throws Exception;

	// BlogContent - INSERT
	public void contentinsert(Map<String, String> ContentMap) throws Exception;
	
}
