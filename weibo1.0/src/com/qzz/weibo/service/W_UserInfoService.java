package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_UserInfoDao;
import com.qzz.weibo.entity.W_userinfo;

public class W_UserInfoService {

	W_UserInfoDao userinfodao = new W_UserInfoDao();

	/**
	 * 根据登录名获取用户的所有信息
	 * 
	 * @param username
	 * @return
	 */
	public List<W_userinfo> getAllUserInfo(String username) {
		return userinfodao.getAllUserInfo(username);
	}

	/**
	 * 更新用户的基本信息情况
	 * 
	 * @param userinfo
	 * @param username
	 * @return
	 */
	public int updateUserInfo(W_userinfo userinfo, String username) {
		return userinfodao.updateUserInfo(userinfo, username);
	}
}
