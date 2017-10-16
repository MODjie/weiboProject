package com.qzz.weibo.entity;

/**
 * 赞的实体类
 * @author Administrator
 *
 */
public class W_zan {
	private int ZANID;
	private int WEIBOID;
	private String ZANNAME;
	public int getZANID() {
		return ZANID;
	}
	public void setZANID(int zANID) {
		ZANID = zANID;
	}
	public int getWEIBOID() {
		return WEIBOID;
	}
	public void setWEIBOID(int wEIBOID) {
		WEIBOID = wEIBOID;
	}
	public String getZANNAME() {
		return ZANNAME;
	}
	public void setZANNAME(String zANNAME) {
		ZANNAME = zANNAME;
	}
	@Override
	public String toString() {
		return "W_zan [ZANID=" + ZANID + ", WEIBOID=" + WEIBOID + ", ZANNAME=" + ZANNAME + "]";
	}
	public W_zan(int zANID, int wEIBOID, String zANNAME) {
		super();
		ZANID = zANID;
		WEIBOID = wEIBOID;
		ZANNAME = zANNAME;
	}
	
	public W_zan() {
		// TODO Auto-generated constructor stub
	}
}
