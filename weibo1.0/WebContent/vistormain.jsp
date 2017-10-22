<%@page import="java.util.ArrayList"%>
<%@page import="com.qzz.weibo.entity.W_weibo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" href="css/visitor.css" />
<link rel="stylesheet" type="text/css" href="css/vitorbody.css" />
<script src="backdrop/bodyvitor.js" type="text/javascript"></script>
<meta charset="utf-8" />
<title></title>
<style type="text/css">
  .hotresearch {
				position: fixed;				 
				border-radius: 10px;
				height: 500px;
				width: 120px;			 
			} 
</style>

<script type="text/javascript">		


$(function() {
	//固定左边的列表 
	$(window).scroll(function() {
		console.log($(window).scrollTop());
		if($(window).scrollTop() > 250) {					
			$(".hotresearch").attr("style", "margin-top:-10px");
		} else {
			$(".hotresearch").attr("style", "margin-top:0px");			
		}
	});
})




  $(function(){
  $(".lefelist").first().addClass("navdown");//先设置热门是点击的
  $(".lefelist").click(function(){	
	  $(this).addClass('navdown').siblings().removeClass('navdown');
  })
  
  
  $(".freshsearch").click(function(){	
    $(".xxfresh").addClass("navdown");
    $(".freshsearch").show();
    $(".lefelist").first().removeClass("navdown");
  })
          $(".moreweibo").hover().css("cursor", "pointer");
          $(".contentid").hide();
          $(".contenttypeid").hide();
		$(".moreweibo").click(function(){  
		    var conteid=parseInt($(this).find(".contentid").html());
		    var contetypeid=parseInt($(this).find(".contenttypeid").html());
		    location.href="firstWeiBoServlet?xra=xmoreweibo&conid="+conteid; 
		    parent.location.href="firstWeiBoServlet?xra=xmoreweibo&contypeid="+contetypeid+"&conid="+conteid; 
	})
	
	
	
	 $(".formore").hover().css("cursor", "pointer");
			$(".formore").click(function(){  
			    $(".listnewtype").hide();
			    $(".llgion").hide();
			    
		})
})

