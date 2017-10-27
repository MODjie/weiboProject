<%@page import="com.qzz.weibo.util.DataUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">  
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">  
<META HTTP-EQUIV="expires" CONTENT="0">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="css/regiter2.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
<style type="text/css">
#serach {
				margin: 10px;
				width: 400px;
				height: 40px;
			}
			#sousuo{
				background-color: rgba(0,0,0,0);
				border: none;
				position: absolute;
				margin-left:-52px ;
				top: 10px;
				height: 40px;
				width: 40px;
				background-image: url(img/search.png);
			}
			#header {
				position: fixed;
				width: 100%;
				background-color: rgb(246, 251, 253);
				z-index: 5;
			}
</style>

<script type="text/javascript">
	var sends = {
		checked : 1,
		send : function() {
			var numbers = /^1\d{10}$/;
			var val = $('#phone').val(); //获取输入手机号码
			if ($('.div-phone').find('span').length == 0
					&& $('.div-phone a').attr('class') == 'send1') {
				if (!numbers.test(val) || val.length == 0) {
					return false;
				}
			}
			if (numbers.test(val)) {
				var time = 30;
				$('.div-phone span').remove();
				function timeCountDown() {
					if (time == 0) {
						$('.div-phone a').css("color", "#0A8CD2");
						clearInterval(timer);
						$('.div-phone a').addClass('send1')
								.removeClass('send0').html("获取短信激活码");
						sends.checked = 1;
						return true;
					}
					$('.div-phone a').css("color", "#808080");
					$('.div-phone a').html(time + "S后再次发送");
					time--;
					return false;
					sends.checked = 0;
				}
				$('.div-phone a').addClass('send0').removeClass('send1');
				timeCountDown();
				var timer = setInterval(timeCountDown, 1000);
			}
		}
	}
	$(function() {
		$("#phone").blur(function() {
			$.get("LoginRegister", {
				"phone" : $("#phone").val(),
				"op" : "usname"
			}, function(data) {

				//如何从data中提取对象
				//此时从servlet返回的是json格式的字符串,如果要转换为json对象,JSON.parse()
				var array1 = JSON.parse(data);
				if(array1=="用户名不能为空"){
					$("#pname").css("color","red");
					$("#pname").attr("class","glyphicon glyphicon-remove");
				}
				else if(array1=="用户名已存在!!!"){
					$("#pname").css("color","red");
					$("#pname").attr("class","glyphicon glyphicon-remove");
				}
				else{
					$("#pname").css("color","green");
					$("#pname").attr("class","glyphicon glyphicon-ok");
				}
				$("#pname").html(array1);
			});
		});
		$("#nickname").blur(function() {
			$.get("LoginRegister", {
				"nickname" : $("#nickname").val(),
				"op" : "nickname"
			}, function(data) {

				//如何从data中提取对象
				//此时从servlet返回的是json格式的字符串,如果要转换为json对象,JSON.parse()
				var array1 = JSON.parse(data);
				
				if(array1=="昵称不能为空"){
					$("#pnickname").css("color","red");
					$("#pnickname").attr("class","glyphicon glyphicon-remove");
					$("#pnickname").html("昵称不能为空");
				}
				else if(array1=="该昵称已存在!!!"){
					$("#pnickname").css("color","red");
					$("#pnickname").attr("class","glyphicon glyphicon-remove");
					$("#pnickname").html("该昵称已存在!!!");
				}
				else{
					$("#pnickname").css("color","green");
					$("#pnickname").attr("class","glyphicon glyphicon-ok");
					$("#pnickname").html(array1);
				}
				
			});
		});
		$("#pwd").blur(function() {
			var plength = $("#pwd").val().length;
			
			if ($("#pwd").val() == "") {
				var array2 = "密码不能为空！";
				$("#ppwd").css("color","red");
				$("#ppwd").attr("class","glyphicon glyphicon-remove");
				$("#ppwd").html(array2);
			}
			else if(plength<6){
				$("#ppwd").css("color","red");
				$("#ppwd").attr("class","glyphicon glyphicon-remove");
				$("#ppwd").html("密码长度不能小于6位");
			}
			else {
				var array2 = "密码可用";
				$("#ppwd").css("color","green");
				$("#ppwd").attr("class","glyphicon glyphicon-ok");
				$("#ppwd").html(array2);
			}
		});
		$("#pwd2").blur(function() {
			if ($("#pwd2").val() == "") {
				var array3 = "密码不能为空！";
				$("#ppwd2").css("color","red");
				$("#ppwd2").attr("class","glyphicon glyphicon-remove");
				$("#ppwd2").html(array3);
			} else if ($("#pwd2").val() == $("#pwd").val()) {
				var array3 = "两次密码输入一致";
				$("#ppwd2").css("color","green");
				$("#ppwd2").attr("class","glyphicon glyphicon-ok");
				$("#ppwd2").html(array3);
			} else {
				var array3 = "两次密码输入不一致";
				$("#ppwd2").css("color","red");
				$("#ppwd2").attr("class","glyphicon glyphicon-remove");
				$("#ppwd2").html(array3);
			}
		});
		//判断验证码是否正确
		$("#number").blur(function() {
			$.get("LoginRegister", {
				"number" : $("#number").val(),
				"op" : "number"
			}, function(data) {

				//如何从data中提取对象
				//此时从servlet返回的是json格式的字符串,如果要转换为json对象,JSON.parse()
				var array1 = JSON.parse(data);
				
				if(array1=="验证码不能为空"){
					$("#pnumber").css("color","red");
					$("#pnumber").attr("class","glyphicon glyphicon-remove");
					$("#pnumber").html(array1);
				}
				else if(array1=="验证码输入错误"){
					$("#pnumber").css("color","red");
					$("#pnumber").attr("class","glyphicon glyphicon-remove");
					$("#pnumber").html(array1);
				}
				else{
					$("#pnumber").css("color","green");
					$("#pnumber").attr("class","glyphicon glyphicon-ok");
					$("#pnumber").html(array1);
				}
				
			});
		});
		
	});
