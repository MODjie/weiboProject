package com.qzz.weibo.entity;

/**
 * Œ¢≤© µÃÂ¿‡
 * @author Administrator
 *
 */
public class W_weibo {
	private int WEIBOID;
	private String FWDCONTENT;
	private String CONTENT;
	private String SENDNAME;
	private String IMAGE;
	private String PUBLISHTIME;
	private int COMMENTNUM;
	private int ZANNUM;
	private int FORWARDNUM;
	private int TYPEID;
	private String ISFORWORD;
	private int FWDWEIBOID;	
	private int COLLECTNUM;
	private String TOUXIANG;
	
	
	public int getCOLLECTNUM() {
		return COLLECTNUM;
	}
	public void setCOLLECTNUM(int cOLLECTNUM) {
		COLLECTNUM = cOLLECTNUM;
	}
	public int getWEIBOID() {
		return WEIBOID;
	}
	public void setWEIBOID(int wEIBOID) {
		WEIBOID = wEIBOID;
	}
	public String getFWDCONTENT() {
		return FWDCONTENT;
	}
	public void setFWDCONTENT(String fWDCONTENT) {
		FWDCONTENT = fWDCONTENT;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getSENDNAME() {
		return SENDNAME;
	}
	public void setSENDNAME(String sENDNAME) {
		SENDNAME = sENDNAME;
	}
	public String getIMAGE() {
		return IMAGE;
	}
	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}
	public String getPUBLISHTIME() {
		return PUBLISHTIME;
	}
	public void setPUBLISHTIME(String pUBLISHTIME) {
		PUBLISHTIME = pUBLISHTIME;
	}
	public int getCOMMENTNUM() {
		return COMMENTNUM;
	}
	public void setCOMMENTNUM(int cOMMENTNUM) {
		COMMENTNUM = cOMMENTNUM;
	}
	public int getZANNUM() {
		return ZANNUM;
	}
	public void setZANNUM(int zANNUM) {
		ZANNUM = zANNUM;
	}
	public int getFORWARDNUM() {
		return FORWARDNUM;
	}
	public void setFORWARDNUM(int fORWARDNUM) {
		FORWARDNUM = fORWARDNUM;
	}
	public int getTYPEID() {
		return TYPEID;
	}
	public void setTYPEID(int tYPEID) {
		TYPEID = tYPEID;
	}
	public String getISFORWORD() {
		return ISFORWORD;
	}
	public void setISFORWORD(String iSFORWORD) {
		ISFORWORD = iSFORWORD;
	}
	public int getFWDWEIBOID() {
		return FWDWEIBOID;
	}
	public void setFWDWEIBOID(int fWDWEIBOID) {
		FWDWEIBOID = fWDWEIBOID;
	}
	
	public String getTOUXIANG() {
		return TOUXIANG;
	}
	public void setTOUXIANG(String tOUXIANG) {
		TOUXIANG = tOUXIANG;
	}
	
	
	
	
	public W_weibo(int wEIBOID, String fWDCONTENT, String cONTENT, String sENDNAME, String iMAGE, String pUBLISHTIME,
			int cOMMENTNUM, int zANNUM, int fORWARDNUM, int tYPEID, String iSFORWORD, int fWDWEIBOID, int cOLLECTNUM,
			String tOUXIANG) {
		super();
		WEIBOID = wEIBOID;
		FWDCONTENT = fWDCONTENT;
		CONTENT = cONTENT;
		SENDNAME = sENDNAME;
		IMAGE = iMAGE;
		PUBLISHTIME = pUBLISHTIME;
		COMMENTNUM = cOMMENTNUM;
		ZANNUM = zANNUM;
		FORWARDNUM = fORWARDNUM;
		TYPEID = tYPEID;
		ISFORWORD = iSFORWORD;
		FWDWEIBOID = fWDWEIBOID;
		COLLECTNUM = cOLLECTNUM;
		TOUXIANG = tOUXIANG;
	}
	@Override
	public String toString() {
		return "W_weibo [WEIBOID=" + WEIBOID + ", FWDCONTENT=" + FWDCONTENT + ", CONTENT=" + CONTENT + ", SENDNAME="
				+ SENDNAME + ", IMAGE=" + IMAGE + ", PUBLISHTIME=" + PUBLISHTIME + ", COMMENTNUM=" + COMMENTNUM
				+ ", ZANNUM=" + ZANNUM + ", FORWARDNUM=" + FORWARDNUM + ", TYPEID=" + TYPEID + ", ISFORWORD="
				+ ISFORWORD + ", FWDWEIBOID=" + FWDWEIBOID + ", COLLECTNUM=" + COLLECTNUM + ", TOUXIANG=" + TOUXIANG
				+ "]";
	}
	public W_weibo() {
		// TODO Auto-generated constructor stub
	}
}
