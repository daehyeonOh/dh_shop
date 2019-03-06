package com.devdh.shopping.home.domain;

import java.util.List;

public class CategoryVO {

	private String code;
	private String title;
	private String parent;
	private int level;
	private int seq;
	private List<CategoryVO> child;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public List<CategoryVO> getChild() {
		return child;
	}
	public void setChild(List<CategoryVO> child) {
		this.child = child;
	}
	
}
