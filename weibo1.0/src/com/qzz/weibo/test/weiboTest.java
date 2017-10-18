package com.qzz.weibo.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.qzz.weibo.dao.W_UserInfoDao;
import com.qzz.weibo.dao.W_weiboDao;
import com.qzz.weibo.entity.W_userinfo;
import com.qzz.weibo.entity.W_users;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_weiboService;
import com.qzz.weibo.util.BaseDao;

public class weiboTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
//		W_weiboService ws = new W_weiboService();
//
//		List<W_weibo> list = ws.queryMyWb();
//		System.out.println(list.size());
//		for (W_weibo w_weibo : list) {
//			System.out.println(list);
//		}		
		
		String username ="jia";
		List<W_userinfo>  list1 = new ArrayList<>();
		W_UserInfoDao userInfoDao = new W_UserInfoDao();
		list1= userInfoDao.getAllUserInfo(username);
		for (W_userinfo w_userinfo : list1) {
			System.out.println(w_userinfo);
		}
		
	}

}
