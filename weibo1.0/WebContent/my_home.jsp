<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的微博</title>
<link rel="stylesheet" type="text/css" href="css/my_home.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap01.js"></script>
</head>

<body style="background-color: rgb(94, 122, 161);">
	<!--顶部导航栏开始-->
	<div id="header">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-9 column">
					<a href="homepage.jsp"><img src="img/logo.PNG" /></a> <input
						type="text" class="search-input" placeholder="看不完的新鲜事" />
				</div>

				<div class="col-md-3 column">
					<ul class="nav nav-tabs"
						style="position: absolute; display: inline;">
						<li class="active"><a href="homepage.jsp">首页</a></li>
						<li><a href="#">简介</a></li>
						<li class="disabled"><a href="#">信息</a></li>
						<li class="dropdown pull-right"><a href="#"
							data-toggle="dropdown" class="dropdown-toggle">设置<strong
								class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">操作</a></li>
								<li><a href="#">设置栏目</a></li>
								<li><a href="#">更多设置</a></li>
								<li class="divider"></li>
								<li><a href="#">分割线</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--顶部导航栏结束-->
	<!--主div开始-->
	<div class="container">
		<div class="row clearfix main">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-1 column"></div>
					<!--fm_main div开始-->
					<div id="fm_main" class="col-md-10 column">
						<div class="row clearfix">
							<!--封面div开始-->
							<div id="fm" class="col-md-12 column">
								<a href="#"><img alt="140x140" src="img/touxiang.jpg"
									class="img-circle" /></a> <a id="userName"
									href="WeiBoServlet?op=queryMyWb"><h4 id="niCheng">${requestScope.sendName }
									</h4></a>
								<h5>一句话介绍下你自己吧,让别人更了解你</h5>
							</div>
							<!--封面div结束-->
							<!--封面导航 div开始-->
							<div class="col-md-12 column PCD_tab S_bg2">
								<div class="tab_wrap">
									<table class="tb_tab" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td><a href="WeiBoServlet?op=queryMyWb">我的主页</a></td>
												<td><a href="photo.jsp">我的相册</a></td>
												<td><a href="/W_UserInfoServlet?op=getUserInfo">管理中心</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!--封面导航 div结束-->

						</div>
						<!--ct_main div开始-->
						<div id="ct_main" class="row clearfix"
							style="background-color: rgba(0, 0, 0, 0.1);">
							<!--我的主页左侧内容开始-->
							<div class="wb_frame_left  col-md-3 column">
								<!--微博，粉丝，关注卡片div的开始-->
								<div class="WB_cardwrap S_bg2 ">
									<div class="PCD_counter">
										<div class="WB_innerwrap">
											<table class="tb_counter" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td class="S_line1"><a href="friend.jsp"> <strong
																class="W_f18">92</strong> <span class="S_txt2">关注</span>
														</a></td>
														<td class="S_line1"><a href="#"> <strong
																class="W_f18">15</strong> <span class="S_txt2">粉丝</span>
														</a></td>
														<td class="S_line1"><a href="#"> <strong
																class="W_f18">10</strong> <span class="S_txt2">微博</span>
														</a></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!--微博，粉丝，关注卡片div的结束-->
								<!--我的好友列表开始-->
								<div class="panel-group" id="panel-723651">
									<h4>我的好友</h4>
									<div class="panel panel-default">
										<div class="panel-heading friends_list">
											<a class="panel-title collapsed" data-toggle="collapse"
												data-parent="#panel-723651" href="#panel-element-287887">朋友</a>
										</div>
										<div id="panel-element-287887" class="panel-collapse collapse">
											<div class="panel-body afriend_bg">
												<a href="#" class="afriend_wrap"> <img
													src="img/touxiang.jpg" class="img-circle FL_tx" /> <span
													class="FL_name">小飞</span>
												</a>
											</div>
											<div class="panel-body afriend_bg">
												<a href="#" class="afriend_wrap"> <img
													src="img/touxiang.jpg" class="img-circle FL_tx" /> <span
													class="FL_name">自闯</span>
												</a>
											</div>
											<div class="panel-body afriend_bg">
												<a href="#" class="afriend_wrap"> <img
													src="img/touxiang.jpg" class="img-circle FL_tx" /> <span
													class="FL_name">帅兵</span>
												</a>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading friends_list">
											<a class="panel-title collapsed" data-toggle="collapse"
												data-parent="#panel-723651" href="#list2">同事</a>
										</div>
										<div id="list2" class="panel-collapse collapse">
											<div class="panel-body afriend_bg">
												<a href="#" class="afriend_wrap"> <img
													src="img/touxiang.jpg" class="img-circle FL_tx" /> <span
													class="FL_name">刘德华</span>
												</a>
											</div>
											<div class="panel-body afriend_bg">
												<a href="#" class="afriend_wrap"> <img
													src="img/touxiang.jpg" class="img-circle FL_tx" /> <span
													class="FL_name">周润发</span>
												</a>
											</div>
											<div class="panel-body afriend_bg">
												<a href="#" class="afriend_wrap"> <img
													src="img/touxiang.jpg" class="img-circle FL_tx" /> <span
													class="FL_name">黄渤</span>
												</a>
											</div>
										</div>
									</div>
								</div>
								<!--我的好友列表结束-->
							</div>
							<!--我的主页左侧内容结束-->

							<!--我的主页右侧内容开始-->
							<div class="wb_frame_right col-md-9 column">
								<!--微博内容导航栏开始-->
								<nav class="navbar navbar-default" role="navigation">
								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav">
										<li><a href="#">全部</a></li>
										<li><a href="#">原创</a></li>
										<li><a href="#">图片</a></li>
										<li><a href="#">标签</a></li>
										<li><a href="#">音乐</a></li>
										<li><a href="#">文章</a></li>
									</ul>
									<form class="navbar-form navbar-left" role="search"
										style="margin-left: 30px;">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="搜索我的微博" />
										</div>
										<button type="submit" class="btn btn-default">搜索</button>
									</form>

								</div>
								</nav>
								<!--微博内容导航栏结束-->
								<!--微博内容开始-->
								<c:if test="${requestScope.list!=null}">
									<c:forEach items="${requestScope.list}" var="weibo">
										<div class="WB_content S_bg2">
											<div class="content_top row clearfix">
												<!--微博内容中头像div开始-->
												<div class="col-md-2 column">
													<a href="#"> <img src="${weibo.TOUXIANG }"
														class="content_tx img-circle" />
													</a>
												</div>
												<!--微博内容中头像div结束-->
												<!--微博发布的内容div开始-->
												<div class="col-md-10 column">
													<a href="WeiBoServlet?op=queryMyWb">
														<h5>${weibo.SENDNAME }</h5>
													</a>
													<h6>${weibo.PUBLISHTIME }</h6>
													<p>${weibo.FWDCONTENT }${weibo.CONTENT }</p>
													<img src="${weibo.IMAGE}" />
												</div>
												<!--微博发布的内容div结束-->
											</div>
											<!--微博内容评论转发div开始-->
											<div class="content_bottom">
												<ul class="nav nav-pills WB_row_line">
													<li class="col" style="width: 175px; text-align: center;">
														<a id="test" href="WeiBoServlet?op=collect&weiboid=${weibo.WEIBOID }"> <span
															class="glyphicon glyphicon-star-empty"></span>&nbsp;<span>${weibo.COLLECTNUM }</span></a>
													</li>
													<li class="col" style="width: 175px; text-align: center;">
														<a href="#"><span
															class="glyphicon glyphicon-new-window"></span> &nbsp;<span>${weibo.FORWARDNUM }</span></a>
													</li>
													<li class="col" style="width: 170px; text-align: center;">
														<a href="WeiBoServlet?op=queryWbById&weiboid=${weibo.WEIBOID }&cmsuccess=no"> <span class="glyphicon glyphicon-comment"></span>
															&nbsp;<span>${weibo.COMMENTNUM }</span></a>
													</li>
													<li style="width: 170px; text-align: center;"><a
														href="WeiBoServlet?op=zan&weiboid=${weibo.WEIBOID }"> <span class="glyphicon glyphicon-thumbs-up"></span>
															&nbsp;<span>${weibo.ZANNUM }</span></a></li>
												</ul>
											</div>
											<!--微博内容评论转发div结束-->
										</div>
									</c:forEach>
								</c:if>
								<!--微博内容结束-->
							</div>
							<!--我的主页右侧内容结束-->
						</div>
						<!--ct_main div结束-->
					</div>
					<!--fm_main div结束-->
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
	<!--主div结束-->
</body>

<script type="text/javascript">
	$(function() {
		$('#userName').click(function() {

		});
	});
</script>
</html>