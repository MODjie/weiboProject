package com.qzz.weibo.entity;
/**
 * �û���ϸ��Ϣ
 * @author Administrator
 *
 */
public class W_userinfo {
	private String USERNAME;
	private String NICKNAME;
	private String REALNAME;
	private String SEX;
	private String BIRTH;
	private String PROVINCE;
	private String CITY1;
	private String CITY2;
	private String EMAIL;
	private String QQ;
	private String PHONENUM;
	private String REMARK;
	private String TOUXIANG;
	
	
	
	@Override
	public String toString() {
		return "W_userinfo [USERNAME=" + USERNAME + ", NICKNAME=" + NICKNAME + ", REALNAME=" + REALNAME + ", SEX=" + SEX
				+ ", BIRTH=" + BIRTH + ", PROVINCE=" + PROVINCE + ", CITY1=" + CITY1 + ", CITY2=" + CITY2 + ", EMAIL="
				+ EMAIL + ", QQ=" + QQ + ", PHONENUM=" + PHONENUM + ", REMARK=" + REMARK + ", TOUXIANG=" + TOUXIANG
				+ "]";
	}



	public W_userinfo(String uSERNAME, String nICKNAME, String rEALNAME, String sEX, String bIRTH, String pROVINCE,
			String cITY1, String cITY2, String eMAIL, String qQ, String pHONENUM, String rEMARK, String tOUXIANG) {
		super();
		USERNAME = uSERNAME;
		NICKNAME = nICKNAME;
		REALNAME = rEALNAME;
		SEX = sEX;
		BIRTH = bIRTH;
		PROVINCE = pROVINCE;
		CITY1 = cITY1;
		CITY2 = cITY2;
		EMAIL = eMAIL;
		QQ = qQ;
		PHONENUM = pHONENUM;
		REMARK = rEMARK;
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



	public String getPROVINCE() {
		return PROVINCE;
	}



	public void setPROVINCE(String pROVINCE) {
		PROVINCE = pROVINCE;
	}



	public String getCITY1() {
		return CITY1;
	}



	public void setCITY1(String cITY1) {
		CITY1 = cITY1;
	}



	public String getCITY2() {
		return CITY2;
	}



	public void setCITY2(String cITY2) {
		CITY2 = cITY2;
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



	public String getTOUXIANG() {
		return TOUXIANG;
	}



	public void setTOUXIANG(String tOUXIANG) {
		TOUXIANG = tOUXIANG;
	}



	public W_userinfo() {
		// TODO Auto-generated constructor stub
	}
}
