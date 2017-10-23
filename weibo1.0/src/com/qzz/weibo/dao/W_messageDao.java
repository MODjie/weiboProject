package com.qzz.weibo.dao;

import java.util.List;

import com.qzz.weibo.entity.W_message;
import com.qzz.weibo.util.BaseDao;

public class W_messageDao {
	/**
	 * 通过发件人和收件人查找消息记录
	 * @param sendName
	 * @param receiveName
	 * @return
	 */
	public List<W_message> queryMessageByName(String sendName,String receiveName) {
		return (List<W_message>) BaseDao.select("select * from MESSAGE_VIEW where SENDNAME = ? and RECEIVENAME = ? or SENDNAME = ? and RECEIVENAME= ?", W_message.class, sendName,receiveName,receiveName,sendName);
	}
	
	/**
	 * 添加新消息
	 * @param message
	 * @return
	 */
	public boolean addMessage(W_message message) {
		return BaseDao.execute("insert into W_MESSAGE values(null,?,?,?,?,?)", message.getSENDNAME(),message.getRECEIVENAME(),message.getCONTENT(),message.getSENDTIME(),message.getSTATE())>0;
	}
}
