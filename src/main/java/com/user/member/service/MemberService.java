package com.user.member.service;

import java.util.Map;


public interface MemberService {

	public void insertjointemp(Map<String, Object> map) throws Exception ;
	
	public Map<String, Object> selecttempmember(String cert_key) throws Exception;
	
	public void updatetruemember(String id) throws Exception;
}
