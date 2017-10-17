package com.qzz.weibo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_weiboService;
import com.qzz.weibo.util.DataUtil;

/**
 * Servlet implementation class WeiBoServlet
 */
@WebServlet("/WeiBoServlet")
public class W_weiboServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private W_weiboService ws = new W_weiboService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public W_weiboServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		//得到微博内容的集合
		List<W_weibo> list = new ArrayList<>();
		
		//判断op的值
		if (request.getParameter("op")!=null) {
			String op = request.getParameter("op");
			if (op.equals("queryMyWb")) {
//				String sendName = (String) request.getAttribute("sendName");
				String sendName = "看看不懂";
				//将查询到的微博list倒序输出			
				list = ws.queryWbByName(sendName);
				request.setAttribute("list", list);
				request.setAttribute("sendName", sendName);
				request.getRequestDispatcher("my_home.jsp").forward(request, response);
			}
			//op的值等于publish说明提交发布请求
			if(op.equals("publish")) {
				Date date = new Date();
				String content = request.getParameter("content");
				String sendname = (String) request.getSession().getAttribute("username");
				String typeName = request.getParameter("type");
				int typeId = ws.queryTypeIdByName(typeName);
				W_weibo w = new W_weibo();
				w.setCONTENT(content);
				w.setSENDNAME(sendname);				
				w.setPUBLISHTIME(sdf.format(date));
				w.setIMAGE(DataUtil.imgname);
				w.setTYPEID(typeId);
				if(ws.addWeiBo(w))
					response.getWriter().print("<script language='javascript'>alert('发布成功');</script>");		
			}
		}
		
		
		
	}

}
