package com.qzz.weibo.service;

import java.util.List;

import com.qzz.weibo.dao.W_relationDao;
import com.qzz.weibo.entity.W_relation;
import com.qzz.weibo.util.BaseDao;

public class W_relationService {
	private W_relationDao relationDao = new W_relationDao();
	/**
	 * 查找所有我关注的人的信息
	 * @param aName
	 * @return
	 */
	public List<W_relation> queryMyAllPointer(String aName) {
		return relationDao.queryMyAllPointer(aName);
	}
	
	/**
	 * 通过昵称查找我关注的某人的信息
	 * @param nickname
	 * @return
	 */
	public List<W_relation> queryMyPointerByNickName(String aName,String bName) {
		return (List<W_relation>) BaseDao.select("select * from relation_view where PERSONANAME =? and PERSONBNAME=?", W_relation.class, aName,bName);
	}
}
