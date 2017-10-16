package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_users;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.util.BaseDao;

public class W_weiboDao {
	/**
	 * 查找我的所有微博内容
	 * @return
	 */
	public List<W_weibo> queryMyWb() {
		return (List<W_weibo>)BaseDao.select("select * from W_WEIBO", W_weibo.class, null);
	}
	
	/**
	 * 查找所有用户
	 * @return
	 */
	public List<W_users> queryAllUsers() {
		List<W_users> list = (List<W_users>)BaseDao.select("select * from W_users", W_users.class, null);
		System.out.println(list);
		return list;
	}
}
