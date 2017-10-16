package com.qzz.weibo.entity;

/**
 * 举报表的实体类
 * @author Administrator
 *
 */
public class W_repori {
	private int REPORTID;
	private int WEIBOID;
	private String REPNAME;
	private String REPTYPE;
	private String REMARK;
	private String STATE;
	private String DUALTIME;
	public int getREPORTID() {
		return REPORTID;
	}
	public void setREPORTID(int rEPORTID) {
		REPORTID = rEPORTID;
	}
	public int getWEIBOID() {
		return WEIBOID;
	}
	public void setWEIBOID(int wEIBOID) {
		WEIBOID = wEIBOID;
	}
	public String getREPNAME() {
		return REPNAME;
	}
	public void setREPNAME(String rEPNAME) {
		REPNAME = rEPNAME;
	}
	public String getREPTYPE() {
		return REPTYPE;
	}
	public void setREPTYPE(String rEPTYPE) {
		REPTYPE = rEPTYPE;
	}
	public String getREMARK() {
		return REMARK;
	}
	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}
	public String getSTATE() {
		return STATE;
	}
	public void setSTATE(String sTATE) {
		STATE = sTATE;
	}
	public String getDUALTIME() {
		return DUALTIME;
	}
	public void setDUALTIME(String dUALTIME) {
		DUALTIME = dUALTIME;
	}
	@Override
	public String toString() {
		return "W_repori [REPORTID=" + REPORTID + ", WEIBOID=" + WEIBOID + ", REPNAME=" + REPNAME + ", REPTYPE="
				+ REPTYPE + ", REMARK=" + REMARK + ", STATE=" + STATE + ", DUALTIME=" + DUALTIME + "]";
	}
	public W_repori(int rEPORTID, int wEIBOID, String rEPNAME, String rEPTYPE, String rEMARK, String sTATE,
			String dUALTIME) {
		super();
		REPORTID = rEPORTID;
		WEIBOID = wEIBOID;
		REPNAME = rEPNAME;
		REPTYPE = rEPTYPE;
		REMARK = rEMARK;
		STATE = sTATE;
		DUALTIME = dUALTIME;
	}
	
	public W_repori() {
		// TODO Auto-generated constructor stub
	}
}
