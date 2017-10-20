package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.entity.W_zan;
import com.qzz.weibo.util.BaseDao;

public class W_zanDao {
	/**
	 * 通过微博id和点赞人的昵称获取该微博
	 * @param weiboId
	 * @param zanName
	 * @return
	 */
	public List<W_zan> queryByNameAndId(int weiboId,String zanName) {
		return (List<W_zan>) BaseDao.select("select * from W_ZAN where WEIBOID=? and ZANNAME = ?",W_zan.class, weiboId,zanName);
	}
	/**
	 * 添加点赞记录
	 * @param weiboId
	 * @param zanName
	 * @return
	 */
	public boolean addZan(int weiboId,String zanName) {
		return BaseDao.execute("insert into W_ZAN values(null,?,?)", weiboId,zanName)>0;
	}
	
	/**
	 * 删除点赞记录
	 */
	public boolean deleteZan(int weiboId,String zanName) {
		return BaseDao.execute("delete from W_ZAN where WEIBOID = ? and ZANNAME = ?", weiboId,zanName)>0;
	}
	
	/***
	 * 查询某人点赞过的所有微博
	 * @param nickname 登录人昵称
	 * @return
	 */
	public List<W_weibo> queryMyZAN(String nickname){
		return (List<W_weibo>)BaseDao.select("select * from ZAN_VIEW where ZANNAME=?", W_weibo.class, nickname);
	}
}
