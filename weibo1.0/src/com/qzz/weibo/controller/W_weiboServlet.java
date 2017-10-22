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

import com.qzz.weibo.dao.W_collectDao;
import com.qzz.weibo.entity.W_collect;
import com.qzz.weibo.entity.W_comment;
import com.qzz.weibo.entity.W_friend;
import com.qzz.weibo.entity.W_reply;
import com.qzz.weibo.entity.W_userinfo;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.entity.W_zan;
import com.qzz.weibo.service.W_UserInfoService;
import com.qzz.weibo.service.W_collectService;
import com.qzz.weibo.service.W_commentService;
import com.qzz.weibo.service.W_friendService;
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
		// 判断op的值
		if (request.getParameter("op") != null) {
			String op = request.getParameter("op");
			// 查找我的主页中我发过的所有微博
			if (op.equals("queryMyWb")) {
				
				String sendName = (String) session.getAttribute("username");
				// 将查询到的微博list倒序输出
				list = ws.queryWbByName(sendName);
				request.setAttribute("list", list);
				request.setAttribute("sendName", sendName);
				request.getRequestDispatcher("my_home.jsp").forward(request, response);
			} else if (op.equals("homepage")) {
				String nickname="";
				nickname = session.getAttribute("username")+"";
				W_UserInfoService wus = new W_UserInfoService();
				W_userinfo userinfo = new W_userinfo();
				userinfo = wus.getUserInfoByNikeName(nickname).get(0);
				request.setAttribute("userinfo", userinfo);
				request.getRequestDispatcher("homepage.jsp").forward(request, response);

			} 
			else if (op.equals("queryAllWb")) {			
				list = ws.queryAllWb();
				request.setAttribute("list", list);
				request.getRequestDispatcher("mainpage.jsp").forward(request, response);
			}
			// op的值等于publish说明提交发布请求
			else if (op.equals("publish")) {
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
				if (ws.addWeiBo(w)) {
					response.getWriter().print(
							"<script language='javascript'>alert('发布成功');parent.location.href='WeiBoServlet?op=homepage'</script>");
				}
				// 通过id查找单个微博，跳转到该微博的详细信息页面,评论功能
			} else if (op.equals("queryWbById")) {
				int weiboId = 0;
				// 接收评论成功标志
				String successFlag = new String(request.getParameter("cmsuccess").getBytes("ISO-8859-1"), "UTF-8");
				// 如果没有评论
				if (successFlag.equals("no")) {
					weiboId = Integer.parseInt((String) request.getParameter("weiboid"));
					// 如果接收评论标志为yes，则增加评论
				} else if (successFlag.equals("yes")) {
					weiboId = Integer.parseInt((String) request.getParameter("weiboId"));
					String nikeName = (String) session.getAttribute("username");
					String commentContent = new String(request.getParameter("commentContent").getBytes("ISO-8859-1"),
							"UTF-8");
					// String commentContent = request.getParameter("commentContent");
					// String commentContent = request.getParameter("commentContent");
					// 获取当前系统时间
					String commentTime = sdf.format(new Date());			
					W_comment comment = new W_comment(1, weiboId, nikeName, commentContent, commentTime,"22");
					wcs.addComment(comment);
				}				
				list = ws.queryWbById(weiboId);
				W_weibo detailWb = list.get(0);
				// 获取本条微博的所有评论内容
				list2 = wcs.queryCmById(weiboId);
				// 得到此评论的所有回复存在replyList中
				replyList = rs.queryAllReply();
				request.setAttribute("replyList", replyList);
				request.setAttribute("list2", list2);
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
				// 通过昵称查找微博
				list = ws.queryWbByName(zanName);
				request.setAttribute("list", list);
				request.setAttribute("sendName", zanName);
				request.getRequestDispatcher("my_home.jsp").forward(request, response);
			}else if (op.equals("collect")) {
				//通过传过来的微博ID和收藏人的昵称查找数据库并且存储在collectList中
				String msg="";
				int weiboId = Integer.parseInt((String) request.getParameter("weiboid"));
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
					msg="收藏成功";
					//收藏数加一
					wei.setCOLLECTNUM(wei.getCOLLECTNUM()+1);
				}else {
					//如果返回数据不为空，就删除该记录，即取消收藏功能
					cts.deleteCollect(collect);
					msg="取消收藏";
					//收藏数减一
					wei.setCOLLECTNUM(wei.getCOLLECTNUM()-1);
				}
				//修改本条微博的收藏数
					ws.updateWeiboById(wei);
				//通过昵称查找微博	
					if(flag.equals("1")) {
						list = ws.queryAllWb();
						request.setAttribute("list", list);
						if(msg.equals("收藏成功"))
						{
							
						response.getWriter().print("<script language='javascript'>location.href='WeiBoServlet?op=queryAllWb';alert('收藏成功');</script>");
//						request.getRequestDispatcher("mainpage.jsp").forward(request, response);
						}
						else {
						response.getWriter().print("<script language='javascript'>alert('取消收藏');location.href='WeiBoServlet?op=queryAllWb'</script>");
						}
					}
					else {
						list = ws.queryWbByName(collectName);
						request.setAttribute("list", list);
						request.setAttribute("sendName", collectName);
						request.getRequestDispatcher("my_home.jsp").forward(request, response);
					}
				
			}
			else if (op.equals("dianzan")) {
				//通过传过来的微博ID和点赞人的昵称查找数据库并且存储在zanlist中
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
				//修改本条微博的点赞数
					ws.updateWeiboById(wei);
				//通过昵称查找微博	
					list = ws.queryAllWb();
					request.setAttribute("list", list);
					request.getRequestDispatcher("mainpage.jsp").forward(request, response);
			//删除评论
			}else if (op.equals("deleteComment")) {
				//接收传回来的评论id，删除此评论
				int commentId = Integer.parseInt((String) request.getParameter("commentId"));
				wcs.deleteCmById(commentId);

				// 获取本条微博
				int weiboId = Integer.parseInt((String) request.getParameter("cmweiboId"));
				list = ws.queryWbById(weiboId);

				W_weibo detailWb = list.get(0);
				// 获取本条微博的所有评论内容
				list2 = wcs.queryCmById(weiboId);
				// 得到此评论的所有回复存在replyList中
				replyList = rs.queryAllReply();
				request.setAttribute("replyList", replyList);
				request.setAttribute("list2", list2);
				request.setAttribute("detailWb", detailWb);
				request.getRequestDispatcher("more.jsp").forward(request, response);
			} else if (op.equals("forward")) {
				int weiboId = Integer.parseInt(request.getParameter("weiboid"));
				// String content = request.getParameter("content");
				String content = new String(request.getParameter("content").getBytes("ISO-8859-1"), "UTF-8");
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
				String replyerA = new String(request.getParameter("replyerA").getBytes("ISO-8859-1"), "UTF-8");
				String replyerB = new String(request.getParameter("replyerB").getBytes("ISO-8859-1"), "UTF-8");
				String replyContent = new String(request.getParameter("replyContent").getBytes("ISO-8859-1"), "UTF-8");
				String replyTime = sdf.format(new Date());
				W_reply reply = new W_reply(1, commentId, replyerA, replyerB, replyContent, replyTime,"SDFS");
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

				request.setAttribute("list2", list2);
				request.setAttribute("replyList", replyList);
				request.setAttribute("detailWb", detailWb);
				request.getRequestDispatcher("more.jsp").forward(request, response);
			}
			else if (op.equals("querymycoll"))//查询我收藏过的微博
			{				
				String nickname = (String) session.getAttribute("username");
				List<W_weibo> colllist = new W_collectService().queryMyColl(nickname);
				request.setAttribute("colllist", colllist);
				request.getRequestDispatcher("collectpage.jsp").forward(request, response);
			}
			else if (op.equals("querymyzan"))//查询我点赞过的微博
			{				
				String nickname = (String) session.getAttribute("username");
				List<W_weibo> zanlist = new W_zanService().queryMyZAN(nickname);
				request.setAttribute("zanlist", zanlist);
				request.getRequestDispatcher("zanpage.jsp").forward(request, response);
			}else if (op.equals("chatpage")) {
				String nickName = (String) session.getAttribute("username");
				List<W_friend> friendList = fs.queryMyFriend(nickName);
				List<W_userinfo> myList = us.getUserInfoByNikeName(nickName);
				System.out.println(friendList);
				request.setAttribute("friendList", friendList);
				request.setAttribute("mytouxiang", myList.get(0).getTOUXIANG());
				request.getRequestDispatcher("chat.jsp").forward(request, response);
			}
		}

	}

}
