<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/imagediv.css?df=1"/>
		<link rel="stylesheet" type="text/css" href="css/index01.css"/>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
		<script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		.share_weibo_wp{width:520px; padding:20px; background-color:#fff; margin-left:auto; margin-right:auto; margin-top:20px;-khtml-border-radius:10px;-ms-border-radius:10px;-o-border-radius:10px;-moz-border-radius:10px;-webkit-border-radius:10px;border-radius:10px;behavior: url(ie-css3.htc)}
		.count_txt{color: #B5B5B5;text-align: right}
		.count_txt strong {font-family: georgia;font-size: 24px; padding: 0 2px}
		.inputstyle {height: 75px;line-height: 18px;overflow-x: hidden;overflow-y: auto;width: 472px;resize: none;}
		</style>
		<script type="text/javascript">
			$(function() {
				$(".aa").mousemove(function() {
					$(this).css("background-color", "rgba(0,0,0,0.2)");
				});
				$(".aa").mouseleave(function() {
					$(this).css("background-color", "rgba(0,0,0,0)");
				})
			});
		</script>
		<script type="text/javascript">
		var weiboid;
			$(function() {
				//search-box 随屏幕滚动 
				$(window).scroll(function() {
					
					console.log($(window).scrollTop());
					if($(window).scrollTop() > 150) {
						$(".left").attr("style", "margin-top:-200px");
						$(".hotresearch").attr("style", "margin-top:-450px");
					} else {
						$(".left").attr("style", "margin-top:0px");
						$(".hotresearch").attr("style", "margin-top:0px");
					}

				});
				
				
				//点击取消关闭转发窗口
				$("#cancle").click(function(){
					$('#myModal1').css("display", "none");
					//启用滚动条
					$("body").css({
						"overflow-y": "auto"
					});
				});
				
				//点击转发提交Weiboservlet处理
				$("#forward").click(function(){
					var content = $("#forwardcontent").val();
					location.href="WeiBoServlet?op=forward&weiboid="+weiboid+"&content="+content;
				})
			})
			
			//获取子页面传过来的weiboid
			function forward(id){
				weiboid = id;
			}
			
			//转发字符动态限制
			function checkLength(which) {
 				 var maxChars = 120;
 				 if (which.value.length > maxChars)
  					which.value = which.value.substring(0,maxChars);
 					var curr = maxChars - which.value.length;
  					document.getElementById("currentLength").innerHTML = curr.toString()
  				}
		</script>
	</head>

	<body style="background-color: rgb(94, 122, 161);">
		<!--头部logo以及导航栏开始-->
		<div id="header">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-9 column">
						<a href="WeiBoServlet?op=homepage" ><img src="img/logo.PNG" /></a>
						<input id="serach" type="search" placeholder="看不完的新鲜事">
						<input type="button" id="sousuo" value="" />
					</div>
					<div class="col-md-3 column">
						<ul class="nav nav-tabs" style="position:absolute ;display: inline;">
							<li class="active">
								<a href="WeiBoServlet?op=homepage" >首页</a>
							</li>
							<li>
								<a href="#">简介</a>
							</li>
							<li class="disabled">
								<a href="#">信息</a>
							</li>
							<li class="dropdown pull-right">
								<a href="#" data-toggle="dropdown" class="dropdown-toggle">设置<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">操作</a>
									</li>
									<li>
										<a href="#">设置栏目</a>
									</li>
									<li>
										<a href="#">更多设置</a>
									</li>
									<li class="divider">
									</li>
									<li>
										<a href="#">分割线</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--头部logo以及导航栏结束-->

		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">

					<!--下方内容区域开始-->
					<div class="content">

						<!--左边导航栏-->
						<div class="left">

							<div class="aa">
								<a href="WeiBoServlet?op=queryAllWb" target="maincontent">首页</a>
							</div>
							<div class="aa">
								<a href="WeiBoServlet?op=querymycoll" target="maincontent">收藏</a>
							</div>
							<div class="aa">
								<a href="WeiBoServlet?op=querymyzan" target="maincontent">我的赞</a>
							</div>
							<hr />
							<div class="aa">
								<a href="">好友圈</a>
							</div>
							<div class="aa">
								<a href="">特别关注</a>
							</div>
							<div class="aa">
								<a href="">匿名微博</a>
							</div>
							<hr />
							
						</div>
						<!--中间发布以及微博显示区域-->
						<div class="center" >

							<!-- 弹窗 -->
							<div id="myModal" class="modal">

								<!-- 关闭按钮 -->
								<span class="close" ><font size="7" color="white">&times;</font> </span>

								<!-- 弹窗内容 -->
								<center>
								<img class="modal-content" id="img01">
								</center>
								<!-- 文本描述 -->
								<div id="caption"></div>
							</div>
							<iframe id="maincontent"  name="maincontent" src="WeiBoServlet?op=queryAllWb" frameborder="0" width="100%" height="100%"></iframe>
						</div>
						<!--中部发布以及微博显示区域结束-->

						<!--右边个人信息以及热搜榜区域开始-->
						<div class="right">
							<!--个人信息显示区域开始-->
							<div class="userinfo">
								<a href="WeiBoServlet?op=queryMyWb"><img src="${requestScope.userinfo.TOUXIANG}" alt="140×140" class="img-circle touxiang" /></a>
								<div class="username">
									<a href="WeiBoServlet?op=queryMyWb">${requestScope.userinfo.NICKNAME}</a>
								</div>
								<div class="WB_cardwrap S_bg2 " style="background-color: white;">
									<div class="PCD_counter">
										<div class="WB_innerwrap">
											<table class="tb_counter" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td class="S_line1">
															<a href="#">
																<strong class="W_f18">92</strong>
																<span class="S_txt2">关注</span>
															</a>
														</td>
														<td class="S_line1">
															<a href="#">
																<strong class="W_f18">15</strong>
																<span class="S_txt2">粉丝</span>
															</a>
														</td>
														<td class="S_line1">
															<a href="#">
																<strong class="W_f18">10</strong>
																<span class="S_txt2">微博</span>
															</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

							</div>
							<br />
							<!--微博，粉丝，关注卡片div的结束-->
							<!--热搜榜显示区域开始-->

							<div class="hotresearch">
								<label class="control-label" style="margin:15px 0px 0px 15px;">热门话题</label>
								<a href="" class="text-right" style="margin-left: 100px;">¤换一换</a>
								<hr />

								<div class="list">
									<ol>
										<li>
											<a href="">鹿晗关晓彤宣布恋情</a>
										</li>
										<li>
											<a href="">国庆都去哪了</a>
										</li>
										<li>
											<a href="">绝地求生即将禁播20天</a>
										</li>
										<li>
											Facilisis in pretium nisl aliquet
										</li>
										<li>
											Nulla volutpat aliquam velit
										</li>
										<li>
											Faucibus porta lacus fringilla vel
										</li>
										<li>
											Aenean sit amet erat nunc
										</li>
										<li>
											Eget porttitor lorem
										</li>
									</ol>

								</div>
								<hr />
								<center>
									<a href="">查看更多</a>
								</center>
							</div>
						</div>
						<!--右边个人信息以及热搜榜显示区域结束-->

					</div>
				</div>
			</div>
		</div>
		

		
		
		<!-- 弹窗 -->
							<div id="myModal1" class="modal">

								<!-- 关闭按钮 -->
								<span class="close" ><font size="7" color="white">&times;</font> </span>

								<!-- 弹窗内容 -->
								<center>
								<div class="cl share_weibo_wp" style="">
  <div class="cl">
    <h4 class="l">分享到微博</h4>
    <span class="r count_txt">还能输入<strong id="currentLength">120</strong>字</span>
  </div>
  <textarea onkeyup="checkLength(this);" id="forwardcontent" class="textarea radius inputstyle" name="" cols="" rows=""></textarea><br>
  <button type="button" id="forward" style="margin-top:15px;" class="btn btn-primary text-right">转发</button>
  <button type="button" id="cancle" style="margin-top:15px;margin-left:100px" class="btn btn-primary text-right">取消</button>
</div>
								</center>
							
							</div>
</div>
		
	</body>

</html>