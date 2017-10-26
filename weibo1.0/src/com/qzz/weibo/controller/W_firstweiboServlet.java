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

import com.qzz.weibo.entity.W_comment;
import com.qzz.weibo.entity.W_reply;
import com.qzz.weibo.entity.W_weibo;
import com.qzz.weibo.service.W_commentService;
import com.qzz.weibo.service.W_replyService;
import com.qzz.weibo.service.W_weiboService;

/**
 * Servlet implementation class WeiBoServlet
 */
@WebServlet("/firstWeiBoServlet")
public class W_firstweiboServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	W_weiboService  ws=new W_weiboService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public W_firstweiboServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
				+ request.getContextPath() + "/";
		

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
	
		List<W_weibo> list = new ArrayList<>();
		List<W_comment> list2 = new ArrayList<>();
		List<W_reply> replyList = new ArrayList<>();
		HttpSession session = request.getSession();
			String xra=request.getParameter("xra");	
            if(xra.equals("byall")) {
            	/* 先获取微博新鲜事和热门微博,只显示五条*/
            	List<W_weibo>pdfreshall=new ArrayList<>();
            	List<W_weibo>pdhotdoorall=new ArrayList<>();
            	List<W_weibo>pdfresh=new ArrayList<>();
            	List<W_weibo>pdhotdoor=new ArrayList<>();
            	int page=1;
				int pageSize=5;
				pdfreshall=ws.queryWebBytype(8);
				pdhotdoorall=ws.queryWebBytype(2);
				if(pdfreshall.size()>5) {
					pdfresh=pdfreshall.subList(0, 4);
				}else {
					pdfresh=pdfreshall.subList(0, pdfreshall.size());
				}
				if(pdhotdoorall.size()>5) {
					pdhotdoor=pdhotdoorall.subList(0, 4);
				}else {
					pdhotdoor=pdfreshall.subList(0, pdhotdoorall.size());
				}	
            	request.setAttribute("pdfresh", pdfresh);
            	request.setAttribute("pdhotdoor", pdhotdoor);
            	request.getRequestDispatcher("vistormain.jsp").forward(request, response);
				return;	
			}else if(xra.equals("hotdoor")){
				/* 获取热门微博头三条微博，用于轮播滚动时用*/
				List<W_weibo>hotpticture=new ArrayList<>();
				List<W_weibo>hotbutton=new ArrayList<>();
				list=ws.queryWebBytype(2);	
                if(list.size()>4) {
                	hotpticture=list.subList(0, 3);

                } 
                int second=0;
                second=list.get(1).getWEIBOID();              
                hotbutton=list.subList(3, list.size());
                request.setAttribute("hotpticture", hotpticture);
				request.setAttribute("hotbutton", hotbutton);
				request.setAttribute("second", second);
				request.getRequestDispatcher("vistorhotdoor.jsp").forward(request, response);
				return;				
			}else if(xra.equals("vsatr")){
				/* 获取明星微博*/
				list=ws.queryWebBytype(3);			 
				request.setAttribute("list", list);
				request.getRequestDispatcher("vistorstar.jsp").forward(request, response);
				return;		
			}else if(xra.equals("vtop")) {
				/* 获取头条微博*/
			    list=ws.queryWebBytype(1);	
				request.setAttribute("list", list);
				request.getRequestDispatcher("vistortop.jsp").forward(request, response);
				return;		
			}else if(xra.equals("vfresh")) {
				/* 获取新鲜事微博*/
				list=ws.queryWebBytype(9);
				request.setAttribute("list", list);		
				request.getRequestDispatcher("vistorfresh.jsp").forward(request, response);
				return;		
			}
			else if(xra.equals("vlove")) {
				/* 获取情感微博*/
				list=ws.queryWebBytype(8);
				request.setAttribute("list", list);			
				request.getRequestDispatcher("vistorlove.jsp").forward(request, response);
				return;		
			}else if(xra.equals("xmoreweibo")) {
				List<W_weibo> list3 = new ArrayList<>();
				int weiboid= Integer.parseInt(request.getParameter("conid"));
				int typeid= Integer.parseInt(request.getParameter("contypeid"));				
				W_commentService wcs = new W_commentService();					
				list = ws.queryWbById(weiboid);
				list3=ws.queryWebBytype(typeid);
				int i=0;
				for(;i<list3.size();i++){
					 if(weiboid==(list3.get(i).getWEIBOID())){
						 list3.remove(i);	
					}
				}							
				W_weibo detailWb = list.get(0);
				// 获取本条微博的所有评论内容
				list2 = wcs.queryCmById(weiboid);
				// 得到此评论的所有回复存在replyList中
				replyList = new W_replyService().queryAllReply();
				request.setAttribute("replyList", replyList);
				request.setAttribute("list2", list2);
				request.setAttribute("list3", list3);
				request.setAttribute("detailWb", detailWb);
				request.getRequestDispatcher("more.jsp").forward(request, response);
			}
		
	
	}
}

