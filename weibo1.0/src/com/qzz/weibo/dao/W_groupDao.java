package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_group;
import com.qzz.weibo.util.BaseDao;

public class W_groupDao {
	/**
	 * 通过昵称查找分组
	 * @param nickName
	 * @return
	 */
	public List<W_group> queryGroupByName(String nickName) {
		return (List<W_group>) BaseDao.select("select * from W_GROUP where CREATENAME =?", W_group.class, nickName);
	}
	/**
	 * 新增分组
	 * @param nickName
	 * @param groupName
	 * @return
	 */
	public boolean addGroup(String nickName,String groupName) {
		return BaseDao.execute("insert into W_group values(null,?,?)", groupName,nickName)>0;
	}
}
