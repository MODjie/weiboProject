package com.qzz.weibo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.google.gson.Gson;
import com.qzz.weibo.service.W_UserInfoService;
import com.qzz.weibo.service.W_usersService;
import com.qzz.weibo.util.DataUtil;

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
		response.setContentType("text/html; charset=utf-8");
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
				// 注册功能验证用户昵称是否存在
			if (op.equals("nickname")) {
				W_UserInfoService uis = new W_UserInfoService();
				String nickname = "";
				String msg = "";
				nickname = new String(request.getParameter("nickname").getBytes("ISO-8859-1"),
						"UTF-8");
				
				System.out.println("nickname"+nickname);
				if (!nickname.equals("")) {
					int i = uis.isExisNickname(nickname);
					System.out.println("i"+i);
					if (i == 1) {
						msg = "该昵称已存在!!!";
					} else {
						msg = "该昵称可用";
					}
				} else {
					msg = "昵称不能为空";
				}
				Gson gson = new Gson();
				String jsonString = gson.toJson(msg);
				// 使用printWriter对象
				PrintWriter out = response.getWriter();
				out.print(jsonString);
				out.close();
			} // 注册功能
			// 注册功能验证用户验证码是否正确
			if (op.equals("number")) {
				String number = DataUtil.number;//图片生成的验证码
				String num = request.getParameter("number");//用户输入的验证码	
				String msg = "";
				if (!num.equals("")) {
					if(num.equals(number)) {
						msg="验证码正确";
					}
					else {
						msg="验证码输入错误";
					}
				}
				else {
					msg="验证码不能为空";
				}
				Gson gson = new Gson();
				String jsonString = gson.toJson(msg);
				// 使用printWriter对象
				PrintWriter out = response.getWriter();
				out.print(jsonString);
				out.close();
			} // 注册功能
			else if (op.equals("regst")) {
				W_usersService us = new W_usersService();
				String username = request.getParameter("phone");
				String password = request.getParameter("pwd");
				String nickname = request.getParameter("nickname");
				boolean flag = us.userRegister(username, password, nickname);
				if (flag) {
					// JOptionPane.showMessageDialog(null, "注册成功");
					request.setAttribute("name", username);
					request.setAttribute("pwd", password);
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
				PrintWriter out = response.getWriter();
				int j = us.RegisterPhone(name);
				if (j == 0) {
					System.out.println("您输入的帐号不存在!");
					//JOptionPane.showMessageDialog(null, "您输入的帐号不存在！", "没有帐号信息", JOptionPane.ERROR_MESSAGE);
					out.println("<script>alert('您输入的帐号不存在!');location.href='index.jsp'</script>");
				} else {
					String pwdyz = us.queryUserpwdByName(name);
					if (pwdyz.equals(pwd)) {
						W_UserInfoService userinfoser = new W_UserInfoService();
						String username = userinfoser.getNickNameByUserName(name);
						if (username.equals("null")) {
							response.sendRedirect("homepage.jsp");
						} else {
							session.setAttribute("username", username);
							response.sendRedirect("WeiBoServlet?op=homepage");
						}

					} else {
						//JOptionPane.showMessageDialog(null, "您的密码输入错误！！", "密码错误", JOptionPane.ERROR_MESSAGE);
						System.out.println("密码错误，请重新输入!!");
						out.println("<script>alert('密码错误，请重新输入!');location.href='index.jsp'</script>");
					}
				}

			} else if (op.equals("logintreply")) {
				W_usersService us = new W_usersService();
				String name = request.getParameter("namet");
				System.out.println("username" + name);
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
						// response.getWriter().print("<script
						// language='javascript'>history.go(-2);</script>");
						response.getWriter().println(
								"<script language='javascript'>window.history.go(-1);window.history.go(0)</script>");
					}

					else {
						JOptionPane.showMessageDialog(null, "您的密码输入错误！！", "密码错误", JOptionPane.ERROR_MESSAGE);
						request.setAttribute("name", name);
						request.setAttribute("pwd", pwd);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				}

			} else if (op.equals("logint")) {
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
							if (username.equals("null")) {
								response.sendRedirect("homepage.jsp");
							} else {
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
						// 登录成功的话
						if (pwdyz.equals(pwd)) {
							W_UserInfoService userinfoser = new W_UserInfoService();
							String username = userinfoser.getNickNameByUserName(name);
							if (username.equals("null")) {
								response.sendRedirect("homepage.jsp");
							} else {
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
