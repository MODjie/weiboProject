package com.qzz.weibo.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
@WebFilter(urlPatterns= {"/homepage.jsp", "/my_home.jsp","/mainpage.jsp","/collectpage.jsp","/zanpage.jsp"})
public class FileCharater implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		      // TODO Auto-generated method stub
		      response.setCharacterEncoding("utf-8");
              request.setCharacterEncoding("utf-8");
              HttpServletRequest req = (HttpServletRequest) request;  
              HttpServletResponse resp = (HttpServletResponse) response; 
              HttpSession session = req.getSession();
              if(session.getAttribute("username")==null) {
            	JOptionPane.showMessageDialog(null, "您尚未登录，或您的帐号已在其他地方再次登录，请重新登录！", "记录失效", JOptionPane.ERROR_MESSAGE);
      			resp.sendRedirect("index.jsp");
      		}
              chain.doFilter(req,resp); 
              
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
