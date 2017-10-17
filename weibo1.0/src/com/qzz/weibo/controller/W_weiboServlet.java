package com.qzz.weibo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_weiboService;

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
		
		//得到微博内容的集合
		List<W_weibo> list = new ArrayList<>();
		
		//判断op的值
		if (request.getParameter("op")!=null) {
			String op = request.getParameter("op");
			if (op.equals("queryMyWb")) {
				list = ws.queryMyWb();
				request.setAttribute("list", list);
				request.setAttribute("test", "test");
				request.getRequestDispatcher("my_home.jsp").forward(request, response);
			}
			//op的值等于publish说明提交发布请求
			if(op.equals("publish")) {
				String content = request.getParameter("content");
				String sendname = (String) request.getSession().getAttribute("username");
				String type = request.getParameter("type");
				System.out.println(content+sendname+type);
			}
		}
		
		
		
	}

}
