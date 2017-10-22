package com.qzz.weibo.dao;

import com.qzz.weibo.entity.W_users;
import com.qzz.weibo.util.BaseDao;

public class W_usersDao {
	// 验证是否存在用户帐号信息
	public Object RegisterPhone(String phone) {
		return BaseDao.getFirst("select count(1) from w_users where username=? and usertype='用户'", phone);
	}
	//查询管理员信息是否存在
	public Object selAdmin(String phone) {
		return BaseDao.getFirst("select count(1) from w_users where username=? and usertype='管理员'", phone);
	}

	// 添加用户信息
	public boolean addUsers(String phone, String pwd) {
		return BaseDao.execute("insert into w_users values(null,?,?,'用户')", phone, pwd) > 0;
	}
	//获取用户密码信息
	public Object queryUserpwdByName(String name) {
		return BaseDao.getFirst("select userpwd from W_users where username=?", name);
	}
}
