package com.qzz.weibo.dao;

import java.util.List;

import org.junit.Test;

import com.qzz.weibo.entity.W_relation;
import com.qzz.weibo.util.BaseDao;

public class W_relationDao {
	/**
	 * 查找所有我关注的人的信息
	 * @param aName
	 * @return
	 */
	public List<W_relation> queryMyAllPointer(String aName) {
		return (List<W_relation>) BaseDao.select("select * from relation_view where PERSONANAME =?", W_relation.class, aName);
	}
	/**
	 * 通过昵称查找我关注的某人的信息
	 * @param nickname
	 * @return
	 */
	public List<W_relation> queryMyPointerByNickName(String aName,String bName) {
		return (List<W_relation>) BaseDao.select("select * from relation_view where PERSONANAME =? and PERSONBNAME=?", W_relation.class, aName,bName);
	}
	/**
	 * 查找我所有粉丝的信息
	 * @param aName
	 * @return
	 */
	public List<W_relation> queryMyAllFans(String bName) {
		return (List<W_relation>) BaseDao.select("select * from fans_view where PERSONBNAME =?", W_relation.class, bName);
	}
	
	/**
	 * 查找我关注的人数
	 * @param aname
	 * @return
	 */
	public Object queryPointerCount(String aname) {
		Object c = BaseDao.getFirst("select count(1) from relation_view where PERSONANAME =? ", aname);
		return c;
	}
	
	/**
	 * 查找我的粉丝人数
	 * @param bname
	 * @return
	 */
	public Object queryFansCount(String bname) {
		Object c = BaseDao.getFirst("select count(1) from relation_view where PERSONBNAME =? ", bname);
		return c;
	}
}
