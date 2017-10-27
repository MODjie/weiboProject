package com.qzz.weibo.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;
import com.qzz.weibo.dao.W_collectDao;
import com.qzz.weibo.entity.W_collect;
import com.qzz.weibo.entity.W_comment;
import com.qzz.weibo.entity.W_friend;
import com.qzz.weibo.entity.W_group;
import com.qzz.weibo.entity.W_message;
import com.qzz.weibo.entity.W_relation;
import com.qzz.weibo.entity.W_reply;
import com.qzz.weibo.entity.W_type;
import com.qzz.weibo.entity.W_userinfo;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.entity.W_zan;
import com.qzz.weibo.service.W_UserInfoService;
import com.qzz.weibo.service.W_collectService;
import com.qzz.weibo.service.W_commentService;
import com.qzz.weibo.service.W_friendService;
import com.qzz.weibo.service.W_groupService;
import com.qzz.weibo.service.W_messageService;
import com.qzz.weibo.service.W_relationService;
import com.qzz.weibo.service.W_replyService;
import com.qzz.weibo.service.W_weiboService;
import com.qzz.weibo.service.W_zanService;
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
	private W_zanService wzs = new W_zanService();
	private W_collectService cts = new W_collectService();
	private W_replyService rs = new W_replyService();
	private W_UserInfoService us = new W_UserInfoService();
	private W_friendService fs = new W_friendService();
	private W_messageService ms = new W_messageService();
	private W_groupService gs = new W_groupService();
	private W_relationService relationService = new W_relationService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public W_weiboServlet() {
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
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
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
		response.setContentType("text/html;charset=utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		// 得到微博内容的集合
		List<W_weibo> list = new ArrayList<>();
		List<W_comment> list2 = new ArrayList<>();
		List<W_reply> replyList = new ArrayList<>();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		// 判断op的值
		if (request.getParameter("op") != null) {
			String op = request.getParameter("op");
			// 查找我的主页中我发过的所有微博
			if (op.equals("queryMyWb")) {

				String sendName = (String) session.getAttribute("username");

				// 如果得到增加分组标志
				if (request.getParameter("addGroup") != null) {
//					String groupName = new String(request.getParameter("groupName").getBytes("ISO-8859-1"), "UTF-8");
					String groupName = request.getParameter("groupName");
					gs.addGroup(sendName, groupName);
				}
				// 查询到的微博list
				if (request.getParameter("queryWbBy") == null) {
					list = ws.queryWbByName(sendName);
				} else if (request.getParameter("queryWbBy").equals("type")) {
					// 我的主页通过类型查询
					int typeId = Integer.parseInt(request.getParameter("typeId"));
					list = ws.queryMyWebBytype(typeId,sendName);
				} else if (request.getParameter("queryWbBy").equals("word")) {
					// 我的主页模糊查询微博内容
					String word = request.getParameter("serchContent");
					list = ws.queryWbByWord(word, sendName);
				}
				//我的关注人数
				Object pointCount = relationService.queryPointerCount(sendName);
				//我的粉丝人数
				Object fansCount = relationService.queryFansCount(sendName);
				//我的微博人数
				Object weiBoCount = ws.queryMyWbNum(sendName);
				// 获得分组list
				List<W_group> groupList = gs.queryGroupByName(sendName);
				request.setAttribute("groupList", groupList);
				W_userinfo myInfo = us.getUserInfoByNikeName(sendName);
				request.setAttribute("pointCount", pointCount);
				request.setAttribute("fansCount", fansCount);
				request.setAttribute("weiBoCount", weiBoCount);
				request.setAttribute("myInfo", myInfo);
				request.setAttribute("list", list);
				request.getRequestDispatcher("my_home.jsp").forward(request, response);
			} else if (op.equals("homepage")) {

				String nickname = "";
				nickname = session.getAttribute("username") + "";
				if(!nickname.equals("null")) {
				W_UserInfoService wus = new W_UserInfoService();
				W_userinfo userinfo = new W_userinfo();
				userinfo = wus.getUserInfoByNikeName(nickname);
				
				//我的关注人数
				Object pointCount = relationService.queryPointerCount(nickname);
				//我的粉丝人数
				Object fansCount = relationService.queryFansCount(nickname);
				//我的微博人数
				Object weiBoCount = ws.queryMyWbNum(nickname);
				
				request.setAttribute("pointCount", pointCount);
				request.setAttribute("fansCount", fansCount);
				request.setAttribute("weiBoCount", weiBoCount);
				request.setAttribute("userinfo", userinfo);
				request.getRequestDispatcher("homepage.jsp").forward(request, response);
				}
				else {
					response.sendRedirect("index.jsp");
				}

			} else if (op.equals("queryAllWb")) {
				String nickName = (String) session.getAttribute("username");
				list = ws.queryAllWb();
				if (request.getParameter("queryWbBy")!=null) {
					if (request.getParameter("queryWbBy").equals("type")) {
						// 首页通过类型查询
						int typeId = Integer.parseInt(request.getParameter("typeId"));
						list = ws.queryWebBytype(typeId);
					} else if (request.getParameter("queryWbBy").equals("word")) {
						// 首页模糊查询微博内容
						String word = request.getParameter("serchContent");
						list = ws.queryWbByWord(word, nickName);
					}
				}
				request.setAttribute("list", list);
				request.getRequestDispatcher("mainpage.jsp").forward(request, response);
			}
			// op的值等于publish说明提交发布请求
			else if (op.equals("publish")) {
				Date date = new Date();
				String content = request.getParameter("content");
				content=content.replaceAll("草泥马", "***");
				content=content.replaceAll("傻逼", "**");
				content=content.replaceAll("小飞", "**");
				String sendname = (String) request.getSession().getAttribute("username");
				String typeName = request.getParameter("type");
				int typeId = ws.queryTypeIdByName(typeName);
				W_weibo w = new W_weibo();
				w.setCONTENT(content);
				w.setSENDNAME(sendname);
				w.setPUBLISHTIME(sdf.format(date));
				w.setIMAGE(DataUtil.imgname);
				w.setTYPEID(typeId);
				if (ws.addWeiBo(w)) {
					response.getWriter().print(
							"<script language='javascript'>alert('发布成功');parent.location.href='WeiBoServlet?op=homepage'</script>");
				}
				// 通过id查找单个微博，跳转到该微博的详细信息页面,评论功能
			} else if (op.equals("queryWbById")) {					
				int weiboId = 0;
				// 接收评论成功标志
//				String successFlag = new String(request.getParameter("cmsuccess").getBytes("ISO-8859-1"), "UTF-8");
				String successFlag = request.getParameter("cmsuccess");
				// 如果没有评论
				if (successFlag.equals("no")) {
					weiboId = Integer.parseInt((String) request.getParameter("weiboid"));
					// 如果接收评论标志为yes，则增加评论
				} else if (successFlag.equals("yes")) {
					weiboId = Integer.parseInt((String) request.getParameter("weiboId"));
					String nikeName = (String) session.getAttribute("username");
//					String commentContent = new String(request.getParameter("commentContent").getBytes("ISO-8859-1"),"UTF-8");
					String commentContent = request.getParameter("commentContent");
					// String commentContent = request.getParameter("commentContent");
					// String commentContent = request.getParameter("commentContent");
					// 获取当前系统时间
					String commentTime = sdf.format(new Date());
					W_comment comment = new W_comment(1, weiboId, nikeName, commentContent, commentTime, "22");
					wcs.addComment(comment);
				}
				
				//获得微博右侧的微博类型ID,获取所有相关类型的微博
				List<W_weibo> list3 = new ArrayList<>();
				if (request.getParameter("contetypeid")!=null) {
					int typeid= Integer.parseInt(request.getParameter("contetypeid"));
					list3=ws.queryWebBytype(typeid);
					 int i=0;
					for(;i<list3.size();i++){
						 if(weiboId==(list3.get(i).getWEIBOID())){
							 list3.remove(i);	
						}
					}
				}
						
				list = ws.queryWbById(weiboId);
				W_weibo detailWb = list.get(0);
				// 获取本条微博的所有评论内容
				list2 = wcs.queryCmById(weiboId);
				// 得到此评论的所有回复存在replyList中
				replyList = rs.queryAllReply();
				request.setAttribute("replyList", replyList);
				request.setAttribute("list2", list2);
				request.setAttribute("list3", list3);
				request.setAttribute("detailWb", detailWb);
				request.getRequestDispatcher("more.jsp").forward(request, response);
			} else if (op.equals("zan")) {
				// 通过传过来的微博ID和点赞人的昵称查找数据库并且存储在zanlist中
				int weiboId = Integer.parseInt((String) request.getParameter("weiboid"));
				String zanName = (String) session.getAttribute("username");
				List<W_zan> zanList = wzs.queryByNameAndId(weiboId, zanName);
				// 获取本条微博
				W_weibo wei = ws.queryWbById(weiboId).get(0);
				// 通过zanList的长度来判断，返回数据是否为空
				if (zanList.size() == 0) {
					// 当返回数据为空时，就对该昵称和微博添加一条点赞记录
					wzs.addZan(weiboId, zanName);
					// 点赞数加一
					wei.setZANNUM(wei.getZANNUM() + 1);
				} else {
					// 如果返回数据不为空，就删除该记录，即取消点赞功能
					wzs.deleteZan(weiboId, zanName);
					// 点赞数减一
					wei.setZANNUM(wei.getZANNUM() - 1);
				}
				// 修改本条微博的点赞数
				ws.updateWeiboById(wei);
				int zanNum = wei.getZANNUM();
				Gson g = new Gson();
				String jsonString = g.toJson(zanNum);
				// //如果这里加了这句话，意味着视图那一层不需要JSON.parse
				// 这里已经将返回的数据变成了json对象
				response.setContentType("application/json");
				out.print(jsonString);

			} else if (op.equals("collect")) {
				// 通过传过来的微博ID和收藏人的昵称查找数据库并且存储在collectList中
				String msg = "";
				int weiboId = Integer.parseInt(request.getParameter("weiboid"));
				String collectName = (String) session.getAttribute("username");
				String flag = request.getParameter("flag");
				String collectTime = sdf.format(new Date());
				W_collect collect = new W_collect(1, weiboId, collectName, collectTime);
				List<W_collect> collectList = cts.queryCollect(collect);
				// 获取本条微博
				W_weibo wei = ws.queryWbById(weiboId).get(0);
				// 通过zanList的长度来判断，返回数据是否为空
				if (collectList.size() == 0) {
					// 当返回数据为空时，就对该昵称和微博添加一条收藏记录
					cts.addCollect(collect);
					msg = "收藏成功";
					// 收藏数加一
					wei.setCOLLECTNUM(wei.getCOLLECTNUM() + 1);
				} else {
					// 如果返回数据不为空，就删除该记录，即取消收藏功能
					cts.deleteCollect(collect);
					msg = "取消收藏";
					// 收藏数减一
					wei.setCOLLECTNUM(wei.getCOLLECTNUM() - 1);
				}
				// 修改本条微博的收藏数
				ws.updateWeiboById(wei);
				// 通过昵称查找微博
				if (flag == null) {
					int collectNum = wei.getCOLLECTNUM();
					Gson g = new Gson();
					String jsonString = g.toJson(collectNum);
					// //如果这里加了这句话，意味着视图那一层不需要JSON.parse
					// 这里已经将返回的数据变成了json对象
					response.setContentType("application/json");
					out.print(jsonString);
					// } else if (flag.equals("1")) {
					// list = ws.queryAllWb();
					// request.setAttribute("list", list);
					// if (msg.equals("收藏成功")) {
					//
					// response.getWriter().print(
					// "<script
					// language='javascript'>location.href='WeiBoServlet?op=queryAllWb';alert('收藏成功');</script>");
					// // request.getRequestDispatcher("mainpage.jsp").forward(request, response);
					// } else {
					// response.getWriter().print(
					// "<script
					// language='javascript'>alert('取消收藏');location.href='WeiBoServlet?op=queryAllWb'</script>");
					// }
				}

			}
			// else if (op.equals("dianzan")) {
			// // 通过传过来的微博ID和点赞人的昵称查找数据库并且存储在zanlist中
			// int weiboId = Integer.parseInt((String) request.getParameter("weiboid"));
			// String zanName = (String) session.getAttribute("username");
			// List<W_zan> zanList = wzs.queryByNameAndId(weiboId, zanName);
			// // 获取本条微博
			// W_weibo wei = ws.queryWbById(weiboId).get(0);
			// // 通过zanList的长度来判断，返回数据是否为空
			// if (zanList.size() == 0) {
			// // 当返回数据为空时，就对该昵称和微博添加一条点赞记录
			// wzs.addZan(weiboId, zanName);
			// // 点赞数加一
			// wei.setZANNUM(wei.getZANNUM() + 1);
			// } else {
			// // 如果返回数据不为空，就删除该记录，即取消点赞功能
			// wzs.deleteZan(weiboId, zanName);
			// // 点赞数减一
			// wei.setZANNUM(wei.getZANNUM() - 1);
			// }
			// // 修改本条微博的点赞数
			// ws.updateWeiboById(wei);
			// // 通过昵称查找微博
			// list = ws.queryAllWb();
			// request.setAttribute("list", list);
			// request.getRequestDispatcher("mainpage.jsp").forward(request, response);
			//
			// }
			// 删除评论
			else if (op.equals("deleteComment")) {
				// 接收传回来的评论id，删除此评论
				int commentId = Integer.parseInt((String) request.getParameter("commentId"));
				wcs.deleteCmById(commentId);

				// 获取本条微博
				int weiboId = Integer.parseInt((String) request.getParameter("cmweiboId"));
				list = ws.queryWbById(weiboId);

				W_weibo detailWb = list.get(0);
				// 获取本条微博的所有评论内容
				list2 = wcs.queryCmById(weiboId);
				// 得到此评论的所有回复存在replyList中
				List<W_weibo> list3 = new ArrayList<>();
				int typeid= Integer.parseInt(request.getParameter("contetypeid"));
				list3=ws.queryWebBytype(typeid);
				 int i=0;
				for(;i<list3.size();i++){
					 if(weiboId==(list3.get(i).getWEIBOID())){
						 list3.remove(i);	
					}
				}		
				
				replyList = rs.queryAllReply();
				request.setAttribute("replyList", replyList);
				request.setAttribute("list2", list2);
				request.setAttribute("list3", list3);
				request.setAttribute("detailWb", detailWb);
				request.getRequestDispatcher("more.jsp").forward(request, response);
			} else if (op.equals("forward")) {
				int weiboId = Integer.parseInt(request.getParameter("weiboid"));
				// String content = request.getParameter("content");
//				String content = new String(request.getParameter("content").getBytes("ISO-8859-1"), "UTF-8");
				String content = request.getParameter("content");
				String sendname = (String) request.getSession().getAttribute("username");

				Date date = new Date();
				W_weibo wb = ws.queryWbById(weiboId).get(0);
				W_weibo oldwb = ws.queryWbById(wb.getBASEID()).get(0);
				W_weibo newwb = new W_weibo();
				newwb.setFWDCONTENT(oldwb.getCONTENT());
				newwb.setCONTENT(content);
				newwb.setSENDNAME(sendname);
				newwb.setPUBLISHTIME(sdf.format(date));
				newwb.setTYPEID(oldwb.getTYPEID());
				newwb.setFWDWEIBOID(weiboId);
				newwb.setBASEID(oldwb.getBASEID());
				if (ws.forwardWeiBo(newwb)) {
					response.getWriter().print(
							"<script language='javascript'>alert('转发成功');parent.location.href='WeiBoServlet?op=homepage'</script>");
				}
			} else if (op.equals("reply")) {
				// 接收传过来的值
				int commentId = Integer.parseInt(request.getParameter("commentId"));
//				String replyerA = new String(request.getParameter("replyerA").getBytes("ISO-8859-1"), "UTF-8");
//				String replyerB = new String(request.getParameter("replyerB").getBytes("ISO-8859-1"), "UTF-8");				
//				String replyContent = new String(request.getParameter("replyContent").getBytes("ISO-8859-1"), "UTF-8");
				String replyContent = request.getParameter("replyContent");
				String replyerA = request.getParameter("replyerA");
				String replyerB = request.getParameter("replyerB");
				String replyTime = sdf.format(new Date());
				W_reply reply = new W_reply(1, commentId, replyerA, replyerB, replyContent, replyTime, "SDFS");
				// 调用service增加回复
				rs.addReply(reply);
				// 得到此评论的所有回复存在replyList中

				replyList = rs.queryAllReply();
				// 获取本条微博
				int weiboId = Integer.parseInt((String) request.getParameter("weiboid"));
				list = ws.queryWbById(weiboId);

				W_weibo detailWb = list.get(0);
				// 获取本条微博的所有评论内容
				list2 = wcs.queryCmById(weiboId);
				
				List<W_weibo> list3 = new ArrayList<>();
				if (request.getParameter("contetypeid")!=null) {
					int typeid= Integer.parseInt(request.getParameter("contetypeid"));
					list3=ws.queryWebBytype(typeid);
					 int i=0;
					for(;i<list3.size();i++){
						 if(weiboId==(list3.get(i).getWEIBOID())){
							 list3.remove(i);	
						}
					}	
				}
					
				request.setAttribute("list2", list2);
				request.setAttribute("replyList", replyList);
				request.setAttribute("detailWb", detailWb);
				request.setAttribute("list3", list3);
				request.getRequestDispatcher("more.jsp").forward(request, response);
			} else if (op.equals("querymycoll"))// 查询我收藏过的微博
			{
				String nickname = (String) session.getAttribute("username");
				List<W_weibo> colllist = new W_collectService().queryMyColl(nickname);
				request.setAttribute("colllist", colllist);
				request.getRequestDispatcher("collectpage.jsp").forward(request, response);
			} else if (op.equals("querymyzan"))// 查询我点赞过的微博
			{
				String nickname = (String) session.getAttribute("username");
				List<W_weibo> zanlist = new W_zanService().queryMyZAN(nickname);
				request.setAttribute("zanlist", zanlist);
				request.getRequestDispatcher("zanpage.jsp").forward(request, response);
			} else if (op.equals("chatpage")) {
				String nickName = (String) session.getAttribute("username");
				List<W_friend> friendList = fs.queryMyFriend(nickName);
				W_userinfo myList = us.getUserInfoByNikeName(nickName);
				request.setAttribute("firstName", friendList.get(0).getFRIENDNAME());
				request.setAttribute("friendList", friendList);
				request.setAttribute("mytouxiang", myList.getTOUXIANG());
				request.getRequestDispatcher("chat.jsp").forward(request, response);
			}
			// 聊天记录的ajax请求
			else if (op.equals("chatcontent")) {
				String sendName = (String) session.getAttribute("username");
//				String receiveName = new String(request.getParameter("receiveName").getBytes("ISO-8859-1"), "UTF-8");
				String receiveName = request.getParameter("receiveName");
				List<W_message> sendMessageList = ms.queryMessageByName(sendName, receiveName);

				Gson g = new Gson();
				String jsonString = g.toJson(sendMessageList);
				// //如果这里加了这句话，意味着视图那一层不需要JSON.parse
				// 这里已经将返回的数据变成了json对象
				response.setContentType("application/json");
				out.print(jsonString);

			} else if (op.equals("sendMessage")) {
				String sendName = (String) session.getAttribute("username");
//				String receiveName = new String(request.getParameter("receiveName").getBytes("ISO-8859-1"), "UTF-8");
				String receiveName = request.getParameter("receiveName");
				String sendTime = sdf.format(new Date());
//				String content = new String(request.getParameter("sendContent").getBytes("ISO-8859-1"), "UTF-8");
				String content = request.getParameter("sendContent");
				W_message message = new W_message(0, sendName, receiveName, content, sendTime, "未读", "我是假的头像");
				ms.addMessage(message);

				List<W_message> sendMessageList = ms.queryMessageByName(sendName, receiveName);

				Gson g = new Gson();
				String jsonString = g.toJson(sendMessageList);
				// //如果这里加了这句话，意味着视图那一层不需要JSON.parse
				// 这里已经将返回的数据变成了json对象
				response.setContentType("application/json");
				out.print(jsonString);
			}
			// 我的主页好友列表请求
			else if (op.equals("myHomeFriend")) {
				String nickName = (String) session.getAttribute("username");
				int groupId = Integer.parseInt(request.getParameter("groupId"));
				// 获得用户信息
				List<W_friend> myHomefriendList = fs.queryMyFriend(nickName, groupId);

				Gson g = new Gson();
				String jsonString = g.toJson(myHomefriendList);
				// //如果这里加了这句话，意味着视图那一层不需要JSON.parse
				// 这里已经将返回的数据变成了json对象
				response.setContentType("application/json");
				out.print(jsonString);
			}
			//注销登录
			else if(op.equals("exit")) {
				session.removeAttribute("username");
				response.sendRedirect("index.jsp");
			}
			
			
		}

	}

}
