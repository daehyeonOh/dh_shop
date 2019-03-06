package com.devdh.shopping.member.service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.devdh.shopping.member.domain.MemberVO;
import com.devdh.shopping.member.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO dao;

	@Transactional
	@Override
	public void signUp(MemberVO vo) {
		dao.insertMember(vo);
		dao.insertMemberRole(vo.getId());
	}

	@Override
	public MemberVO signIn(String id) {
		return dao.selectMember(id);
	}

	@Override
	public MemberVO checkSession(String sessionKey) {
		return dao.checkSession(sessionKey);
	}

	@Override
	public void updateMemberSession(Map<String, Object> map) {
		dao.updateMemberSession(map);
	}

	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}
	
	@Override
	public int getDisabledType(String id) {
		return dao.selectDisabledType(id);
	}
	
	@Override
	public void insertLoginLog(Map<String, String> map) {
		dao.insertLoginLog(map);
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		dao.updateMember(vo);
	}
	
	@Override
	public String selectMemberRole(String id) {
		return dao.selectMemberRole(id);
	}
	
	public String getIp(HttpServletRequest request) {
		 
        String ip = request.getHeader("X-Forwarded-For");
 
        if (ip == null) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null) {
            ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}

