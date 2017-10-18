package com.qzz.weibo.entity;

/**
 * 收藏的实体类
 * @author Administrator
 *
 */
public class W_collect {
	private int COLLECTID;
	private int WEIBOID;
	private String USERNAME;
	private String COLLECTTIME;
	
	
	public String getCOLLECTTIME() {
		return COLLECTTIME;
	}

	public void setCOLLECTTIME(String cOLLECTTIME) {
		COLLECTTIME = cOLLECTTIME;
	}

	
	
	public W_collect(int cOLLECTID, int wEIBOID, String uSERNAME, String cOLLECTTIME) {
		super();
		COLLECTID = cOLLECTID;
		WEIBOID = wEIBOID;
		USERNAME = uSERNAME;
		COLLECTTIME = cOLLECTTIME;
	}

	public W_collect() {
		// TODO Auto-generated constructor stub
	}

	public int getCOLLECTID() {
		return COLLECTID;
	}

	public void setCOLLECTID(int cOLLECTID) {
		COLLECTID = cOLLECTID;
	}

	public int getWEIBOID() {
		return WEIBOID;
	}

	public void setWEIBOID(int wEIBOID) {
		WEIBOID = wEIBOID;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	@Override
	public String toString() {
		return "W_collect [COLLECTID=" + COLLECTID + ", WEIBOID=" + WEIBOID + ", USERNAME=" + USERNAME
				+ ", COLLECTTIME=" + COLLECTTIME + "]";
	}

	
	
	
}
