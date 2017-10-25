<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的微博</title>
<link rel="stylesheet" type="text/css" href="css/my_home.css?s=1" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap01.js"></script>
<script src="layer/layer.js"></script>
<style type="text/css">
.forwoarddiv {
	background-color: rgb(242, 242, 245);
	margin-left: -103px;
	width: 700px;
}
</style>

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
		//好友列表的ajax请求
		$('.myGroup').click(function() {
				var groupId = $(this).find("#groupId").val();
				$('#'+groupId).children().remove();
				$.post("WeiBoServlet?op=myHomeFriend&groupId="+ groupId,function(myHomefriendList, status) {
					$.each(myHomefriendList,function(index,friend) {
						$("#"+groupId).append("<div class='panel-body afriend_bg'><input type='checkbox' class='pull-left friend-choose'/><a href='WeiBoServlet?op=chatpage' class='afriend_wrap'> <img src='"+friend.TOUXIANG+"' class='img-circle FL_tx' /> <spanclass='FL_name'>"+ friend.FRIENDNAME+ "</span></a></div>");
						});

					});
				});
	});
	//增加好友分组监听事件
	$(function(){
		//定义变量判断点击此按钮的次数
		var cancleFlag = 0;
		//新增分组按钮的点击事件
		$("#addGroup").click(function(){
			cancleFlag=cancleFlag+1;
			//为单数时就添加添加分组div，双数则清除此分组div
			if ((cancleFlag%2)!=0) {
				$("#myFriendList").append("<div id='addGroupDiv' style='padding-top: 5px;'><input id='addGroupName' type='text' style='height: 32px;'/><button id='groupConfirmBtn' type='button' class='btn btn-info pull-right'>确认</button></div>");	
			}else{
				$("#addGroupDiv").remove();
			}
			
			//新增分组确认按钮点击事件
			$("#myFriendList").find("button").on('click', function(){ 
				var newGroupName=$("#myFriendList").find("#addGroupName").val();
				if(newGroupName==""){
					alert("请输入分组名称");
				}else{
					alert("添加成功");
					location.href="WeiBoServlet?op=queryMyWb&addGroup=yes&groupName="+newGroupName;
				}
			});
		});
	});
</script>
</head>

