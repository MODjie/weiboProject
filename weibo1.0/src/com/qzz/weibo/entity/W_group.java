package com.qzz.weibo.entity;
/**
 * 分组的实体类
 * @author Administrator
 *
 */
public class W_group {
	private int GROUPID;
	private String GROUPNAME;
	private String CREATENAME;
	public int getGROUPID() {
		return GROUPID;
	}
	public void setGROUPID(int gROUPID) {
		GROUPID = gROUPID;
	}
	public String getGROUPNAME() {
		return GROUPNAME;
	}
	public void setGROUPNAME(String gROUPNAME) {
		GROUPNAME = gROUPNAME;
	}
	public String getCREATENAME() {
		return CREATENAME;
	}
	public void setCREATENAME(String cREATENAME) {
		CREATENAME = cREATENAME;
	}
	public W_group(int gROUPID, String gROUPNAME, String cREATENAME) {
		super();
		GROUPID = gROUPID;
		GROUPNAME = gROUPNAME;
		CREATENAME = cREATENAME;
	}
	@Override
	public String toString() {
		return "W_group [GROUPID=" + GROUPID + ", GROUPNAME=" + GROUPNAME + ", CREATENAME=" + CREATENAME + "]";
	}
	
	public W_group() {
		// TODO Auto-generated constructor stub
	}
}