</script>
<!--记住密码功能-->
<script type="text/javascript">
	window.onload = function onLoginLoaded() {
		var usr = document.getElementById('inputEmail3').value;
		var pwd = GetCookie(usr);
		if (pwd != null) {
			GetLastUser();
		}
	}
	function GetLastUser() {
		var id = "49BAC005-7D5B-4231-8CEA-16939BEACD67";//GUID标识符
		var usr = GetCookie(id);
		if (usr != null) {
			document.getElementById('inputEmail3').value = usr;
		} else {
			document.getElementById('inputEmail3').value = "";
		}
		GetPwdAndChk();
	}
	//点击登录时触发客户端事件
	function SetPwdAndChk() {
		//取用户名
		var usr = document.getElementById('inputEmail3').value;
		//将最后一个用户信息写入到Cookie
		SetLastUser(usr);
		//如果记住密码选项被选中
		if (document.getElementById('chkRememberPwd').checked == true) {
			//取密码值
			var pwd = document.getElementById('inputPassword3').value;
			var expdate = new Date();
			expdate.setTime(expdate.getTime() + 14 * (24 * 60 * 60 * 1000));
			//将用户名和密码写入到Cookie
			SetCookie(usr, pwd, expdate);
		} else {
			//如果没有选中记住密码,则立即过期
			ResetCookie();
		}
	}
	function SetLastUser(usr) {
		var id = "49BAC005-7D5B-4231-8CEA-16939BEACD67";
		var expdate = new Date();
		//当前时间加上两周的时间
		expdate.setTime(expdate.getTime() + 14 * (24 * 60 * 60 * 1000));
		SetCookie(id, usr, expdate);
	}
	//用户名失去焦点时调用该方法
	$(function() {
		$("#inputEmail3").blur(function() {
			var usr = document.getElementById('inputEmail3').value;
			var pwd = GetCookie(usr);
			if (pwd != null) {
				document.getElementById('chkRememberPwd').checked = true;
				document.getElementById('inputPassword3').value = pwd;
			} else {
				document.getElementById('chkRememberPwd').checked = false;
				document.getElementById('inputPassword3').value = "";
			}
		});
	});
	function GetPwdAndChk() {
		var usr = document.getElementById('inputEmail3').value;
		var pwd = GetCookie(usr);
		if (pwd != null) {
			document.getElementById('chkRememberPwd').checked = true;
			document.getElementById('inputPassword3').value = pwd;
		} else {
			document.getElementById('chkRememberPwd').checked = false;
			document.getElementById('inputPassword3').value = "";
		}

	}
	//取Cookie的值
	function GetCookie(name) {
		var arg = name + "=";
		var alen = arg.length;
		var clen = document.cookie.length;
		var i = 0;
		while (i < clen) {
			var j = i + alen;
			//alert(j);
			if (document.cookie.substring(i, j) == arg)
				return getCookieVal(j);
			i = document.cookie.indexOf(" ", i) + 1;
			if (i == 0)
				break;
		}
		return null;
	}

	function getCookieVal(offset) {
		var endstr = document.cookie.indexOf(";", offset);
		if (endstr == -1)
			endstr = document.cookie.length;
		return unescape(document.cookie.substring(offset, endstr));
	}
	//写入到Cookie
	function SetCookie(name, value, expires) {
		var argv = SetCookie.arguments;
		//本例中length = 3
		var argc = SetCookie.arguments.length;
		var expires = (argc > 2) ? argv[2] : null;
		var path = (argc > 3) ? argv[3] : null;
		var domain = (argc > 4) ? argv[4] : null;
		var secure = (argc > 5) ? argv[5] : false;
		document.cookie = name
				+ "="
				+ escape(value)
				+ ((expires == null) ? "" : ("; expires=" + expires
						.toGMTString()))
				+ ((path == null) ? "" : ("; path=" + path))
				+ ((domain == null) ? "" : ("; domain=" + domain))
				+ ((secure == true) ? "; secure" : "");
	}
	function ResetCookie() {
		var usr = document.getElementById('inputEmail3').value;
		var expdate = new Date();
		SetCookie(usr, null, expdate);
	}
</script>
<!-- 记住密码功能结束 -->

<c:if test="${requestScope.name!=null}">
	<c:if test="${requestScope.pwd!=null}">
		<c:forEach items="${requestScope.name}" var="na">
			<c:forEach items="${requestScope.pwd}" var="pw">
				<script type="text/javascript">
					$(function() {
						$("#inputEmail3").val("${na}");
						$("#inputPassword3").val("${pw}");
					});
				</script>
			</c:forEach>
		</c:forEach>
	</c:if>
</c:if>



