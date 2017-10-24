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
	
	$(function() {
		receiveName = $("#firstName").val();
		//上一个集合最后一个msg的id
		var oddLastId=0;
		var newLastId=0;
		setInterval(function(){ 
			/*Ajax请求返回聊天记录*/	
				
			$.post("WeiBoServlet?op=chatcontent&receiveName="+receiveName,function(msgList,status){
				$.each(msgList,function(index,msg){
					newLastId=msg.MESSAGEID;
				});
				showData(msgList,status);
				//当传回来的数据发生变化时，就将滚动条放在最下方
				if (oddLastId != newLastId) {
					//滚动条放在最下方
					$('.msg-content').scrollTop( $('.msg-content')[0].scrollHeight );
				}
				oddLastId = newLastId;
			});
		}, 20);
		
		/*选中好友点击事件*/
		$(".friend").click(function() {
			$(this).css("background-color", "#3C464C");
			$(this).siblings().css("background-color", "#2E3238");
			
			/*Ajax请求返回聊天记录*/
			receiveName = $(this).find("p").text();
			$.post("WeiBoServlet?op=chatcontent&receiveName="+receiveName,function(msgList,status){
				showData(msgList,status);
				//滚动条放在最下方
				$('.msg-content').scrollTop( $('.msg-content')[0].scrollHeight );
			});		
		});
		//输入框的键盘监听事件
		$("textarea").keypress(function(event) {
			var sendContent = $("textarea").val();
			if(event.keyCode==13){
				//避免enter键换行
				event.preventDefault();
				//发送添加信息请求到servlet
				$.post("WeiBoServlet?op=sendMessage&receiveName="+receiveName+"&sendContent="+sendContent,function(msgList,status){
					showData(msgList,status);
					//滚动条放在最下方
					$('.msg-content').scrollTop( $('.msg-content')[0].scrollHeight );
				});
				//清空textarea输入框
				$("textarea").val("");
			}else if(e.keyCode == 13 && event.shiftKey){
				alert(111);
                // shift+enter实现换行
                var textContent = $("textarea").val("");
		        $("textarea").val(+"\n");
		    }
		});
		
	});

	/*刷新聊天内容*/
	function showData(msgList,status){
		var hiddenName = $("#hiddenName").val();
		//每次加载时先删除原来的显示
		$(".chat-thread li").remove();
		//因为在服务器端已经返回json对象，所以这里不用使用JSON.parse
		$.each(msgList,function(index,msg){
			if (hiddenName==msg.SENDNAME) {
				$(".chat-thread").append("<li class='myself'><img src='"+ msg.TOUXIANG +"'class='cotent_tx img-circle'  height='50px'/>"+msg.CONTENT+"</li>");
			}else {
				$(".chat-thread").append("<li class='other'><img src='"+ msg.TOUXIANG +"'class='cotent_tx img-circle'  height='50px'/>"+msg.CONTENT+"</li>");
			}
			
		});
		
	}
	
</script>
</head>

<body>
	<input id="hiddenName" type="hidden" value=${sessionScope.username }>
	<input id="firstName" type="hidden" value=${requestScope.firstName }>
	<div class="main-body">
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
						
					</ul>
				</div>
				<!--显示聊天记录结束-->
				<!--显示发送内容开始-->
				<div class="msg-send">
					<textarea placeholder="按 Enter 发送  Shift + Enter换行"></textarea>
				</div>
				<!--显示发送内容结束-->
			</div>
			<!--右侧内容结束-->
		</div>
		<!--friend-body层结束-->
		<div class="col-md-2"></div>
	</div>
	</div>
</body>

</html>