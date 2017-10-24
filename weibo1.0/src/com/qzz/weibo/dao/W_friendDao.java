package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_friend;
import com.qzz.weibo.util.BaseDao;

public class W_friendDao {
	/**
	 * 通过昵称查找我的好友
	 * @param nickName
	 * @return
	 */
	public List<W_friend> queryMyFriend(String nickName) {
		return (List<W_friend>) BaseDao.select("select * from FRIEND_VIEW where FRIENDOWNERNAME = ?", W_friend.class, nickName);
	}
	/**
	 * 通过昵称和分组编号查找我的好友
	 * @param nickName groupId
	 * @return
	 */
	public List<W_friend> queryMyFriend(String nickName,int groupId) {
		return (List<W_friend>) BaseDao.select("select * from friend_view where GROUPID=? and FRIENDOWNERNAME=?", W_friend.class,groupId, nickName);
	}
}
