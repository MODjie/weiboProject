package com.qzz.weibo.entity;
/**
 * 用户详细信息
 * @author Administrator
 *
 */
public class W_userinfo {
	private String USERNAME;
	private String NICKNAME;
	private String REALNAME;
	private String SEX;
	private String BIRTH;
	private String LOCATION;
	private String EMAIL;
	private String QQ;
	private String PHONENUM;
	private String REMARK;
	private String TOUXIANG;
	public String getTOUXIANG() {
		return TOUXIANG;
	}
	public void setTOUXIANG(String tOUXIANG) {
		TOUXIANG = tOUXIANG;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getNICKNAME() {
		return NICKNAME;
	}
	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}
	public String getREALNAME() {
		return REALNAME;
	}
	public void setREALNAME(String rEALNAME) {
		REALNAME = rEALNAME;
	}
	public String getSEX() {
		return SEX;
	}
	public void setSEX(String sEX) {
		SEX = sEX;
	}
	public String getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}
	public String getLOCATION() {
		return LOCATION;
	}
	public void setLOCATION(String lOCATION) {
		LOCATION = lOCATION;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getPHONENUM() {
		return PHONENUM;
	}
	public void setPHONENUM(String pHONENUM) {
		PHONENUM = pHONENUM;
	}
	public String getREMARK() {
		return REMARK;
	}
	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}
	
	
	@Override
	public String toString() {
		return "W_userinfo [USERNAME=" + USERNAME + ", NICKNAME=" + NICKNAME + ", REALNAME=" + REALNAME + ", SEX=" + SEX
				+ ", BIRTH=" + BIRTH + ", LOCATION=" + LOCATION + ", EMAIL=" + EMAIL + ", QQ=" + QQ + ", PHONENUM="
				+ PHONENUM + ", REMARK=" + REMARK + ", TOUXIANG=" + TOUXIANG + "]";
	}
	
	public W_userinfo(String uSERNAME, String nICKNAME, String rEALNAME, String sEX, String bIRTH, String lOCATION,
			String eMAIL, String qQ, String pHONENUM, String rEMARK, String tOUXIANG) {
		super();
		USERNAME = uSERNAME;
		NICKNAME = nICKNAME;
		REALNAME = rEALNAME;
		SEX = sEX;
		BIRTH = bIRTH;
		LOCATION = lOCATION;
		EMAIL = eMAIL;
		QQ = qQ;
		PHONENUM = pHONENUM;
		REMARK = rEMARK;
		TOUXIANG = tOUXIANG;
	}
	public W_userinfo() {
		// TODO Auto-generated constructor stub
	}
}
