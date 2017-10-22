<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title>聊天</title>
<link rel="stylesheet" type="text/css" href="css/chat.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/chat-style.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script src="bootstrap-3.3.7-dist/js/bootstrap01.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	/*选中好友点击时间*/
	$(function() {
		$(".friend").click(function() {
			$(this).css("background-color", "#3C464C");
			$(this).siblings().css("background-color", "#2E3238");
		});
	});
</script>
</head>

<body>
	<div class="clearfix row">
		<div class="col-md-2"></div>
		<!--friend-body层开始-->
		<div id="friend_body" class="clearfix row col-md-8">
			<!--左侧内容开始-->
			<div id="friend-left" class="col-md-3">
				<div id="m-card">
					<!--头像和昵称显示开始-->
					<header class="row clearfix">
					<div class="col-md-3">
						<img class="touxiang" src="${requestScope.mytouxiang }"
							width="40px" height="40px" />
					</div>
					<div class="col-md-9">
						<p class="nick-name">${sessionScope.username }</p>
					</div>
					</header>
					<!--头像和昵称显示结束-->
					<!--搜索好友框开始-->
					<footer> <input class="search" type="search"
						placeholder="搜索好友" /> </footer>
					<!--搜索好友框结束-->
				</div>
				<div id="friend-list">
					<!--头像和昵称显示开始-->
					<c:if test="${requestScope.friendList!=null }">
						<c:forEach items="${requestScope.friendList }" var="friend">
							<div class="friend">
								<ul>
									<li class="row clearfix">

										<div class="list-tx col-md-3">
											<img src="${friend.TOUXIANG }" width="30px" height="30px" />
										</div>
										<div class="list-nn col-md-9">
											<p>${friend.FRIENDNAME }</p>
										</div>
									</li>
								</ul>
							</div>
						</c:forEach>
					</c:if>

				</div>

				<!--头像和昵称显示结束-->
			</div>
			<!--左侧内容结束-->
			<!--右侧内容开始-->
			<div id="friend-right" class="col-md-9">
				<!--显示聊天记录开始-->
				<div class="msg-content">
					<ul class="chat-thread">
						<li><img src="chat-img/touxiang3.gif"
							class="cotent_tx img-circle" height="50px" />Are we meeting
							today?</li>

						<li><img src="chat-img/touxiang2.gif"
							class="cotent_tx img-circle" height="50px" />yes, what time suits
							you?</li>
					</ul>
				</div>
				<!--显示聊天记录结束-->
				<!--显示发送内容开始-->
				<div class="msg-send">
					<textarea placeholder="按 Enter 发送"></textarea>
				</div>
				<!--显示发送内容结束-->
			</div>
			<!--右侧内容结束-->
		</div>
		<!--friend-body层结束-->
		<div class="col-md-2"></div>
	</div>

</body>

</html>