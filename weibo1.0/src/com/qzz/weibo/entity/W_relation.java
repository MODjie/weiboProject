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
	private String TOUXIANG;
	private String NICKNAME;
	private String CITY1;
	private String REMARK;
	
	public W_relation() {
		// TODO Auto-generated constructor stub
	}

	public W_relation(int rELATIONID, String pERSONANAME, String pERSONBNAME, String tOUXIANG, String nICKNAME,
			String cITY1, String rEMARK) {
		super();
		RELATIONID = rELATIONID;
		PERSONANAME = pERSONANAME;
		PERSONBNAME = pERSONBNAME;
		TOUXIANG = tOUXIANG;
		NICKNAME = nICKNAME;
		CITY1 = cITY1;
		REMARK = rEMARK;
	}

	@Override
	public String toString() {
		return "W_relation [RELATIONID=" + RELATIONID + ", PERSONANAME=" + PERSONANAME + ", PERSONBNAME=" + PERSONBNAME
				+ ", TOUXIANG=" + TOUXIANG + ", NICKNAME=" + NICKNAME + ", CITY1=" + CITY1 + ", REMARK=" + REMARK + "]";
	}

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

	public String getTOUXIANG() {
		return TOUXIANG;
	}

	public void setTOUXIANG(String tOUXIANG) {
		TOUXIANG = tOUXIANG;
	}

	public String getNICKNAME() {
		return NICKNAME;
	}

	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}

	public String getCITY1() {
		return CITY1;
	}

	public void setCITY1(String cITY1) {
		CITY1 = cITY1;
	}

	public String getREMARK() {
		return REMARK;
	}

	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}
}
