<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
		<script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			body{ background-color: rgba(0,0,0,0); }
			.top{
				margin-top: 15px;
				position: absolute;
				background-color: white;
				border-radius: 5px;
				height: 40px;
				width: 100%;
			}
			.top span{top: 5px;}
			.search-icon{
				background-image: url(img/Search2.png);
				background-repeat: no-repeat;
				background-position: right center;
			}
			.show{
				position: absolute;
				margin-top: 70px;
				width: 100%;
			}
			.forwoarddiv{
			background-color: rgb(242,242,245);
			margin-left:-100px;
			width:800px;
			}
		</style>
	</head>
	<body>
		<div class="top">
			<span class="content">
				<h4><strong>赞过的微博</strong><small>（共1条）</small>
				</h4>
			</span>
		</div>
		<div class="show">
					<!--微博内容开始-->
	<c:if test="${requestScope.zanlist!=null}">
		<c:forEach items="${requestScope.zanlist}" var="weibo">
			<div class="WB_content S_bg2 " style="background-color: white; margin-top: 15px; ">
			<div class="container ">
				<div class="content_top row clearfix ">
					<!--微博内容中头像div开始-->
					<div style=" display: inline; float: left; ">
						<a href="# ">
							<img id=" " src="${weibo.TOUXIANG}" width="100px " height="100px " class="touxiang img-circle " />
						</a>
					</div>
					<!--微博内容中头像div结束-->
					<!--微博发布的内容div开始-->
					<div  style=" display: inline;float: left; width: 550px; ">
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
					<div style="width:550px;margin-left:100px;margin-top:20px">
					<h5>&nbsp;</h5>
					<h5>@${weibo.OLDNAME}<small>&nbsp;&nbsp;&nbsp;${weibo.OLDTIME}</small></small></h5>					
					<p>${weibo.FWDCONTENT}</p>
					<img class="myImg" src="${weibo.FORWARDIMG}" width="500px " />
					</div>
					</div>
				</c:if>
						
					</div>
					<!--微博发布的内容div结束-->
				</div>
					<div class="content_bottom">
												<ul class="nav nav-pills WB_row_line" style="margin-left:35px">
													<li class="col" style="width: 150px; text-align: center;">
														<a id="test" href="WeiBoServlet?op=collect&weiboid=${weibo.WEIBOID }&flag=1"> <span
															class="glyphicon glyphicon-star-empty"></span>&nbsp;<span>${weibo.COLLECTNUM }</span></a>
													</li>
													<li class="col" style="width: 150px; text-align: center;">
														 
														<a href="" class="forward" data-toggle="modal" ><span
															class="glyphicon glyphicon-new-window"></span> &nbsp;<span>${weibo.FORWARDNUM }</span>
															<input class="weiboid" type="hidden" value="${weibo.WEIBOID }">
															</a>
													</li>
													<li class="col" style="width: 150px; text-align: center;">
														<a href="WeiBoServlet?op=queryWbById&weiboid=${weibo.WEIBOID }&cmsuccess=no" target="_parent"> <span class="glyphicon glyphicon-comment"></span>
															&nbsp;<span>${weibo.COMMENTNUM}</span></a>
													</li>
													<li style="width: 150px; text-align: center;"><a
														href="WeiBoServlet?op=dianzan&weiboid=${weibo.WEIBOID }"> <span class="glyphicon glyphicon-thumbs-up"></span>
															&nbsp;<span>${weibo.ZANNUM }</span></a></li>
												</ul>
											</div>							
			</div>
				<!--微博内容评论转发div开始-->
			
				<!--微博内容评论转发div结束-->
			</div>
				</c:forEach>
								</c:if>
			</div>
			
	</body>
</html>
