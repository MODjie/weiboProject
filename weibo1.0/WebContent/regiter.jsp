<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="css/regiter.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>

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

				$("#pname").html(array1);
			});
		});
		$("#pwd").blur(function() {
			if ($("#pwd").val() == "") {
				var array2 = "密码不能为空！";
				$("#ppwd").html(array2);
			} else {
				var array2 = "密码可用";
				$("#ppwd").html(array2);
			}
		});
		$("#pwd2").blur(function() {
			if ($("#pwd2").val() == "") {
				var array3 = "密码不能为空！";
				$("#ppwd2").html(array3);
			} else if ($("#pwd2").val() == $("#pwd").val()) {
				var array3 = "两次密码输入一致";
				$("#ppwd2").html(array3);
			} else {
				var array3 = "两次密码输入不一致";
				$("#ppwd2").html(array3);
			}
		});
	});
</script>
<script type="text/javascript">
	function check(){
		var text1 = document.getElementById("phone").value;
		var text2 = document.getElementById("pwd").value;
		var text3 = document.getElementById("pwd2").value;
		var obj1 = document.getElementById("pname"); 
		var obj2 = document.getElementById("ppwd2");
		var ch1=document.getElementById("xpxy").checked
		 
		if(text1==""){
			alert("用户名不能为空!");
			return false;
		}else if(obj1.innerHTML=="用户名已存在!!!"){
			alert("用户名已存在!!!");
			return false;
		}else if(text2==""){
			alert("密码不能为空!");
			return false;
		}else if(text3==""){
			alert("请再次输入密码!");
			return false;
		}else if(obj2.innerHTML=="两次密码输入不一致"){
			alert("两次密码输入不一致!");
			return false;
		}else if(ch1==false){
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
		<div class="logo">
			<a href="#"><img src="img/logo.PNG" width="114" height="54"
				border="0"></a>
		</div>
		<div class="zhuce_kong">
			<div class="zc">
				<div class="bj_bai">
					<h3>欢迎注册</h3>
					<form onsubmit="return check()"  action="LoginRegister" method="post">
						<div style="display: flex; height: 40px;">
							<input name="phone" type="text" class="kuang_txt phone"
								id="phone" placeholder="手机号">
							<p id="pname"></p>
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
						<div class="div-phone">
							<input type="text" class="infos" placeholder="请输入验证码" /> <a
								href="javascript:;" class="send1" onclick="sends.send();"
								style="text-decoration: none;">获取短信激活码</a>
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
				<div class="bj_right">
					<p>使用以下账号直接登录</p>
					<a href="#" class="zhuce_qq">QQ注册</a> <a href="#" class="zhuce_wx">微信注册</a>
					<br />
					<div id="" style="margin-top: 60px;">
						已有账号?<a href="index.html">直接登录》</a>
					</div>

				</div>

			</div>
			<P>Diyhe.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您小胖微博注册</P>
		</div>

	</div>

</body>

</html>