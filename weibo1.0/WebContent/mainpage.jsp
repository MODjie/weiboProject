<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <base target="_blank"> -->
<title></title>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
<style type="text/css">
/*发布区域*/
.publish {
	margin-top: 15px;
	color: rgb(26, 127, 181);
	background-color: white;
	border-radius: 5px;
}
/*#title {
				margin: 10px;
			}*/
.type {
	background-color: white;
	margin-top: 15px;
	border-radius: 5px;
}

textarea {
	color: black;
	width: 90%;
	height: 100px;
	margin: 10px;
	margin-bottom: 5px;
	resize: none;
}

.xuanxiang {
	margin-bottom: 10px;
	text-decoration: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	outline: none;
}

.nav {
	float: left;
}

.nav-show {
	float: left;
}

select {
	border: none;
	outline: none;
}
/*下面是显示区域*/
.show {
	margin-top: 15px;
}

.touxiang {
	padding: 10px;
}

a:hover {
	color: orange;
}

.forwoarddiv {
	background-color: rgb(242, 242, 245);
	margin-left: -100px;
	width: 800px;
}
/* 未访问的链接 */
.content_bottom ul li a:link {
	color: rgb(128, 128, 128)
}

.content_bottom ul li a:visited {
	color: rgb(128, 128, 128)
} /* 已访问的链接 */
.content_bottom ul li a:hover {
	color: orange
} /* 鼠标移动到链接上 */
.content_bottom ul li a:active {
	color: #0000FF
} /* 选定的链接 */
/*设置收藏与赞的鼠标为手*/
.collectA {
	cursor: pointer;
}

.zanA {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		window.onload = function() {
			var height = $("body").height() + 50;//这个是jquery代码 
			$('#maincontent', window.parent.document).css("height",
					height + "px");
		};
		/***
		 * 点击图片时，在其父窗口弹出展示图片完整信息的层
		 */
		$(".myImg").click(function() {
			//禁用滚动条
			$(window.parent.document.body).css({
				"overflow-y" : "hidden"
			});
			$('#myModal', window.parent.document).css("display", "block");
			var src1 = $(this)[0].src;

			$('#img01', window.parent.document).attr('src', src1);
			$('#caption', window.parent.document).html($(this).alt);
		});
		$(".close", window.parent.document).click(function() {
			$('#myModal', window.parent.document).css("display", "none");
			//启用滚动条
			$(window.parent.document.body).css({
				"overflow-y" : "auto"
			});
		})

		/***
		 * 点击转发时，在其父窗口弹出展示转发窗口
		 */
		$(".forward").click(function() {
			//禁用滚动条
			var id = $(this).find(".weiboid").val();
			//把该条微博的编号传给父页面
			parent.forward(id);
			$(window.parent.document.body).css({
				"overflow-y" : "hidden"
			});
			$('#myModal1', window.parent.document).css("display", "block");
		});
		$(".close", window.parent.document).click(function() {
			$('#myModal1', window.parent.document).css("display", "none");
			//启用滚动条
			$(window.parent.document.body).css({
				"overflow-y" : "auto"
			});
		})

		//点击转发按钮，使父页面弹出遮罩层

	})
</script>
<!--ajax刷新点赞和收藏-->
<script type="text/javascript">
	$(function() {
		//修改收藏标签与点赞标签的颜色
		setInterval(function() {
			$('.collectNumSpan').each(function(index) {
				if ($(this).html() == 1) {
					$(this).parent().css("color", "orangered");
				}
				if ($(this).html() == 0) {
					$(this).parent().css("color", "#337A7A");
				}
			});

			$('.zanNumSpan').each(function(index) {
				if ($(this).html() == 1) {
					$(this).parent().css("color", "orangered");
				}
				if ($(this).html() == 0) {
					$(this).parent().css("color", "#337A7A");
				}
			});
		});

		//收藏按钮的点击事件
		$('.collectA').click(
				function() {
					var a = $(this);
					weiboid = $(this).find(".ajaxWbId").val();
					$.post("WeiBoServlet?op=collect&weiboid=" + weiboid,
							function(collectNum, status) {
								a.find(".collectNumSpan").html(collectNum);
							});
				});

		//赞按钮的点击事件
		$('.zanA').click(
				function() {
					var a = $(this);
					weiboid = $(this).find(".ajaxWbId").val();
					$.post("WeiBoServlet?op=zan&weiboid=" + weiboid, function(
							zanNum, status) {
						a.find(".zanNumSpan").html(zanNum);
					});
				});
	});
