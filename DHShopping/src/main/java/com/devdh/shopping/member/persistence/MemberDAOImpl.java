package com.devdh.shopping.member.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devdh.shopping.member.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sess;

	@Override
	public void insertMember(MemberVO vo) {
		sess.insert("member.insertMember", vo);
	}

	@Override
	public MemberVO selectMember(String id) {
		return sess.selectOne("member.selectMember", id);
	}

	@Override
	public int selectDisabledType(String id) {
		return sess.selectOne("member.selectDisabledType", id);
	}

	@Override
	public void updateMemberSession(Map<String, Object> map) {
		sess.update("member.updateMemberSession", map);
	}

	@Override
	public MemberVO checkSession(String sessionKey) {
		return sess.selectOne("member.checkSession", sessionKey);
	}

	@Override
	public int checkId(String id) {
		return sess.selectOne("member.checkId", id);
	}

	@Override
	public void insertLoginLog(Map<String, String> map) {
		sess.insert("member.insertLoginLog", map);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sess.update("member.updateMember", vo);
	}

	@Override
	public void insertMemberRole(String id) {
		sess.insert("member.insertMemberRole", id);
	}

	@Override
	public String selectMemberRole(String id) {
		return sess.selectOne("member.selectMemberRole", id);
	}
	
}
