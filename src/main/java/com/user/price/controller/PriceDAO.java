package com.user.price.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.user.common.AbstractDAO;

@Repository("PriceDAO")
public class PriceDAO extends AbstractDAO{

	public void insertpricemain(Map<String, Object> map) {
		insert("Price.insertpricemain", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectpricemain() {
		return selectList("Price.selectpricemain");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectpricecontent(String uid) {
		return selectList("Price.selectpricecontent",uid);
	}

	public void insertpricecontent_rest(Map<String, Object> map) {
		insert("Price.insertpricecontent_rest", map);
	}

}
