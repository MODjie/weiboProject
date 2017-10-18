<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="UTF-8">
<title>个人资料</title>
<link rel="stylesheet" type="text/css" href="css/information.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<link
	href="//img.t.sinajs.cn/t5/style/css/module/list/profile_pinfo.css"
	type="text/css" rel="stylesheet">
<script src="js/birth.js" type="text/javascript" charset="utf-8"></script>
<!--所在地样式 -->
<script type="text/javascript"
	src="http://lib.h-ui.net/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.provincesCity.js"></script>
<script type="text/javascript" src="js/provincesData.js"></script>
<script type="text/javascript">
	/*调用插件*/
	$(function() {
		$("#province").ProvinceCity();
	});
</script>
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
								<a href="#"><img alt="140x140" src="img/touxiang.jpg"
									class="img-circle" /></a>
								<h4 id="niCheng">${requestScope.nickname}</h4>
								<h5>一句话介绍下你自己吧,让别人更了解你</h5>
							</div>
							<!--封面div结束-->
							<!--封面导航 div开始-->
							<div class="col-md-12 column PCD_tab S_bg2">
								<div class="tab_wrap">
									<table class="tb_tab" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td><a href="my_home.jsp">我的主页</a></td>
												<td><a href="photo.jsp">我的相册</a></td>
												<td><a href="information.jsp">管理中心</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!--封面导航 div结束-->
							<!-- 所有基本信息 -->

							<div class=" col-md-12 column info_main">
								<form action="W_UserInfoServlet?op=updateuserinfo" method="post">
									<div class="panel panel-primary">
										<div class="panel-header">基本信息</div>
										<div class="panel-body background">

											<!-- 基本信息 -->
											<div>
												<ul>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>登&nbsp;&nbsp;录&nbsp;&nbsp;名:</label>
															</div>
															<div class="col-md-10 ">
																<label id="username" name="username" value="">${requestScope.username}</label>
															</div>
														</div>
													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
															</div>
															<div class="col-md-10 ">
																<input type="text" id="nickname" name="nickname"
																	value="${userinfo.NICKNAME}" class="in_text" />
															</div>
														</div>

													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>真实姓名:</label>
															</div>
															<div class="col-md-10 ">
																<input type="text" id="realname" name="realname"
																	value="${userinfo.REALNAME}" class="in_text" />
															</div>
														</div>
													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
															</div>
															<div class="col-md-10 ">
																<input name="sex" type="radio" group="sex" value="男">男
																<input name="sex" type="radio" group="sex" value="女">女
															</div>
														</div>
													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>所&nbsp;在&nbsp;地:</label>
															</div>
															<div id="province"></div>
														</div>
													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日:</label>
															</div>
															<div class="col-md-10 ">
																<input type="hidden" id="birth"> <input
																	type="text" id="year" value="" class="in_text" />年 <input
																	type="text" id="month" value="" class="in_text" />月 <input
																	type="text" id="day" value="" class="in_text" />日
																<form name="reg_testdate">
																	<select name="YYYY" onchange="YYYYDD(this.value)">
																		<option value=""> 年</option>
																	</select> <select name="MM" onchange="MMDD(this.value)">
																		<option value=""> 月</option>
																	</select> <select name="DD">
																		<option value=""> 日</option>
																	</select>
																</form>
															</div>
														</div>
													</li>
													<p class="lh-30"></p>
													<!--描述：联系信息-->
													
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q:</label>
															</div>
															<div class="col-md-10 ">
																<input type="text" id="qq" name="qq"
																	value="${userinfo.QQ}" class="in_text" />
															</div>
														</div>
													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
															</div>
															<div class="col-md-10 ">
																<input type="text" id="email" name="email"
																	value="${userinfo.EMAIL}" class="in_text" />
															</div>
														</div>
													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>联系电话:</label>
															</div>
															<div class="col-md-10 ">
																<input type="text" id="phone" name="phone"
																	value="${userinfo.PHONENUM}" class="in_text" />
															</div>
														</div>
													</li>
													<p class="lh-30"></p>
													<li>
														<div class="col-md-12 column">
															<div class="col-md-2 ">
																<label>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介:</label>
															</div>
															<div class="col-md-10 ">
																<textarea rows="3" cols="30" id="remark" name="remark"
																	value="${userinfo.REMARK}"></textarea>
															</div>
														</div>
													</li>

												</ul>
												<p class="lh-30"></p>
												<!--描述：联系信息-->
												<div style="text-align: center; padding-top: 20px">
													<button type="submit" class="btn btn-success btn-sm"
														id="infobtn">按钮</button>
												</div>

											</div>
										</div>
									</div>
									<!-- 基本信息 -->
								</form>
							</div>
							<!-- 所有基本信息 -->
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