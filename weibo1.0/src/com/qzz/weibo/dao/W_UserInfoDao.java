package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_userinfo;
import com.qzz.weibo.util.BaseDao;

public class W_UserInfoDao {

	/**
	 * 鏍规嵁鐧诲綍鍚嶈幏鍙栫敤鎴风殑鎵�鏈変俊鎭�
	 * 
	 * @param username
	 * @return
	 */
	public List<W_userinfo> getAllUserInfo(String username) {
		return (List<W_userinfo>) BaseDao.select("select * from W_USERINFO where USERNAME=?", W_userinfo.class,
				username);
	}
	
	
	/**
	 * 鏇存柊鐢ㄦ埛鐨勫熀鏈俊鎭儏鍐�
	 * 
	 * @param userinfo
	 * @param username
	 * @return
	 */
	public int updateUserInfo(W_userinfo userinfo, String username) {
		return BaseDao.execute(
				"update W_USERINFO set NICKNAME=?,REALNAME=?,SEX=?,BIRTH=?,LOCATION=?,EMAIL=?,QQ=?,PHONENUM=?,REMARK=? where USERNAME=?",
				userinfo.getNICKNAME(), userinfo.getREALNAME(), userinfo.getSEX(), userinfo.getBIRTH(),
				userinfo.getQQ(), userinfo.getPHONENUM(), userinfo.getREMARK(),  username);
	}	
	
}
