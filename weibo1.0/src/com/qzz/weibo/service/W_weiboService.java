package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_weiboDao;
import com.qzz.weibo.entity.W_type;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.util.BaseDao;
import com.qzz.weibo.util.PageData;

public class W_weiboService {
	private W_weiboDao weiboDao = new W_weiboDao();
	
	/**
	 * 查找我的所有微博内容
	 * @return
	 */
	public List<W_weibo> queryAllWb() {
		return weiboDao.queryAllWb();
	}
	
	/**
	 * 通过用户名查找微博
	 */
	public List<W_weibo> queryWbByName(String sendName) {
		return weiboDao.queryWbByName(sendName);
	}
	
	/**
	 * 通过id查找微博
	 */
	public List<W_weibo> queryWbById(int id) {
		return weiboDao.queryWbById(id);
	}
	
	/***
	 * 发布微博添加一条数据到微博表中
	 * @param w 微博对象
	 * @return
	 */
	public boolean addWeiBo(W_weibo w) {
		return weiboDao.addWeiBo(w);
	}
	
	/***
	 * 转发微博添加一条数据到微博表中
	 * @param w 微博对象
	 * @return
	 */
	public boolean forwardWeiBo(W_weibo w) {
		return weiboDao.forwardWeiBo(w);
	}
	
	/***
	 * 根据类型名称查询类型编号
	 * @param typeName
	 * @return
	 */
	public int queryTypeIdByName(String typeName) {
		return weiboDao.queryTypeIdByName(typeName);
	}
	
	/**
	 *  根据微博类型编号获取相关类型微博
	 *
	 * @return
	*/
	public List<W_weibo> queryWebBytype(int contenttypeid){
		return weiboDao.queryWebBytype(contenttypeid);
	}
	
	/**
	 *  根据微博类型编号获取我的相关类型微博
	 *
	 * @return
	*/
	public  List<W_weibo> queryMyWebBytype(int contenttypeid,String sendName){
		String sql="select * from WB_VIEW where TYPEID =? and SENDNAME =?";
		return weiboDao.queryMyWebBytype(contenttypeid, sendName);
	}
	
	/**
	 * 修改微博的收藏、转发、评论、点赞数
	 * @param weibo
	 * @return
	 */
	public boolean updateWeiboById(W_weibo weibo) {
		return weiboDao.updateWeiboById(weibo);
	}
	/**
	 * 模糊查询
	 * @param word
	 * @return
	 */
	public List<W_weibo> queryWbByWord(String word,String sendName) {
		return weiboDao.queryWbByWord(word,sendName);
	}
}
