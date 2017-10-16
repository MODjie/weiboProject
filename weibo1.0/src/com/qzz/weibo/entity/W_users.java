package com.qzz.weibo.entity;

/**
 * 用户基本信息实体类
 * @author Administrator
 *
 */
public class W_users {
	private int USERID;
	private String USERNAME;
	private String USERPWD;
	private String USERTYPE;
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getUSERPWD() {
		return USERPWD;
	}
	public void setUSERPWD(String uSERPWD) {
		USERPWD = uSERPWD;
	}
	public String getUSERTYPE() {
		return USERTYPE;
	}
	public void setUSERTYPE(String uSERTYPE) {
		USERTYPE = uSERTYPE;
	}
	@Override
	public String toString() {
		return "W_users [USERID=" + USERID + ", USERNAME=" + USERNAME + ", USERPWD=" + USERPWD + ", USERTYPE="
				+ USERTYPE + "]";
	}
	public W_users(int uSERID, String uSERNAME, String uSERPWD, String uSERTYPE) {
		super();
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
		USERTYPE = uSERTYPE;
	}
	
	public W_users() {
		// TODO Auto-generated constructor stub
	}
	
}
