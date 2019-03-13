package com.user.price.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.price.controller.PriceDAO;
import com.user.price.service.PriceService;

@Service("PriceService")
public class PriceServiceImpl implements PriceService {

	@Autowired
	PriceDAO priceDAO;
	
	public void insertpricemain(Map<String, Object> map) throws Exception {
		priceDAO.insertpricemain(map);
	}
	
	public List<Map<String, Object>> selectpricemain() throws Exception {
		return priceDAO.selectpricemain();
	}
	
	public List<Map<String, Object>> selectpricecontent(String uid) throws Exception {
		return priceDAO.selectpricecontent(uid);
	}
	
	public void insertpricecontent_rest(Map<String, Object> map) throws Exception {
		priceDAO.insertpricecontent_rest(map);
	}
	
	public String selectpriceday(String uid) throws Exception {
		return priceDAO.selectpriceday(uid);
	}
}
