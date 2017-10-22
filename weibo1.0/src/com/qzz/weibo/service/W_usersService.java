package com.qzz.weibo.service;

import com.qzz.weibo.dao.W_usersDao;

public class W_usersService {

	W_usersDao ud = new W_usersDao();

	public int RegisterPhone(String phone) {
		return Integer.parseInt(ud.RegisterPhone(phone).toString());
	}

	public int selAdmin(String phone) {
		return Integer.parseInt(ud.selAdmin(phone).toString());
	}

	public boolean addUsers(String phone, String pwd) {
		return ud.addUsers(phone, pwd);
	}

	public String queryUserpwdByName(String name) {
		return ud.queryUserpwdByName(name).toString();
	}

}
