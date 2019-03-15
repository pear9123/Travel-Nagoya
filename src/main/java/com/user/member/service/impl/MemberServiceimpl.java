package com.user.member.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.member.service.MemberService;

@Service("MemberService")
public class MemberServiceimpl implements MemberService {
	
	@Autowired
	private MemberDAO MemberDAO;
	
	public void insertjointemp(Map<String, Object> map) throws Exception {
		MemberDAO.insertjointemp(map);
	}
	
	public Map<String, Object> selecttempmember(String cert_key) throws Exception {
		return MemberDAO.selecttempmember(cert_key);
	}
	
	public void updatetruemember(String id) throws Exception {
		MemberDAO.updatetruemember(id);
	}

}
