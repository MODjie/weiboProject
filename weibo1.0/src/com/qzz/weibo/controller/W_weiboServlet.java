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
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.qzz.weibo.entity.W_comment;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_commentService;
import com.qzz.weibo.service.W_weiboService;
import com.qzz.weibo.util.DataUtil;

import sun.nio.cs.ext.ISO_8859_11;

/**
 * Servlet implementation class WeiBoServlet
 */
@WebServlet("/WeiBoServlet")
public class W_weiboServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private W_weiboService ws = new W_weiboService(); 
    private W_commentService wcs = new W_commentService();
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
		List<W_comment> list2 = new ArrayList<>();
		//判断op的值
		if (request.getParameter("op")!=null) {
			String op = request.getParameter("op");
			//查找我的主页中我发过的所有微博
			if (op.equals("queryMyWb")) {
				HttpSession session = request.getSession();
				String sendName = (String) session.getAttribute("username");
//				String sendName = "杰哥";
				//将查询到的微博list倒序输出			
				list = ws.queryWbByName(sendName);
				request.setAttribute("list", list);
				request.setAttribute("sendName", sendName);
				request.getRequestDispatcher("my_home.jsp").forward(request, response);
			}
			if (op.equals("queryAllWb")) {			
				list = ws.queryMyWb();
				request.setAttribute("list", list);
				request.getRequestDispatcher("mainpage.jsp").forward(request, response);
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
			//通过id查找单个微博，跳转到该微博的详细信息页面
			}else if (op.equals("queryWbById")) {
				int weiboId = 0;
				//接收评论成功标志
				String successFlag = new String(request.getParameter("cmsuccess").getBytes("ISO-8859-1"),"UTF-8");
				//如果没有评论
				if (successFlag.equals("no")) {
					weiboId = Integer.parseInt((String) request.getParameter("weiboid"));
				//如果接收评论标志为yes，则增加评论
				}else if (successFlag.equals("yes")) {
					weiboId = Integer.parseInt((String) request.getParameter("weiboId"));
					String nikeName = new String(request.getParameter("nikeName").getBytes("ISO-8859-1"),"UTF-8");
					String commentContent = new String(request.getParameter("commentContent").getBytes("ISO-8859-1"),"UTF-8");
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
					//获取当前系统时间
					String commentTime = df.format(new Date());
					W_comment comment = new W_comment(1,weiboId,nikeName,commentContent,commentTime);
					wcs.addComment(comment);
				}
				list = ws.queryWbById(weiboId);
				W_weibo detailWb = list.get(0);
				//获取本条微博的所有评论内容				
				list2 = wcs.queryCmById(weiboId);

				request.setAttribute("list2", list2);
				request.setAttribute("detailWb", detailWb);
				request.getRequestDispatcher("more.jsp").forward(request, response);
			}	
		}
		
		
		
	}

}
