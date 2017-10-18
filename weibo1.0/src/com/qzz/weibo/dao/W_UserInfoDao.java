package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_userinfo;
import com.qzz.weibo.util.BaseDao;

public class W_UserInfoDao {

	/**
	 * 根据登录名获取用户的所有信息
	 * 
	 * @param username
	 * @return
	 */
	public List<W_userinfo> getAllUserInfo(String username) {
		return (List<W_userinfo>) BaseDao.select("select * from W_USERINFO where USERNAME=?", W_userinfo.class,
				username);

	}

	/**
	 * 更新用户的基本信息情况
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