<body style="background-color: rgb(94, 122, 161);">
	<!--顶部导航栏开始-->
	<div id="header">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-9 column">
					<a href="WeiBoServlet?op=homepage"><img src="img/logo.PNG" /></a>
					<input type="text" class="search-input" placeholder="看不完的新鲜事" />
				</div>

				<div class="col-md-3 column">
					<ul class="nav nav-tabs"
						style="position: absolute; display: inline;">
						<li class="active"><a href="WeiBoServlet?op=homepage">首页</a></li>
						<li><a href="#">简介</a></li>
						<li><a href="WeiBoServlet?op=chatpage">信息</a></li>
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
								<img id="touxiangimg" alt="140x140"
									src="${requestScope.myInfo.TOUXIANG }" title="换个头像试试？" width="120px" class="img-circle" /> <a
									id="userName" href="W_UserInfoServlet?op=getUserInfo"><h4
										id="niCheng">${requestScope.myInfo.NICKNAME }</h4></a>
								<h5>一句话介绍下你自己吧,让别人更了解你</h5>
							</div>
							<!--封面div结束-->
							

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
														<td class="S_line1"><a href="W_UserInfoServlet?op=point"> <strong
																class="W_f18">92</strong> <span class="S_txt2">关注</span>
														</a></td>
														<td class="S_line1"><a href="W_UserInfoServlet?op=fans"> <strong
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
								<div class="panel-group" id="myFriendList">
										<h4>
											我的好友
											<input type="checkbox" class="chooseAll" style="margin-left: 50px;"/>							
											<a id="edit" class="glyphicon glyphicon-pencil deal" ></a>
											<a id="delete" class="glyphicon glyphicon-trash deal" ></a>
											<a id="addGroup" class="glyphicon glyphicon-plus pull-right deal"></a>
										</h4>
									
									<c:if test="${requestScope.groupList!=null}">
										<c:forEach items="${requestScope.groupList}" var="group">
											<div class="panel panel-default myGroup">

												<div class="panel-heading friends_list">
													<input type="checkbox" class="pull-left group-choose"/>
													<input id="groupId" type="hidden" value="${group.GROUPID }">
													<a class="panel-title collapsed" data-toggle="collapse"
														data-parent="#panel-723651" href="#${group.GROUPID }">${group.GROUPNAME }</a>
												</div>
												<div id="${group.GROUPID }" class="panel-collapse collapse"></div>

											</div>
										</c:forEach>
									</c:if>
									
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
										<li><a href="WeiBoServlet?op=queryMyWb">全部</a></li>
										<li><a
											href="WeiBoServlet?op=queryMyWb&queryWbBy=type&typeId=3">明星</a></li>
										<li><a
											href="WeiBoServlet?op=queryMyWb&queryWbBy=type&typeId=5">美女</a></li>
										<li><a
											href="WeiBoServlet?op=queryMyWb&queryWbBy=type&typeId=6">动漫</a></li>
										<li class="dropdown"><a href="#" data-toggle="dropdown"
											class="dropdown-toggle">更多<strong class="caret"></strong></a>
											<ul class="dropdown-menu">
												<li><a
													href="WeiBoServlet?op=queryMyWb&queryWbBy=type&typeId=7">社会</a></li>
												<li><a
													href="WeiBoServlet?op=queryMyWb&queryWbBy=type&typeId=4">情感</a></li>
												<li><a
													href="WeiBoServlet?op=queryMyWb&queryWbBy=type&typeId=10">时尚</a></li>
												<li><a
													href="WeiBoServlet?op=queryMyWb&queryWbBy=type&typeId=9">新鲜事</a></li>
											</ul></li>
									</ul>
									<form class="navbar-form navbar-left" role="search"
										style="margin-left: 25px;" method="post"
										action="WeiBoServlet?op=queryMyWb&queryWbBy=word">
										<div class="form-group">
											<input name="serchContent" type="text" class="form-control"
												placeholder="搜索我的微博" />
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
												<div class="col-md-1 column">
													<a href="#"> <img src="${weibo.TOUXIANG }"
														class="content_tx img-circle" />
													</a>
												</div>
												<!--微博内容中头像div结束-->
												<!--微博发布的内容div开始-->
												<div class="col-md-11 column" style="padding-left: 40px;">
													<a href="WeiBoServlet?op=queryMyWb">
														<h5>${weibo.SENDNAME }</h5>
													</a>
													<h6>${weibo.PUBLISHTIME }</h6>
													<p>${weibo.CONTENT }</p>
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
																<img class="myImg" src="${weibo.FORWARDIMG}"
																	width="500px " />
															</div>
														</div>
													</c:if>
												</div>
												<!--微博发布的内容div结束-->
											</div>
											<!--微博内容评论转发div开始-->
											<div class="content_bottom">
												<ul class="nav nav-pills WB_row_line">
													<li class="col" style="width: 175px; text-align: center;">
														<a class="collectA"> <input class="ajaxWbId"
															type="hidden" value="${weibo.WEIBOID }"> <span
															class="glyphicon glyphicon-star-empty"> <span
																class="collectNumSpan">${weibo.COLLECTNUM }</span></a>
													</li>
													<li class="col" style="width: 175px; text-align: center;">
														<a><span class="glyphicon glyphicon-new-window"></span>
															&nbsp;<span>${weibo.FORWARDNUM }</span></a>
													</li>
													<li class="col" style="width: 170px; text-align: center;">
														<a
														href="WeiBoServlet?op=queryWbById&weiboid=${weibo.WEIBOID }&cmsuccess=no">
															<span class="glyphicon glyphicon-comment"></span> &nbsp;<span>${weibo.COMMENTNUM }</span>
													</a>
													</li>
													<li style="width: 170px; text-align: center;"><a
														class="zanA"> <input class="ajaxWbId" type="hidden"
															value="${weibo.WEIBOID }"> <span
															class="glyphicon glyphicon-thumbs-up"></span> &nbsp;<span
															class="zanNumSpan">${weibo.ZANNUM }</span>
													</a></li>
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
		$("#touxiangimg").click(function(){
			layer.open({
				type: 1,
				area: ['', ''],
				shadeClose: true, //点击遮罩关闭
				content: '<iframe src="touxiangupload.jsp" width="100%" height="100%"></iframe>'
			});
		})
	});
</script>
</html>