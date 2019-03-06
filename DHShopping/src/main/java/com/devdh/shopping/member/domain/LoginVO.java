package com.devdh.shopping.member.domain;

public class LoginVO {

	private String id;
	private String password;
	
	private boolean remember_me;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isRemember_me() {
		return remember_me;
	}
	public void setRemember_me(boolean remember_me) {
		this.remember_me = remember_me;
	}
}
