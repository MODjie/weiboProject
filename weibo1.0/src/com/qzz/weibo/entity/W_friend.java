package com.qzz.weibo.entity;
/**
 * 好友实体类
 * @author Administrator
 *
 */
public class W_friend {
	private int FRIENDTABID;
	private String FRIENDNAME;
	private int GROUPID;
	private String TOUXIANG;
	private String FRIENDOWNERNAME;
	
	
	public W_friend(int fRIENDTABID, String fRIENDNAME, int gROUPID, String tOUXIANG, String fRIENDOWNERNAME) {
		super();
		FRIENDTABID = fRIENDTABID;
		FRIENDNAME = fRIENDNAME;
		GROUPID = gROUPID;
		TOUXIANG = tOUXIANG;
		FRIENDOWNERNAME = fRIENDOWNERNAME;
	}


	public W_friend() {
		// TODO Auto-generated constructor stub
	}


	public int getFRIENDTABID() {
		return FRIENDTABID;
	}


	public void setFRIENDTABID(int fRIENDTABID) {
		FRIENDTABID = fRIENDTABID;
	}


	public String getFRIENDNAME() {
		return FRIENDNAME;
	}


	public void setFRIENDNAME(String fRIENDNAME) {
		FRIENDNAME = fRIENDNAME;
	}


	public int getGROUPID() {
		return GROUPID;
	}


	public void setGROUPID(int gROUPID) {
		GROUPID = gROUPID;
	}


	public String getTOUXIANG() {
		return TOUXIANG;
	}


	public void setTOUXIANG(String tOUXIANG) {
		TOUXIANG = tOUXIANG;
	}


	public String getFRIENDOWNERNAME() {
		return FRIENDOWNERNAME;
	}


	public void setFRIENDOWNERNAME(String fRIENDOWNERNAME) {
		FRIENDOWNERNAME = fRIENDOWNERNAME;
	}


	@Override
	public String toString() {
		return "W_friend [FRIENDTABID=" + FRIENDTABID + ", FRIENDNAME=" + FRIENDNAME + ", GROUPID=" + GROUPID
				+ ", TOUXIANG=" + TOUXIANG + ", FRIENDOWNERNAME=" + FRIENDOWNERNAME + "]";
	}
	
	
}
