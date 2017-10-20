package com.qzz.weibo.entity;

/**
 * 回复的实体类
 * @author Administrator
 *
 */
public class W_reply {
	private int REPLYID;	
	private int COMMENTID;
	private String REPLYANAME;
	private String REPLYBNAME;
	private String REPLYCONTENT;
	private String REPLYTIME;
	public int getREPLYID() {
		return REPLYID;
	}
	public void setREPLYID(int rEPLYID) {
		REPLYID = rEPLYID;
	}
	public int getCOMMENTID() {
		return COMMENTID;
	}
	public void setCOMMENTID(int cOMMENTID) {
		COMMENTID = cOMMENTID;
	}
	public String getREPLYANAME() {
		return REPLYANAME;
	}
	public void setREPLYANAME(String rEPLYANAME) {
		REPLYANAME = rEPLYANAME;
	}
	public String getREPLYBNAME() {
		return REPLYBNAME;
	}
	public void setREPLYBNAME(String rEPLYBNAME) {
		REPLYBNAME = rEPLYBNAME;
	}
	public String getREPLYCONTENT() {
		return REPLYCONTENT;
	}
	public void setREPLYCONTENT(String rEPLYCONTENT) {
		REPLYCONTENT = rEPLYCONTENT;
	}
	public String getREPLYTIME() {
		return REPLYTIME;
	}
	public void setREPLYTIME(String rEPLYTIME) {
		REPLYTIME = rEPLYTIME;
	}
	@Override
	public String toString() {
		return "W_reply [REPLYID=" + REPLYID + ", COMMENTID=" + COMMENTID + ", REPLYANAME=" + REPLYANAME
				+ ", REPLYBNAME=" + REPLYBNAME + ", REPLYCONTENT=" + REPLYCONTENT + ", REPLYTIME=" + REPLYTIME + "]";
	}
	public W_reply(int rEPLYID, int cOMMENTID, String rEPLYANAME, String rEPLYBNAME, String rEPLYCONTENT,
			String rEPLYTIME) {
		super();
		REPLYID = rEPLYID;
		COMMENTID = cOMMENTID;
		REPLYANAME = rEPLYANAME;
		REPLYBNAME = rEPLYBNAME;
		REPLYCONTENT = rEPLYCONTENT;
		REPLYTIME = rEPLYTIME;
	}
	
	public W_reply() {
		// TODO Auto-generated constructor stub
	}
	
}
