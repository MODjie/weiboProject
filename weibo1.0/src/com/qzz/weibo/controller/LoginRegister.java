package com.qzz.weibo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.google.gson.Gson;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_UserInfoService;
import com.qzz.weibo.service.W_usersService;

/**
 * Servlet implementation class LoginRegister
 */
@WebServlet("/LoginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		// 判断op的值
		if (request.getParameter("op") != null) {
			String op = request.getParameter("op");
			// 注册功能验证用户名是否存在
			if (op.equals("usname")) {
				W_usersService us = new W_usersService();
				String phone = "";
				String usname = "";
				phone = request.getParameter("phone");
				if (phone != "") {
					int i = us.RegisterPhone(phone);
					if (i == 1) {
						usname = "用户名已存在!!!";
					} else {
						usname = "用户名可用";
					}
				} else {
					usname = "用户名不能为空";
				}
				Gson gson = new Gson();
				String jsonString = gson.toJson(usname);
				// 使用printWriter对象
				PrintWriter out = response.getWriter();
				out.print(jsonString);
				out.close();
			} // 注册功能
			else if (op.equals("regst")) {
				W_usersService us = new W_usersService();
				String name = request.getParameter("phone");
				String pwd = request.getParameter("pwd");
				boolean flag = us.addUsers(name, pwd);
				if (flag) {
					//JOptionPane.showMessageDialog(null, "注册成功");
					request.setAttribute("name", name);
					request.setAttribute("pwd", pwd);
					response.getWriter().print("<script language='javascript'>alert('注册成功');</script>");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				} else {
					JOptionPane.showMessageDialog(null, "失败");
					request.getRequestDispatcher("regiter.jsp").forward(request, response);
				}

			} // 登录功能
			else if (op.equals("loginm")) {
				W_usersService us = new W_usersService();
				String name = request.getParameter("namem");
				String pwd = request.getParameter("pwdm");
				int j = us.RegisterPhone(name);
				if (j == 0) {
					JOptionPane.showMessageDialog(null, "您输入的帐号不存在！", "没有帐号信息", JOptionPane.ERROR_MESSAGE);
					request.setAttribute("name", name);
					request.setAttribute("pwd", pwd);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				} else {
					String pwdyz = us.queryUserpwdByName(name);
					if (pwdyz.equals(pwd)) {
						W_UserInfoService userinfoser = new W_UserInfoService();
						String username = userinfoser.getNickNameByUserName(name);
						if(username.equals("null")) {
							response.sendRedirect("homepage.jsp");
						}
						else {
							session.setAttribute("username", username);
							response.sendRedirect("WeiBoServlet?op=homepage");
						}
						

					} else {
						JOptionPane.showMessageDialog(null, "您的密码输入错误！！", "密码错误", JOptionPane.ERROR_MESSAGE);
						request.setAttribute("name", name);
						request.setAttribute("pwd", pwd);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				}

			} 
			else if (op.equals("logintreply")) {
				W_usersService us = new W_usersService();
				String name = request.getParameter("namet");
				System.out.println("username"+name);
				String pwd = request.getParameter("pwdt");
				int j = us.RegisterPhone(name);
				if (j == 0) {
					JOptionPane.showMessageDialog(null, "您输入的帐号不存在！", "没有帐号信息", JOptionPane.ERROR_MESSAGE);
					request.setAttribute("name", name);
					request.setAttribute("pwd", pwd);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				} else {
					String pwdyz = us.queryUserpwdByName(name);
					if (pwdyz.equals(pwd)) {
						W_UserInfoService userinfoser = new W_UserInfoService();
						String username = userinfoser.getNickNameByUserName(name);
							session.setAttribute("username", username);
							System.out.println("more界面点击登录");
//							response.getWriter().print("<script language='javascript'>history.go(-2);</script>");
							response.getWriter().println("<script language='javascript'>window.history.go(-1);window.history.go(0)</script>");
					}
						

					else {
						JOptionPane.showMessageDialog(null, "您的密码输入错误！！", "密码错误", JOptionPane.ERROR_MESSAGE);
						request.setAttribute("name", name);
						request.setAttribute("pwd", pwd);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				}

			} 
			else if (op.equals("logint")) {
				W_usersService us = new W_usersService();
				String name = request.getParameter("namet");
				String pwd = request.getParameter("pwdt");
				String typ = request.getParameter("cu");
				// 判断管理员或用户
				if (typ.equals("user")) {
					int j = us.RegisterPhone(name);
					// 验证是否存在用户信息
					if (j == 0) {
						JOptionPane.showMessageDialog(null, "您输入的帐号不存在！", "没有帐号信息", JOptionPane.ERROR_MESSAGE);
						request.setAttribute("name", name);
						request.setAttribute("pwd", pwd);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					} else {
						// 存在则验证用户信息是否正确
						String pwdyz = us.queryUserpwdByName(name);
						if (pwdyz.equals(pwd)) {
							W_UserInfoService userinfoser = new W_UserInfoService();
							String username = userinfoser.getNickNameByUserName(name);
							if(username.equals("null")) {
								response.sendRedirect("homepage.jsp");
							}
							else {
								session.setAttribute("username", username);
								response.sendRedirect("WeiBoServlet?op=homepage");
							}

						} else {
							JOptionPane.showMessageDialog(null, "您的密码输入错误！！", "密码错误", JOptionPane.ERROR_MESSAGE);
							request.setAttribute("name", name);
							request.setAttribute("pwd", pwd);
							request.getRequestDispatcher("index.jsp").forward(request, response);
						}
					}
				} else {
					int j = us.selAdmin(name);
					if (j == 0) {
						JOptionPane.showMessageDialog(null, "您输入的帐号不存在！", "没有帐号信息", JOptionPane.ERROR_MESSAGE);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					} else {
						String pwdyz = us.queryUserpwdByName(name);
						//登录成功的话
						if (pwdyz.equals(pwd)) {
							W_UserInfoService userinfoser = new W_UserInfoService();
							String username = userinfoser.getNickNameByUserName(name);
							if(username.equals("null")) {
								response.sendRedirect("homepage.jsp");
							}
							else {
								session.setAttribute("username", username);
								response.sendRedirect("WeiBoServlet?op=homepage");
							}

						} else {
							JOptionPane.showMessageDialog(null, "您的密码输入错误！！", "密码错误", JOptionPane.ERROR_MESSAGE);
							request.getRequestDispatcher("index.jsp").forward(request, response);
						}
					}
				}
			}
		}
	}
}
