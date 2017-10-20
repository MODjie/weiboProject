package com.qzz.weibo.entity;

/**
 * 评论的实体类
 * @author Administrator
 *
 */
public class W_comment {
	private int COMMENTID;
	private int WEIBOID;
	private String COMMENTNAME;
	private String COMMCONTENT;
	private String COMMENTTIME;
	private String TOUXIANG;
	
	public String getTOUXIANG() {
		return TOUXIANG;
	}
	public void setTOUXIANG(String tOUXIANG) {
		TOUXIANG = tOUXIANG;
	}
	public String getCOMMENTTIME() {
		return COMMENTTIME;
	}
	public void setCOMMENTTIME(String cOMMENTTIME) {
		COMMENTTIME = cOMMENTTIME;
	}
	public int getCOMMENTID() {
		return COMMENTID;
	}
	public void setCOMMENTID(int cOMMENTID) {
		COMMENTID = cOMMENTID;
	}
	public int getWEIBOID() {
		return WEIBOID;
	}
	public void setWEIBOID(int wEIBOID) {
		WEIBOID = wEIBOID;
	}
	public String getCOMMENTNAME() {
		return COMMENTNAME;
	}
	public void setCOMMENTNAME(String cOMMENTNAME) {
		COMMENTNAME = cOMMENTNAME;
	}
	public String getCOMMCONTENT() {
		return COMMCONTENT;
	}
	public void setCOMMCONTENT(String cOMMCONTENT) {
		COMMCONTENT = cOMMCONTENT;
	}
	
	
	@Override
	public String toString() {
		return "W_comment [COMMENTID=" + COMMENTID + ", WEIBOID=" + WEIBOID + ", COMMENTNAME=" + COMMENTNAME
				+ ", COMMCONTENT=" + COMMCONTENT + ", COMMENTTIME=" + COMMENTTIME + ", TOUXIANG=" + TOUXIANG + "]";
	}
	
	public W_comment(int cOMMENTID, int wEIBOID, String cOMMENTNAME, String cOMMCONTENT, String cOMMENTTIME,
			String tOUXIANG) {
		super();
		COMMENTID = cOMMENTID;
		WEIBOID = wEIBOID;
		COMMENTNAME = cOMMENTNAME;
		COMMCONTENT = cOMMCONTENT;
		COMMENTTIME = cOMMENTTIME;
		TOUXIANG = tOUXIANG;
	}
	public W_comment() {
		// TODO Auto-generated constructor stub
	}
}
