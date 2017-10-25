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
	<style type="text/css">
			.content1 {
				position: absolute;
				top:250px;
				margin-left:25%;
				width: 50%;
				height: 550px;
				border-radius: 10px;
				background-color: rgba(223,228,228,0.5);
			}
			
			#infomation {
				margin-top: 20px;
			}
			
			table {
				border-collapse: collapse;
			}
			td {
				padding: 0.8em 1.5em;
			}
		</style>
<script type="text/javascript">
	/*调用插件*/
	$(function() {
		$("#province").ProvinceCity();
		var a = "fuj"
		if(a!=""){
		$("#province").find("select").eq(0).val(a);
		}
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
<div id="fm" class="col-md-12 column" style="margin-top:50px;color:white ">
								<a href="#"><img alt="100x100" src="img/touxiang.jpg"
									class="img-circle" /></a>
									<a id="userName" href="W_UserInfoServlet?op=getUserInfo">
								<h4 id="niCheng">${requestScope.nickname}</h4></a>
								
							</div>
		<center>
			<div class="content1">
				<table id="infomation" border="0" cellspacing="0" cellpadding="10px">
					<tr id="nicknametr">
						<td>昵称：</td>
						<td><input id="nickname" name="nickname" type="text" id="" value="" /></td>
						<td><span></span></td>
					</tr>
					<tr id="realnametr">
						<td>真实姓名：</td>
						<td><input id="realname" name="realname" type="text" id="" value="" /></td>
						<td><span></span></td>
					</tr>
					<tr id="sextr">
						<td>性别：</td>
						<td>
							<input type="radio" name="sex" value="male" checked="checked">男
							<input type="radio" name="sex" value="female">女
						</td>
						<td><span></span></td>
					</tr>
					<tr id="locationtr">
						<td>所在地：</td>
						<td id="province"></td>
						<td><span></span></td>
					</tr>
					<tr id="birthtr">
						<td>生日：</td>
						<td><input name="birth" type="date" id="" value="" /></td>
						<td><span></span></td>
					</tr>
					<tr id="qqtr">
						<td>QQ：</td>
						<td><input name="qq" type="text" id="" value="" /></td>
						<td><span></span></td>
					</tr>
					<tr id="emailtr">
						<td>邮箱：</td>
						<td><input name="email" type="email" id="" value="" /></td>
						<td><span></span></td>
					</tr>
					<tr id="phonetr">
						<td>电话：</td>
						<td><input name="phone" type="text" id="" value="" /></td>
						<td><span></span></td>
					</tr>
					<tr id="remarktr">
						<td>简介：</td>
						<td><textarea name="remark" rows="5" cols="25"style="resize: none;"></textarea></td>
						<td><span></span></td>
					</tr>
				</table>
				<input type="button" class="btn-primary"style=" border-radius:10px;width: 100px;" id="" value="确定修改" />
			</div>
			
		</center>


	<script type="text/javascript">
		$(function(){
			
			$("#receive").click(function(){
				var province=$("#province").find("select").eq(0).val();
				var city1=$("#province").find("select").eq(1).val();
				var city2=$("#province").find("select").eq(2).val();
				
				alert(province+","+city1+","+city2);
			})
		})
	</script>
</body>
</html>