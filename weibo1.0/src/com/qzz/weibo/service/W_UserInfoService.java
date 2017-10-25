package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_UserInfoDao;
import com.qzz.weibo.entity.W_userinfo;
import com.qzz.weibo.util.BaseDao;

public class W_UserInfoService {

	W_UserInfoDao userinfodao = new W_UserInfoDao();

	/**
	 * 鏍规嵁鐧诲綍鍚嶈幏鍙栫敤鎴风殑鎵�鏈変俊鎭�
	 * 
	 * @param username
	 * @return
	 */
	public List<W_userinfo> getAllUserInfo(String username) {
		return userinfodao.getAllUserInfo(username);
	}

	/**
	 * 鏇存柊鐢ㄦ埛鐨勫熀鏈俊鎭儏鍐�
	 * 
	 * @param userinfo
	 * @param username
	 * @return
	 */
	public int updateUserInfo(W_userinfo userinfo, String username) {
		return userinfodao.updateUserInfo(userinfo, username);
	}
	
	/**
	 * 通过昵称来查找用户信息
	 * 
	 * @param username
	 * @return
	 */
	public W_userinfo getUserInfoByNikeName(String nikeName) {
		return userinfodao.getUserInfoByNikeName(nikeName).get(0);
	}
	
	/***
	 * 通过用户名获取用户昵称
	 * @param username
	 * @return
	 */
	public String getNickNameByUserName(String username) {
		return userinfodao.getNickNameByUserName(username);
	}
	
	/***
	 * 判断用户昵称是否已存在
	 * @param nickname
	 * @return
	 */
	public int isExisNickname(String nickname) {
		return userinfodao.isExisNickname(nickname);
	}
	/***
	 * 修改用户个人信息
	 * 
	 * @param userinfo
	 * @return
	 */
	public boolean updateUserinfo(W_userinfo userinfo){
		return userinfodao.updateUserinfo(userinfo);
	}
}
