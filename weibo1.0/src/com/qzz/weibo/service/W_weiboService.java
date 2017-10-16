package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_weiboDao;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.util.BaseDao;

public class W_weiboService {
	private W_weiboDao weiboDao = new W_weiboDao();
	
	/**
	 * 查找我的所有微博内容
	 * @return
	 */
	public List<W_weibo> queryMyWb() {
		return weiboDao.queryMyWb();
	}
	
	/***
	 * 添加一天数据到微博表中
	 * @param w 微博对象
	 * @return
	 */
//	public boolean addWeiBo(W_weibo w) {
//		return weiboDao.addWeiBo(w);
//	}
}
