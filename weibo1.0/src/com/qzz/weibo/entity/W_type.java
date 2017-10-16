package com.qzz.weibo.entity;

/**
 * 微博类型的实体类
 * @author Administrator
 *
 */
public class W_type {
	private int TYPEID;
	private String TYPENAME;
	public int getTYPEID() {
		return TYPEID;
	}
	public void setTYPEID(int tYPEID) {
		TYPEID = tYPEID;
	}
	public String getTYPENAME() {
		return TYPENAME;
	}
	public void setTYPENAME(String tYPENAME) {
		TYPENAME = tYPENAME;
	}
	@Override
	public String toString() {
		return "W_type [TYPEID=" + TYPEID + ", TYPENAME=" + TYPENAME + "]";
	}
	public W_type(int tYPEID, String tYPENAME) {
		super();
		TYPEID = tYPEID;
		TYPENAME = tYPENAME;
	}
	
	public W_type() {
		// TODO Auto-generated constructor stub
	}
}
