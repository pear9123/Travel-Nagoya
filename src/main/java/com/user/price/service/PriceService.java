package com.user.price.service;

import java.util.List;
import java.util.Map;

public interface PriceService {
	
	// PriceCreate - INSERT
	public void insertpricemain(Map<String, Object> map) throws Exception;

	// PriceMain - SELECT
	List<Map<String, Object>> selectpricemain() throws Exception;
	
	// PriceContent - SELECT
	List<Map<String, Object>> selectpricecontent(String uid) throws Exception;
	
	// PriceContentrest - INSERT
	public void insertpricecontent_rest(Map<String, Object> map) throws Exception;
	
	// PriceMainDay - SELECT
	String selectpriceday(String uid) throws Exception;
	
	// PriceContent - UPDATE
	public void updatepricecontent(Map<String, Object> map) throws Exception; 
	
	// PriceDelete - DELETE
	public void deletecontent(String pid) throws Exception;
}
