package com.qzz.weibo.test;

import java.util.List;

import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_weiboService;

public class weiboTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		W_weiboService ws = new W_weiboService();
		List<W_weibo> list = ws.queryMyWb();
		System.out.println(list.size());
		for (W_weibo w_weibo : list) {
			System.out.println(list);
		}
	}

}
