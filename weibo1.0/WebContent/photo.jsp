<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的微博</title>
		<link rel="stylesheet" type="text/css" href="css/photo.css" />
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
		<script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	</head>

	<body style="background-color: rgb(94,122,161);">
		<!--顶部导航栏开始-->
		<div id="header">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-9 column">
						<a href="homepage.jsp"><img src="img/logo.PNG" /></a>
						<input type="text" class="search-input" placeholder="看不完的新鲜事" />
					</div>

					<div class="col-md-3 column">
						<ul class="nav nav-tabs" style="position:absolute ;display: inline;">
							<li class="active">
								<a href="#">首页</a>
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
		<!--顶部导航栏结束-->
		<!--主div开始-->
		<div class="container">
			<div class="row clearfix main">
				<div class="col-md-12 column">
					<div class="row clearfix">
						<div class="col-md-1 column">
						</div>
						<!--fm_main div开始-->
						<div id="fm_main" class="col-md-10 column">
							<div class="row clearfix">
								<!--封面div开始-->
								<div id="fm" class="col-md-12 column">
									<a href="#"><img alt="140x140" src="img/touxiang.jpg" class="img-circle" /></a>
									<h4 id="niCheng">cleanEach</h4>
									<h5>一句话介绍下你自己吧,让别人更了解你</h5>
								</div>
								<!--封面div结束-->
								<!--封面导航 div开始-->
								<div class="col-md-12 column PCD_tab S_bg2">
									<div class="tab_wrap">
										<table class="tb_tab" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<td>
														<a href="my_home.jsp">我的主页</a>
													</td>
													<td>
														<a href="photo.jsp">我的相册</a>
													</td>
													<td>
														<a href="#">管理中心</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--封面导航 div结束-->		
								<!--相册导航 div开始-->
								<div class="photo_menu col-md-12 column">
									<ul>
										<li><a href="#">照片墙</a></li>
										<li class="photo_li"><a href="#">我赞过的</a></li>
										<li class="photo_li"><a href="#">相册专辑</a></li>
										<li id="shangChuan"><a href="#">上传</a></li>
									</ul>
									<br />
									<h6 id="photoTime">2017年09月</h6>
									
									<div class="photo_block">
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
									</div>
									<h6 id="photoTime">2017年10月</h6>
									<div class="photo_block">
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
										<a href="#"><img class="photo_img img-thumbnail" src="img/touxiang.jpg"/></a>
									</div>
								</div>
								<!--相册导航 div结束-->
							</div>
							
						</div>
						<!--fm_main div结束-->
						<div class="col-md-1 column">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--主div结束-->
	</body>

</html>