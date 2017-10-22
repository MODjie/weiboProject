package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_friendDao;
import com.qzz.weibo.entity.W_friend;
import com.qzz.weibo.util.BaseDao;

public class W_friendService {
	private W_friendDao friendDao = new W_friendDao();
	/**
	 * 通过昵称查找我的好友
	 * @param nickName
	 * @return
	 */
	public List<W_friend> queryMyFriend(String nickName) {
		return friendDao.queryMyFriend(nickName);
	}
}