</head>
<body class="home">
	<canvas id="c" width="300" height="150"></canvas>
	<!--头部logo以及导航栏开始-->
	<div id="header">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-9 column  sousuo">
					<img style="height: 40px; widows: 50px;"
						src="img/visitor_img/logo.PNG" /> <input id="serach"
						type="search" placeholder="大家都在搜：王力宏出新专"> <input
						type="button" class="btnsearch" name="" id="" value="" />

				</div>
				<div class="col-md-3 column daohan3">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="index.jsp"><span
								class="glyphicon glyphicon-home"></span>首页</a></li>
						<li><a href="regiter.jsp">注册</a></li>
						<li class="nav navbar-nav navbar-right"><a id="loginmain"
							href="#modal-container-580488" role="button" class="btn"
							data-toggle="modal">登录</a></li>

					</ul>
				</div>
			</div>
		</div>

	</div>
	<!--头部logo以及导航栏结束-->
	<!--
            	作者：offline
            	时间：2017-10-11
            	描述：导航开始
           -->

	<!--
            	作者：offline
            	时间：2017-10-11
            	描述：导航结束
            -->

	<div class="container">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<!--
            	作者：offline
            	时间：2017-10-11
            	描述：左侧列表开始
            -->
				<div class="col-md-2 "
					style=" text-align: center;margin: 0px;padding: 0px ;width: 120px; margin-top: 80px;">
					<div  class="hotresearch">
					<div class="listnewtype">
					<div class="list lefelist" style="border: none;">
						<a href="firstWeiBoServlet?xra=hotdoor" class="list-group "	
							target="vistorcontent">
							<div>						
							热门
							</div>
							</a>
					</div>
					<div class="list lefelist" style="border: none;">
						<a href="firstWeiBoServlet?xra=vsatr" class="list-group "
							target="vistorcontent">
							<div>						
							明星
							</div>
							</a>
					</div>
					<div class="list lefelist" style="border: none;">
						<a href="firstWeiBoServlet?xra=vtop" class="list-group  "
							target="vistorcontent">
							<div>						
							头条
							</div>
							</a>
					</div>
					<div class="list lefelist xxfresh" style="border: none;">
						<a href="firstWeiBoServlet?xra=vfresh" class="list-group "
							target="vistorcontent">
							<div>						
							新鲜事
							</div>
							</a>
					</div>
					<div class="list lefelist" style="border: none;">
						<a href="firstWeiBoServlet?xra=vlove" class="list-group  "
							target="vistorcontent">
							<div>						
							动漫
							</div>
							</a>
					</div>
					<div class="list lefelist" style="border: none;">
						<a href="" class="list-group  "
							>
							<div>						
							社会
							</div>
							</a>
					</div>
					<div class="list lefelist" style="border: none;">
						<a href="" class="list-group  "
							>
							<div>						
							美女
							</div>
							</a>
					</div>
					<div class="list lefelist" style="border: none;">
						<a href="" class="list-group  "
							>
							<div>						
							情感
							</div>
						</a>
					</div>
					<div class="list lefelist" style="border: none;">
						<a href="" class="list-group  "
							>
							<div>						
							时尚
							</div>
							</a>
					</div>
					</div>
					</div>
				</div>
				<!--
            	作者：offline
            	时间：2017-10-11
            	描述：左侧列表结束
            -->

				<!--
            	作者：offline
            	时间：2017-10-11
            	描述：中间列表开始
            -->
				<div class="col-md-7 column" style="padding: 0px; margin: 0px;">
					<iframe id="vistormaincontent" name="vistorcontent"
						src="firstWeiBoServlet?xra=hotdoor" scrolling="no"
						src="vistordoor.html" width="100%" height="2800px" scrolling="no"
						frameborder="0"></iframe>
				</div>
				<!--
            	作者：offline
            	时间：2017-10-11
            	描述：中间列表结束
            -->

				<!--
            	作者：offline
            	时间：2017-10-11
            	描述：右侧列表开始
            -->

				<div class="col-md-3 column"
					style="background-color: rgb(242, 242, 245); width: 340px;margin-top: 80px;margin-left: 2px;">
					<!--
            	作者：offline
            	时间：2017-10-11
            	描述：右侧的登录框开始
           -->
           <div class="llgion">
					<form class="form-horizontal" role="form"
						style="background-color: rgb(255, 255, 255); margin: 6px; margin-top: 10px; padding: 10px;"
						action="LoginRegister" method="post">
						<div class="form"
							style="text-align: center; height: 35px; line-height: 30px;">
							<h3 style="border-bottom: 3px solid orangered;">账号登录</h3>
						</div>
						<div class="form-group div-bor" id="name_main"
							style="padding: 2px 15px;">

							<input type="text" class="form-control class" id="inputEmail3"
								name="namem" placeholder="用户名" />
						</div>
						<div class="form-group" id="password_main"
							style="padding: 2px 15px;">
							<input type="password" class="form-control" id="inputPassword3"
								name="pwdm" placeholder="密码" />
						</div>
						<div class="form-group" style="padding: 0px 15px;">
							<div class="checkbox">
								<label style="margin-right: 130px;"> <input
									id="chkRememberPwd" type="checkbox" class="danger" />记住我
								</label> <label><a href="#">忘记密码</a></label>
							</div>
						</div>
						<div class="form-group" style="text-align: center;">
							<div class=" col-sm-10">
								<input type="hidden" name="op" value="loginm">
								<button type="submit" class="btn btn-default "
									onclick="SetPwdAndChk()"
									style="background-color: rgb(255, 129, 64); width: 280px;">登录</button>
							</div>
							<div class=" col-sm-10" style="text-align: left;">
								还没有微博? <a href="regiter.jsp">立即注册</a>
							</div>
						</div>
					</form>
                   </div>
					<!--
            	作者：offline
            	时间：2017-10-11
            	描述：右侧的登录框结束
            -->
					<div id=""
						style="height: 20px; width: 340px; background: white; margin-left: -15px; border-bottom: 1px solid red;">

					</div>
					<!--
            	作者：offline
            	时间：2017-10-11
            	描述：右侧的微博新鲜事情开始
            -->
					<!--
                    	作者：offline
                    	时间：2017-10-12
                    	描述：第一行开始
                    -->

					<div class="form-group foorgroup" style="margin-top: 10px;">
						<div class="form"
							style="text-align: left; height: 35px; line-height: 30px;">
							<h4 style="font-weight: bolder;">微博新鲜事</h4>
						</div>
						<table class="table">
							<c:if test="${requestScope.pdfresh!=null}">
								<c:forEach items="${requestScope.pdfresh}" var="rs">
									 <a  style="text-decoration: none;"> 
										<tr>
											<div class="col-md-12 column moreweibo" style="margin-top: 15px;" >
												<div class="row clearfix">
													<!-- 第一行右边开始  -->
													<div class="col-md-7 leftcontent"
														style="text-align: left; height: 88px;">
														<span>${rs.CONTENT}</span><br /> <br />
														<span >${rs.PUBLISHTIME}</span>
														 <div class="contentid">
                                                         ${rs.WEIBOID }  
                                                        </div>
                                                         <div class="contenttypeid">
                                                         ${rs.TYPEID }  
                                                   </div>
														<!-- 第一行右边 图片开始  -->
													</div>
													<!-- 第一行左边图片 开始-->
													<div class="col-md-5">
														<!-- 第一行左边图片 开始-->
														<img src="img/visitor_img/6.jpg"
															style="width: 110px; height: 88px;">
														<!-- 第一行左边图片结束  -->
													</div>
												</div>
											</div>
											&nbsp;
											<td style="border: none;"></td>
										</tr>
									</a>
								</c:forEach>
							</c:if>
						</table>
						<div class="form"
							style="text-align: center; text-decoration: none; height: 35px; line-height: 30px;">

							<a href="WeiBoServlet?xra=vfresh" target="vistorcontent"  style="text-decoration: none;" class="freshsearch"><h6>查看更多></h6></a>
						</div>
					</div>
					<!--
                    	作者：offline
                    	时间：2017-10-12
                    	描述：第一行结束
                    -->
					<div id=""
						style="height: 20px; width: 340px; background: white; margin-left: -15px; border-bottom: 1px solid red;">

					</div>
					<!--
            	作者：offline
            	时间：2017-10-11
            	描述：右侧的微博新鲜事结束
       -->

					<!--
            	作者：offline           	
            	描述：右侧的微博实时热点开始
            -->
					<!--
                    	作者：offline
                    	时间：2017-10-12
                    	描述：第一行开始
                    -->
					<div class="form-group foorgroup" style="margin-top: 10px;">
						<div class="form"
							style="text-align: left; height: 35px; line-height: 30px;">
							<h4 style="font-weight: bolder;">微博热搜话题</h4>
						</div>
						<table class="table">
							<c:if test="${requestScope.pdhotdoor!=null}">
								<c:forEach items="${requestScope.pdhotdoor}" var="rs">
									
										<tr>
											<div class="col-md-12 column moreweibo" style="margin-top: 15px;">
												<div class="row clearfix">
													<!-- 第一行右边开始  -->
													<div class="col-md-4" style="text-align: left;">
														<!-- 第一行左边图片 开始-->
														<img src="img/visitor_img/8.jpg"
															/ style="width: 66px; height: 66px;">
														<!-- 第一行左边图片结束  -->
													</div>
													<!-- 第一行左边图片 开始-->
													<div class="col-md-8 leftcontent">
														<span >${rs.CONTENT}……</span><br /> <br />
														<span >${rs.PUBLISHTIME}</span>
													</div>
													 <div class="contentid">
                                                         ${rs.WEIBOID }  
                                                     </div>
                                                      <div class="contenttypeid">
                                                         ${rs.TYPEID }  
                                                   </div>
												</div>
											</div>
											&nbsp;
											<td style="border: none;"></td>
										</tr>
								
								</c:forEach>
							</c:if>
						</table>
						<div class="form formore"
							style="text-align: center; text-decoration: none; height: 35px; line-height: 30px;">
							
								<a href="firstWeiBoServlet?xra=hotdoor" target="vistorcontent"  style="text-decoration: none;" class="freshsearch"><h6>查看更多></h6></a>

							
						</div>
					</div>
					<!--
                    	作者：offline
                    	时间：2017-10-12
                    	描述：第一行结束
                    -->

					<!--
            	作者：offline
            	时间：2017-10-11
            	描述：右侧的右侧的微博实时热点结束
       -->

				</div>
				<!--
            	作者：offline
            	时间：2017-10-11
            	描述：右侧列表结束
            -->
			</div>
		</div>
	</div>
	</div>
	<!--
        	作者：offline
        	时间：2017-10-13
        	描述：登录模态窗口设计开始
        -->
	<div class="modal fade" id="modal-container-580488" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">账号登录</h4>
				</div>
				<div class="modal-body">
					<form action="LoginRegister" method="post">
						<div id="name">
							<input type="text" id="textname" name="namet" placeholder="用户名" />
						</div>
						<div id="password">
							<input type="password" id="pwd" name="pwdt" placeholder="密码" />
						</div>
						<div id="changeuser">
							<input type="radio" name="cu" id="" value="user" checked="" />用户&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="cu" id="" value="admin" />管理员
						</div>
						<div id="btn_up">
							<input type="hidden" name="op" value="logint" /> <input
								type="submit" id="log" value="登录" />
						</div>
						<div id="zc_wj" style="text-align: center;">
							<a class="a1" href="regiter.jsp" id="xiaomireg">注册账号</a>&nbsp;
						</div>
					</form>
				</div>

			</div>

		</div>

	</div>
	<!--
        	作者：offline
        	时间：2017-10-13
        	描述：登录模态窗口设计结束
        -->
        
   <!--
   alert(document.iframeName.count);//获取子iframe中的js变量 
alert($(window.frames["iframeName"].document).contents().find("#username"));//获取子iframe中jQuery对象 
alert($("#username",document.frames("iframeName").document));//获取子iframe中jQuery对象 
alert(window.document.getElementById('iframeId').contentWindow.document.getElementByIdx_x('username'));//获取子iframe中DOM对象 
   $(window.frames["iframeName"].document).find("#testId").html()
   window.location.reload()刷新当前页面.
parent.location.reload()刷新父亲对象（用于框架）
opener.location.reload()刷新父窗口对象（用于单开窗口）
top.location.reload()刷新最顶端对象（用于多开窗口）
var conid=$(".contentid").html();
		   alect(conid);
		   parent.location.href="W_weiboServlet?xra=xmoreweibo&contentid="+conid;
        	作者：offline
        	时间：2017-10-13
        	描述：微博详细界面的跳转
        -->     
</body>

</html>