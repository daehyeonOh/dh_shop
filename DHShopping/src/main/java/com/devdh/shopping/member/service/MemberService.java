package com.devdh.shopping.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.devdh.shopping.member.domain.MemberVO;

public interface MemberService {

	public void signUp(MemberVO vo);
	
	public MemberVO signIn(String id);
	
	public MemberVO checkSession(String sessionKey);
	
	public void updateMemberSession(Map<String, Object> map);
	
	public int checkId(String id);
	
	public int getDisabledType(String id);
	
	public void insertLoginLog(Map<String, String> map);
	
	public String getIp(HttpServletRequest request);
	
	public void updateMember(MemberVO vo);
	
	public String selectMemberRole(String id);
}