</script>
<script type="text/javascript">
	function check(){
		var text1 = document.getElementById("phone").value;
		var text2 = document.getElementById("pwd").value;
		var text3 = document.getElementById("pwd2").value;
		var obj1 = document.getElementById("pname"); 
		var number = document.getElementById("number").value; 
		var obj2 = document.getElementById("ppwd2");
		var ppwd =document.getElementById("ppwd");//密码提示
		var pnickname = document.getElementById("pnickname");//昵称提示
		var pnumber = document.getElementById("pnumber");//验证码提示
		var ch1=document.getElementById("xpxy").checked
		
		if(text1==""){
			alert("用户名不能为空!");
			return false;
		}else if(obj1.innerHTML=="用户名已存在!!!"){
			alert("用户名已存在!!!");
			return false;
		}
		else if(pnickname.innerHTML=="昵称不能为空"){
			alert("昵称不能为空");
			return false;
		}
		else if(pnickname.innerHTML=="该昵称已存在!!!"){
			alert("该昵称已存在!!!");
			return false;
		}else if(text2==""){
			alert("密码不能为空!");
			return false;
		}
		else if(ppwd.innerHTML=="密码长度不能小于6位"){
			alert("密码长度不能小于6位");
			return false;
		}
		
		else if(text3==""){
			alert("请再次输入密码!");
			return false;
		}else if(obj2.innerHTML=="两次密码输入不一致"){
			alert("两次密码输入不一致!");
			return false;
		}
		else if(number==""){
			alert("验证码不能为空");
			return false;
		}
		else if(pnumber.innerHTML=="验证码输入错误"){
			alert("验证码输入错误");
			return false;
		}
		else if(ch1==false){
			alert("请阅读并同意协议");
			return false;
		}else {
			return true;
		}
		
	}
</script>


</head>

<body class="login_bj">

	<div class="zhuce_body">
		<!--头部logo以及导航栏开始-->
		<div id="header">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-9 column">
						<img src="img/logo.PNG" />
						<input id="serach" type="search" placeholder="看不完的新鲜事">
						<input type="button" id="sousuo"  value=""/>
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
		<!--头部logo以及导航栏结束-->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
		<div class="zhuce_kong">
			<div class="zc" >
				<div class="bj_bai" style=" padding-left:100px;margin-left:-70px;margin-top:90px; border-radius:15px;">
					<h3>欢迎注册</h3>
					<form onsubmit="return check()"  action="LoginRegister" method="post">
						<div style="display: flex; height: 40px;">
							<input name="phone" type="text" class="kuang_txt phone"
								id="phone" placeholder="用户名">
							<p id="pname"></p>
						</div>
						<div style="display: flex; height: 40px;">
							<input name="nickname" type="text" class="kuang_txt phone"
								id="nickname" placeholder="昵称">
							<p id="pnickname"></p>
						</div>
						<div style="display: flex; height: 40px;">
							<input name="pwd" type="password" class="kuang_txt possword"
								id="pwd" placeholder="请输入密码">
							<p id="ppwd"></p>
						</div>
						<div style="display: flex; height: 40px;">
							<input name="" type="password" class="kuang_txt possword"
								id="pwd2" placeholder="再输一次">
							<p id="ppwd2"></p>
						</div>
						<!-- 图片验证码 -->
						<div class="div-phone">
						<input name="number" style="width:130px" type="text" class="kuang_txt phone"
								id="number" placeholder="请输入验证码">
							<img alt="code..." name="randImage" id="randImage" src="image.jsp"
				width="70" height="30" border="1" align="absmiddle"> <input
				type="button" onclick="loadimage()"
				style="background-image:URL(images/refresh.png);position:absolute;margin-top:7px; width: 30px; height:30px ;">
				<p id="pnumber" style="margin-left:30px"></p>
						</div>
						<div>
							<input name="" type="checkbox" id="xpxy" checked="checked" value=""><span>已阅读并同意<a
								href="#" target="_blank"><span class="lan">《小胖微博使用协议》</span></a>
							</span>
						</div>
						<input type="hidden" name="op" value="regst"> <input
							name="注册" type="submit" class="btn_zhuce" value="立即注册">
					</form>
				</div>
				
			</div>
			
		</div>
				</div>
				<div class="col-md-4 column">
		</div>
	</div>
</div>
		

	</div>
<script type="text/javascript">
function loadimage() {
	document.getElementById("randImage").src = "image.jsp?" + Math.random();
}
</script>
</body>

</html>