</script>
</head>
<body
	style="background-color: rgba(0, 0, 0, 0); overflow: scroll; overflow-y: hidden; overflow-x: hidden">
	<div class="publish">
		<br /> <span id="title"> <img src="img/title.PNG" />
		</span>
		<form action="WeiBoServlet?op=publish" method="post">
			<textarea name="content" rows="" cols=""></textarea>
			<br /> <a href="${path}imgupload/uploadimg.jsp" class="xuanxiang"
				style="margin: 0 0 50px 220px;">添加图片</a> <select name="" class=""
				style="margin-left: 50px;">
				<option value="">所有人可见</option>
				<option value="">仅自己可见</option>
				<option value="">好友可见</option>
				<option value="">匿名</option>
			</select> <select name="type" class="" style="margin-left: 50px;">
				<option value="娱乐">娱乐</option>
				<option value="热门">热门</option>
				<option value="体育">体育</option>
				<option value="情感">情感</option>
				<option value="美女">美女</option>
				<option value="动漫">动漫</option>
			</select>

			<button type="submit" class="btn btn-warning">发布</button>

		</form>
	</div>
	<!--微博类型选择导航区域-->
	<!--微博内容导航栏开-->
	<div class="type">
		<!--<nav class="navbar navbar-default " role="navigation ">-->
		<div class=" navbar-collapse " id="bs-example-navbar-collapse-1 ">
			<ul class="nav navbar-nav ">
				<li class="nav-show"><a href="WeiBoServlet?op=queryAllWb">全部</a></li>
				<li class="nav-show"><a href="WeiBoServlet?op=queryAllWb&queryWbBy=type&typeId=3">明星</a></li>
				<li class="nav-show"><a href="WeiBoServlet?op=queryAllWb&queryWbBy=type&typeId=5">美女</a></li>
				<li class="nav-show"><a href="WeiBoServlet?op=queryAllWb&queryWbBy=type&typeId=6">动漫</a></li>
				<li class="dropdown nav-show" style="width:60px"><a href="#" data-toggle="dropdown"
					class="dropdown-toggle">更多<strong class="caret pull-right"></strong></a>
					<ul class="dropdown-menu" style="width:60px">
						<li><a
							href="WeiBoServlet?op=queryAllWb&queryWbBy=type&typeId=7">社会</a></li>
						<li><a
							href="WeiBoServlet?op=queryAllWb&queryWbBy=type&typeId=4">情感</a></li>
						<li><a
							href="WeiBoServlet?op=queryAllWb&queryWbBy=type&typeId=10">时尚</a></li>
						<li><a
							href="WeiBoServlet?op=queryAllWb&queryWbBy=type&typeId=9">新鲜事</a></li>
					</ul></li>
			</ul>
			<form class=" form-horizontal navbar-form navbar-left "
				role="search "
				style="margin-left: 45px; margin-top: 5px; float: left;"
				method="post" action="WeiBoServlet?op=queryMyWb&queryWbBy=word">
				<div class="form-group ">
					<input type="text " class="form-control " style="width: 250px;" />
					<input type="submit " class="btn btn-info " value="搜索 "
						style="position: absolute; width: 60px; top: 250px; left: 90%;"></input>
				</div>
			</form>

		</div>
		</nav>
		<!--微博内容导航栏结束-->
	</div>
	<!--微博显示区域开始-->

	<div class="show ">
		<!--微博内容开始-->
		<c:if test="${requestScope.list!=null}">
			<c:forEach items="${requestScope.list}" var="weibo">
				<div class="WB_content S_bg2 "
					style="background-color: white; margin-top: 15px;">
					<div class="container ">
						<div class="content_top row clearfix ">
							<!--微博内容中头像div开始-->
							<div style="display: inline; float: left;">
								<a href="# "> <img id=" " src="${weibo.TOUXIANG}"
									width="100px " height="100px " class="touxiang img-circle " />
								</a>
							</div>
							<!--微博内容中头像div结束-->
							<!--微博发布的内容div开始-->
							<div style="display: inline; float: left; width: 550px;">
								<a href="# ">
									<h5>${weibo.SENDNAME}</h5>
								</a>
								<h6>${weibo.PUBLISHTIME}</h6>
								<p>${weibo.CONTENT}</p>
								<c:if test="${weibo.ISFORWORD!='是'}">
									<img class="myImg" src="${weibo.IMAGE}" width="500px " />
								</c:if>
								<c:if test="${weibo.ISFORWORD=='是'}">
									<div class="forwoarddiv">
										<div
											style="width: 550px; margin-left: 100px; margin-top: 20px">
											<h5>&nbsp;</h5>
											<h5>
												@${weibo.OLDNAME}<small>&nbsp;&nbsp;&nbsp;${weibo.OLDTIME}</small></small>
											</h5>
											<p>${weibo.FWDCONTENT}</p>
											<img class="myImg" src="${weibo.FORWARDIMG}" width="500px " />
										</div>
									</div>
								</c:if>

							</div>
							<!--微博发布的内容div结束-->
						</div>
						<div class="content_bottom">
							<ul class="nav nav-pills WB_row_line" style="margin-left: 35px">
								<li class="col" style="width: 150px; text-align: center;">
									<a class="collectA"> <input class="ajaxWbId" type="hidden"
										value="${weibo.WEIBOID }"> <span
										class="glyphicon glyphicon-star-empty"></span>&nbsp;<span
										class="collectNumSpan">${weibo.COLLECTNUM }</span>
								</a>
								</li>
								<li class="col" style="width: 150px; text-align: center;">

									<a href="" class="forward" data-toggle="modal"><span
										class="glyphicon glyphicon-new-window"></span> &nbsp;<span>${weibo.FORWARDNUM }</span>
										<input class="weiboid" type="hidden" value="${weibo.WEIBOID }">
								</a>
								</li>
								<li class="col" style="width: 150px; text-align: center;">
									<a
									href="WeiBoServlet?op=queryWbById&weiboid=${weibo.WEIBOID }&cmsuccess=no"
									target="_parent"> <span class="glyphicon glyphicon-comment"></span>
										&nbsp;<span>${weibo.COMMENTNUM}</span></a>
								</li>
								<li style="width: 150px; text-align: center;"><a
									class="zanA"> <input class="ajaxWbId" type="hidden"
										value="${weibo.WEIBOID }"> <span
										class="glyphicon glyphicon-thumbs-up"></span> &nbsp;<span
										class="zanNumSpan">${weibo.ZANNUM }</span></a></li>
							</ul>
						</div>
					</div>
					<!--微博内容评论转发div开始-->

					<!--微博内容评论转发div结束-->
				</div>
			</c:forEach>
		</c:if>



	</div>
	<!--微博内容结束-->

	</div>

</body>

</html>