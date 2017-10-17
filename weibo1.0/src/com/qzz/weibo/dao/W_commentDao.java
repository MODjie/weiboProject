package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_comment;
import com.qzz.weibo.util.BaseDao;

/**
 * 评论的数据库操作类
 * @author Administrator
 *
 */
public class W_commentDao {
	/**
	 * 增加评论
	 * @return
	 */
	public boolean addComment(W_comment comment) {
		return BaseDao.execute("insert into W_COMMENT values(null,?,?,?)", comment.getWEIBOID(),comment.getCOMMENTNAME(),comment.getCOMMCONTENT())>0;
	}
	/**
	 * 通过微博id查找评论
	 */
	public List<W_comment> queryCmById(int weiboId) {
		return (List<W_comment>) BaseDao.select("select * from W_COMMENT where WEIBOID =?", W_comment.class, weiboId);
	}
}
