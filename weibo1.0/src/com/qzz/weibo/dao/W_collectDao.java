package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_collect;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.util.BaseDao;

public class W_collectDao {
	/**
	 * 添加收藏记录
	 * @param collect
	 * @return
	 */
	public boolean addCollect(W_collect collect) {
		return BaseDao.execute("insert into W_COLLECT values(null,?,?,?)", collect.getWEIBOID(),collect.getUSERNAME(),collect.getCOLLECTTIME())>0;
	}
	
	/**
	 * 通过微博id和收藏人的昵称来查询微博
	 * @param collect
	 * @return
	 */
	public List<W_collect> queryCollect(W_collect collect){
		return (List<W_collect>) BaseDao.select("select * from W_COLLECT where WEIBOID=? and USERNAME = ?", W_collect.class, collect.getWEIBOID(),collect.getUSERNAME());
	}
	
	/**
	 * 删除点赞记录
	 */
	public boolean deleteCollect(W_collect collect) {
		return BaseDao.execute("delete from W_COLLECT where WEIBOID = ? and USERNAME = ?", collect.getWEIBOID(),collect.getUSERNAME())>0;
	}
	
	/***
	 * 查询某人收藏的所有微博
	 * @param nickname 登录人昵称
	 * @return
	 */
	public List<W_weibo> queryMyColl(String nickname){
		return (List<W_weibo>)BaseDao.select("select * from COLLWB_VIEW where USERNAME=?", W_weibo.class, nickname);
	}
}
