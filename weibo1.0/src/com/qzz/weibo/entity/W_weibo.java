package com.qzz.weibo.entity;

/**
 * 微博实体类
 * @author Administrator
 *
 */
public class W_weibo {
	private int WEIBOID;//微博编号
	private String FWDCONTENT;//转发时上一条微博的内容
	private String CONTENT;//微博内容，转发时输入的内容
	private String SENDNAME;//发送人昵称
	private String IMAGE;//微博配图
	private String PUBLISHTIME;//发布时间
	private int COMMENTNUM;//评论数
	private int ZANNUM;//点赞数
	private int FORWARDNUM;//转发数
	private int TYPEID;//微博类型
	private String ISFORWORD;//是否为转发
	private int FWDWEIBOID;	//上一级的微博编号
	private int COLLECTNUM;//收藏数
	private String TOUXIANG;//发送人头像
	private String FORWARDIMG;//原来的图片（转发源）
	private String OLDTIME;//原来（转发源）的发布时间
	
	
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
	
	public String getFORWARDIMG() {
		return FORWARDIMG;
	}
	public void setFORWARDIMG(String fORWARDIMG) {
		FORWARDIMG = fORWARDIMG;
	}
	public String getOLDTIME() {
		return OLDTIME;
	}
	public void setOLDTIME(String oLDTIME) {
		OLDTIME = oLDTIME;
	}
	
	public W_weibo(int wEIBOID, String fWDCONTENT, String cONTENT, String sENDNAME, String iMAGE, String pUBLISHTIME,
			int cOMMENTNUM, int zANNUM, int fORWARDNUM, int tYPEID, String iSFORWORD, int fWDWEIBOID, int cOLLECTNUM,
			String tOUXIANG, String fORWARDIMG, String oLDTIME) {
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
		FORWARDIMG = fORWARDIMG;
		OLDTIME = oLDTIME;
	}
	
	@Override
	public String toString() {
		return "W_weibo [WEIBOID=" + WEIBOID + ", FWDCONTENT=" + FWDCONTENT + ", CONTENT=" + CONTENT + ", SENDNAME="
				+ SENDNAME + ", IMAGE=" + IMAGE + ", PUBLISHTIME=" + PUBLISHTIME + ", COMMENTNUM=" + COMMENTNUM
				+ ", ZANNUM=" + ZANNUM + ", FORWARDNUM=" + FORWARDNUM + ", TYPEID=" + TYPEID + ", ISFORWORD="
				+ ISFORWORD + ", FWDWEIBOID=" + FWDWEIBOID + ", COLLECTNUM=" + COLLECTNUM + ", TOUXIANG=" + TOUXIANG
				+ ", FORWARDIMG=" + FORWARDIMG + ", OLDTIME=" + OLDTIME + "]";
	}
	public W_weibo() {
		// TODO Auto-generated constructor stub
	}
}
