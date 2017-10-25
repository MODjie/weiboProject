<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的微博</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/search.js"></script>
<link rel="stylesheet" type="text/css" href="css/friend.css" />

</head>

<body style="background-color: rgb(94, 122, 161);">
	<!--顶部导航栏开始-->
	<div id="header">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-9 column">
					<img src="img/logo.PNG" /> <input type="text" class="search-input"
						placeholder="看不完的新鲜事" />
				</div>

				<div class="col-md-3 column">
					<ul class="nav nav-tabs"
						style="position: absolute; display: inline;">
						<li class="active"><a href="#">首页</a></li>
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
								<a href="WeiBoServlet?op=queryMyWb"><img alt="140x140"
									src="${requestScope.myInfo.TOUXIANG }" class="img-circle" /></a> <a
									id="userName" href="W_UserInfoServlet?op=getUserInfo">
									<h4 id="niCheng">${requestScope.myInfo.NICKNAME }</h4>
								</a>
								<h5>一句话介绍下你自己吧,让别人更了解你</h5>
							</div>
							<!--封面div结束-->
							<div class="col-md-12 column friend_block">
								<div class="panel panel-danger">
									<div class="panel-header">
										全部关注 <label></label>
									</div>
									<div class="panel-body">
										<div class="pull-right">
											<input type="text" placeholder="请输入昵称"> <input
												type="button" value="搜索" class="sbttn">
										</div>
										<br />
										<hr />
										<div style="height: 20px;"></div>

										<div class="row clearfix ">
											<ul>
												<div class="col-md-6 column point-left">
													<c:if test="${requestScope.myPointerListLeft!=null}">

														<c:forEach items="${requestScope.myPointerListLeft}"
															var="pointer">

															<li>
																<div class="col-md-12 column">
																	<div class="col-md-2 column">
																		<img src="${pointer.TOUXIANG }"
																			style="height: 80px; margin-left: -20px" />
																	</div>
																	<div class="col-md-10 column">
																		<blockquote>
																			<p>${pointer.NICKNAME }</p>
																			<small>${pointer.CITY1 } <br> <cite>${pointer.REMARK }</cite></small>
																		</blockquote>
																	</div>
																</div>

															</li>

														</c:forEach>
													</c:if>
												</div>
												<div class="col-md-6 column point-right">
													<c:if test="${requestScope.myPointerListRight!=null}">
														<c:forEach items="${requestScope.myPointerListRight}"
															var="pointer">
															<li class="point-right">
																<div class="col-md-12 column">
																	<div class="col-md-2 column">
																		<img src="${pointer.TOUXIANG }"
																			style="height: 70px; margin-left: -20px" />
																	</div>
																	<div class="col-md-10 column">
																		<blockquote>
																			<p>${pointer.NICKNAME }</p>
																			<small>${pointer.CITY1 } <br> <cite>${pointer.REMARK }</cite></small>
																		</blockquote>
																	</div>
																</div>
															</li>

														</c:forEach>
													</c:if>
												</div>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--fm_main div结束-->
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
	<!--主div结束-->
</body>

</html>