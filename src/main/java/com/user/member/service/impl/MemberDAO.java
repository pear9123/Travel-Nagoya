package com.user.member.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.user.common.AbstractDAO;

@Repository("MemberDAO")
public class MemberDAO extends AbstractDAO{

	public void insertjointemp(Map<String, Object> map) {
		insert("Member.insertjointemp", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selecttempmember(String cert_key) {
		return (Map<String, Object>) selectOne("Member.selecttempmember", cert_key);
	}

	public void updatetruemember(String id) {
		update("Member.updatetruemember", id);
	}

}
