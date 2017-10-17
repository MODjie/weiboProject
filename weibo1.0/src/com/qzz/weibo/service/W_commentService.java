package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_commentDao;
import com.qzz.weibo.entity.W_comment;
import com.qzz.weibo.util.BaseDao;

public class W_commentService {
	private W_commentDao commentDao = new W_commentDao();
	/**
	 * 增加评论
	 * @return
	 */
	public boolean addComment(W_comment comment) {
		return commentDao.addComment(comment);
	}
	/**
	 * 通过微博id查找评论
	 */
	public List<W_comment> queryCmById(int weiboId) {
		return commentDao.queryCmById(weiboId);
	}
}
