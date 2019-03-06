package com.devdh.shopping.member.persistence;

import java.util.Map;

import com.devdh.shopping.member.domain.MemberVO;

public interface MemberDAO {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO selectMember(String id);
	
	public int selectDisabledType(String id);
	
	public void updateMemberSession(Map<String, Object> map);
	
	public MemberVO checkSession(String sessionKey);
	
	public int checkId(String id);
	
	public void insertLoginLog(Map<String, String> map);
	
	public void updateMember(MemberVO vo);
	
	public void insertMemberRole(String id);
	
	public String selectMemberRole(String id);
}
