package com.qzz.weibo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qzz.weibo.entity.W_relation;
import com.qzz.weibo.entity.W_userinfo;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_UserInfoService;
import com.qzz.weibo.service.W_relationService;

/**
 * Servlet implementation class W_UserInfoServlet
 */
@WebServlet("/W_UserInfoServlet")
public class W_UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public W_UserInfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// 创建对象
		List<W_userinfo> list = new ArrayList<W_userinfo>();
		W_UserInfoService userinfoservice = new W_UserInfoService();
		W_relationService relationService = new W_relationService();
		
		HttpSession session = request.getSession(); 
		
		// 获取页面传过来的属性
		String username = request.getParameter("username");
		String nickname = (String) session.getAttribute("username");
		String realname = request.getParameter("realname");
		String sex = request.getParameter("sex");
		String remark = request.getParameter("remark");
		String qq = request.getParameter("qq");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String province = request.getParameter("province");
		String city1 = request.getParameter("city1");
		String city2 = request.getParameter("city2");

		String location = province + city1+city2;
		String birth = year + month + day;

		// 将获取的值放进W_userinfo实体类中
		W_userinfo userinfo = new W_userinfo(username, nickname, realname, sex, birth, province, city1, city2, email, qq, phone, remark, "TX");

		if (request.getParameter("op") != null) {
			String op = request.getParameter("op");
			// 如果传过来的值是getUserInfo则查询该用户下的基本信息
			if (op.equals("getUserInfo")) {
				list = userinfoservice.getUserInfoByNikeName(nickname);
				
				request.setAttribute("username", username);
				request.setAttribute("nickname", nickname);
				request.setAttribute("list", list);
				request.setAttribute("birth", list.get(0).getBIRTH().substring(0, 10));
				request.setAttribute("userinfo", list.get(0));
				request.getRequestDispatcher("information.jsp").forward(request, response);
			}
			// 如果传过来的值是updateuserinfo则先将用户的基本信息更新，再重新查询出来显示
			else if (op.equals("updateuserinfo")) {
				userinfoservice.updateUserInfo(userinfo, username);
				list = userinfoservice.getAllUserInfo(username);
			}
			//关注页面
			else if (op.equals("point")) {
				list = userinfoservice.getUserInfoByNikeName(nickname);
				List<W_relation> myPointerList = relationService.queryMyAllPointer(nickname);
				List<W_relation> myPointerListLeft = new ArrayList<>();
				List<W_relation> myPointerListRight = new ArrayList<>();
				//将信息拆成两列显示
				for (int i = 0; i < myPointerList.size(); i++) {
					if (i<myPointerList.size()/2) {
						myPointerListRight.add(myPointerList.get(i));
					}else {
						myPointerListLeft.add(myPointerList.get(i));
					}
				}
				request.setAttribute("myPointerListLeft", myPointerListLeft);
				request.setAttribute("myPointerListRight", myPointerListRight);
				request.setAttribute("myInfo", list.get(0));
				request.getRequestDispatcher("friend.jsp").forward(request, response);
			}
		}

		

	}

}
