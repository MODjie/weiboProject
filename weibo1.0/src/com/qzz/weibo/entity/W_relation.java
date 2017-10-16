package com.qzz.weibo.entity;

/**
 * 关注的关系表实体类
 * @author Administrator
 *
 */
public class W_relation {
	private int RELATIONID;
	private String PERSONANAME;
	private String PERSONBNAME;
	public int getRELATIONID() {
		return RELATIONID;
	}
	public void setRELATIONID(int rELATIONID) {
		RELATIONID = rELATIONID;
	}
	public String getPERSONANAME() {
		return PERSONANAME;
	}
	public void setPERSONANAME(String pERSONANAME) {
		PERSONANAME = pERSONANAME;
	}
	public String getPERSONBNAME() {
		return PERSONBNAME;
	}
	public void setPERSONBNAME(String pERSONBNAME) {
		PERSONBNAME = pERSONBNAME;
	}
	@Override
	public String toString() {
		return "W_relation [RELATIONID=" + RELATIONID + ", PERSONANAME=" + PERSONANAME + ", PERSONBNAME=" + PERSONBNAME
				+ "]";
	}
	public W_relation(int rELATIONID, String pERSONANAME, String pERSONBNAME) {
		super();
		RELATIONID = rELATIONID;
		PERSONANAME = pERSONANAME;
		PERSONBNAME = pERSONBNAME;
	}
	
	public W_relation() {
		// TODO Auto-generated constructor stub
	}
}
