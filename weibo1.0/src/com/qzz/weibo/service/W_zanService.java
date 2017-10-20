package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_zanDao;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.entity.W_zan;
import com.qzz.weibo.util.BaseDao;

public class W_zanService {
	
	private W_zanDao zanDao = new W_zanDao();
	/**
	 * 通过微博id和点赞人的昵称获取该微博
	 * @param weiboId
	 * @param zanName
	 * @return
	 */
	public List<W_zan> queryByNameAndId(int weiboId,String zanName) {
		return zanDao.queryByNameAndId(weiboId, zanName);
	}
	/**
	 * 添加点赞记录
	 * @param weiboId
	 * @param zanName
	 * @return
	 */
	public boolean addZan(int weiboId,String zanName) {
		return zanDao.addZan(weiboId, zanName);
	}
	/**
	 * 删除点赞记录
	 */
	public boolean deleteZan(int weiboId,String zanName) {
		return zanDao.deleteZan(weiboId, zanName);
	}
	
	/***
	 * 查询某人点赞过的所有微博
	 * @param nickname 登录人昵称
	 * @return
	 */
	public List<W_weibo> queryMyZAN(String nickname){
		return zanDao.queryMyZAN(nickname);
	}
}
