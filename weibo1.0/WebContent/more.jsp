<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/more.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<script src="backdrop/pixi.js?hd=1" type="text/javascript"></script>
<script src="backdrop/quicksketch.min.js" type="text/javascript"></script>
<script src="backdrop/introBG.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.firstconnt:hover{
	background-color: #E3E3E3;
}


.change:hover{
color: orangered;
}
			.hotresearch {
				position: fixed;				 
				border-radius: 10px;
				height: 770px;
				width: 290px;
				background-color: white;				         		 
			}
			.xracont{
				height:700px;
				width: 285px;				
				overflow-y: auto;
				overflow-x: hidden;
			    
			}
			.firstconnt div{
				margin: 0px;
				padding: 0px;
			}
			.firstconnt{				
				height: 270px;
			}
			
 .rightshoucangqu{
	height: 25px;
}
 
.rightshoucangqu ul li{
	list-style: none;
	float: right;
	height: 25px;
	width: 30%;
	text-align: center;
	line-height: 25px;
	margin-top: 15px;
	
}
.rightshoucangqu ul li a{
	width: 100%;  	
	display: inline-block;
	text-decoration: none;
	color:#889db6;
	text-align: center;
		
}	
.rightshoucangqu ul li a:hover{
	color: orangered;
}

</style>
<script type="text/javascript">
	$(function() {
		$(".weiboid").hide();
		$(".typeid").hide();
		$(".oneweiboid").hide();
		$(".onetypeid").hide();
		$(".pagetotal").hide();
		$(".hotspan").hover().css("cursor", "pointer");
		$(".change").hover().css("cursor", "pointer");
		$(".firstconnt").hover().css("cursor", "pointer");
		//search-box 设置相关话题固定
		$(window).scroll(function() {
			console.log($(window).scrollTop());
			if ($(window).scrollTop() > 250) {
				$(".hotresearch").attr("style", "margin-top:-450px");
			} else {
				$(".hotresearch").attr("style", "margin-top:0px");
			}
		});
	});
  $(function(){
	  
  
		$(".firstconnt")
				.click(
						function() {
							var conteid = parseInt($(this).find(".weiboid")
									.html());
							var contetypeid = parseInt($(this).find(".typeid")
									.html());                                                      
							parent.location.href = "WeiBoServlet?xra=xmoreweibo&contypeid="
									+ contetypeid + "&conid=" + conteid;
						})
						
		$(function(){
        //元素时网页回到顶部
       $(".change").click(function(){     
        $(".xracont").animate({scrollTop:0},100);//回到顶端
        return false;
               });
         });			

		/* $(".change").click(
				function() {
					var conteid = parseInt($(".oneweiboid").html());
					var contetypeid = parseInt($(".onetypeid").html());
					var pagetotal = parseInt($(".pagetotal").html());
					page = parseInt(Math.random() * pagetotal + 1);
					if (page > pagetotal) {
						page = page - 1;
					}
					// alert("微博id是"+conteid+"微博类型是"+contetypeid+"页数是"+page);			   
					parent.location.href = "WeiBoServlet?xra=xmoreweibo&page="
							+ page + "&contypeid=" + contetypeid + "&conid="
							+ conteid;
				}) */
				
  })

</script>
</head>
<body class="home">
	<canvas width="100%" height="100%"></canvas>
	<!--头部logo以及导航栏开始-->
	<div id="header"">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-9 column  sousuo">
					<a href="WeiBoServlet?op=homepage"><img style="height: 40px; widows: 50px;" src="img/logo.PNG" /></a> <input
						id="serach" type="search" placeholder="大家都在搜：鹿晗、关晓彤分手"> <input
						type="button" class="btnsearch" name="" id="" value="" />
				</div>
				<div class="col-md-3 column daohan3">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="WeiBoServlet?op=homepage"><span
								class="glyphicon glyphicon-home"></span>首页</a></li>
						<li><a href="regiter.html">注册</a></li>
						<li class="nav navbar-nav navbar-right"><a id="loginmain"
							href="#modal-container-580488" role="button" class="btn"
							data-toggle="modal">登录</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--头部logo以及导航栏结束-->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column" style="margin-top: 75px;">
				<div class="row clearfix">
					<!--
                	作者：offline
                	时间：2017-10-13
                	描述：左侧列表开始
               -->
					<div class="col-md-7 column"
						style="background-color: white; padding: 0px;">
						<!--第一行 -->

						<div class="col-md-2"
							style="height: 95px; background-color: white; text-align: center; line-height: 85px;">
							<!-- 第一行左边图片 开始-->
							<img src="${requestScope.detailWb.TOUXIANG }"
								style="border-radius: 50%; overflow: hidden; width: 65px; height: 65px;" />
							<!-- 第一行左边图片结束  -->
						</div>
						<!-- 第一行右边开始  -->
						<div class="col-md-10"
							style="height: 95px; background-color: rgb(255, 255, 255);">
							<div class="morename"
								style="font-weight: bolder; line-height: 30px;">
								<div style="display: inline-block;">
									<a id="nikeName" href="" style="text-decoration: none;">${requestScope.detailWb.SENDNAME }</a>
								</div>

								<div
									style="display: inline-block; margin: 0px; margin-left: 350px; background-color: white; box-shadow: 1px 1px 1px #888888; margin-top: 10px; width: 60px; text-align: center;">
									<div
										style="display: inline-block; color: orangered; font-size: x-large;">
										&#43;</div>
									<input type="button" style="background-color: white;" name=""
										id="" value="关注" />
								</div>
							</div>
							<div
								style="color: #889db6; font: 12px/18px arial; overflow: hidden; zoom: 1;">
								<span> ${requestScope.detailWb.PUBLISHTIME } &nbsp;</span>
							</div>
							<div style="margin-top: 10px;">
								${requestScope.detailWb.CONTENT }</div>
						</div>
						<!--
            	作者：offline
            	时间：2017-10-14
            	描述：中间图片区域开始
            -->
            			
						<div style="text-align: center; margin-top: 95px; padding: 10px;">
							<div style="margin-top: 20px;">
								<c:if test="${requestScope.detailWb.ISFORWORD!='是'}">
									<img src="${requestScope.detailWb.IMAGE }" width="500px"/>
								</c:if>
							</div>
						</div>
						
						<!--
            	作者：offline
            	时间：2017-10-14
            	描述：中间图片区域结束
            -->
						<div class="shoucangqu">
							<ul>
								<li><a href="#"> <span
										class="glyphicon glyphicon-star-empty"></span>&nbsp;<span>${requestScope.detailWb.COLLECTNUM }</span></a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-new-window"></span> &nbsp;<span>${requestScope.detailWb.FORWARDNUM }</span></a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-comment"></span> &nbsp;<span>${requestScope.detailWb.COMMENTNUM }</span></a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-thumbs-up"></span> &nbsp;<span>${requestScope.detailWb.ZANNUM }</span></a></li>
							</ul>

						</div>

						<!--
                	作者：offline
                	时间：2017-10-14
                	描述：评论到所有评论开始
                -->

						<div id="msgBox" style="background-color: rgb(242, 242, 245);">
							<div class="row clearfix">
								<div class="col-md-9 column">
									<textarea id="cm_area" class="teratext"
										style="width: 540px; margin-left:20px; border: 1px solid #D9D9D9;resize:none;"></textarea>
								</div>
								<div class="col-md-3 column" style="text-align:center;padding-top: 5px;padding-left: 50px">
									<p>
										<input type="hidden" id="weiboId"
											value="${requestScope.detailWb.WEIBOID }"> 
										<input id="sendBtn" type="button" value="评论"
											style="background-color: rgb(255, 192, 159);color: white;"
											title="快捷键 Ctrl+Enter" />
									</p>
								</div>
							</div>
							<div class="list" style="background-color: rgb(242, 242, 245);">
								<h3>
									<span style="background-color: rgb(242, 242, 245);">按热度</span>
								</h3>
								<ul>
									<c:if test="${requestScope.list2!=null}">
										<c:forEach items="${requestScope.list2}" var="comment">
											<li>
												<div class="userPic">
													<img src="${comment.TOUXIANG } " style="width: 50px;"/>
												</div>
												<div class="content" style="width: 580px;">
													<div class="userName row clearfix">
														<div class="col-md-2 column">
															<a href="#" style="color: orangered;"
																style="margin-left: 20px;">${comment.COMMENTNAME }</a>
														</div>
														<div class="col-md-8 column"></div>
														<div class="col-md-2 column">
															<input type="hidden" id="wbid" value="${comment.WEIBOID}">
															<input type="hidden" id="回复者"
																value="${sessionScope.username }"> <a
																class="replyA" id="modal-617802" href="#reply"
																data-toggle="modal">回复</a> <input type="hidden"
																value="${comment.COMMENTID }"> <a class="del"
																href="WeiBoServlet?op=deleteComment&commentId=${comment.COMMENTID }&cmweiboId=${comment.WEIBOID } ">删除</a>
														</div>
													</div>
													<div class="msgInfo">${comment.COMMCONTENT }</div>
													<div class="times">
														<span>${comment.COMMENTTIME }</span><a class="del"
															href="javascript:;">删除</a>
													</div>
													<!--
                    									作者：offline
                    									时间：2017-10-19
                    									描述：一级回复开始
                   									 -->

													<c:if test="${requestScope.replyList!=null}">
														<c:forEach items="${requestScope.replyList}" var="reply">
															<!-- 如果此回复中的评论编号是否与此评论相同 则显示回复-->
															<c:if test="${comment.COMMENTID==reply.COMMENTID }">
																<br />
																<div class="userPic">
																	<img src="${reply.TOUXIANG }" style="width: 50px;"/>
																</div>
																<div class="content" style="width: 510px;">
																	<div class="userName row clearfix">
																		<div class="col-md-4 column">
																			<a href="#" style="color: orangered;"
																				style="margin-left: 20px;">${reply.REPLYANAME }</a>回复<a
																				href="#" style="color: orangered;"
																				style="margin-left: 20px;">${reply.REPLYBNAME }</a>
																		</div>
																		<div class="col-md-5 column"></div>
																		<div class="col-md-2 column"
																			style="margin-left: 33px;">
																				<!-- 通过hidden传值 -->
																				<input type="hidden" id="wbid" value="${comment.WEIBOID}"> 
																				<input type="hidden" id="回复者" value="${sessionScope.username }"> 
																				
																				<a class="reply_replyA" id="modal-617802"
																				href="#reply_reply" data-toggle="modal">回复</a> 
																				
																				<input type="hidden" value="${comment.COMMENTID }">
																				<input type="hidden" value="${reply.REPLYANAME }">
																				
																				<a href="#">删除</a>
																		</div>
																	</div>
																	<div class="msgInfo">${reply.REPLYCONTENT }</div>
																	<div class="times">
																		<span>${reply.REPLYTIME }</span><a class="del"
																			href="javascript:;">删除</a>
																	</div>
																</div>
															</c:if>

														</c:forEach>
													</c:if>


													<!--
                    									作者：offline
                    									时间：2017-10-19
                    									描述：一级回复结束
                    								-->
												</div>

											</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>

						<!--
                	作者：offline
                	时间：2017-10-14
                	描述：所有评论结束
              -->
					</div>
					<div class="col-md-4 column">
									       <div class="hotresearch" >
                	<div style="width: 310px;height: 45px;">
                		<label class="control-label" style="margin:15px 0px 0px 15px;">相关话题</label>
						<span class="glyphicon glyphicon-repeat change"
								style="margin-left: 120px;">刷新</span>
                	</div>               	
                	<!--   描述：右侧中间滚动的内容开始-->     
				<div class="xracont">
				
				<c:if test="${requestScope.list3!=null }">	
				<div class="pagetotal">
				${pd.totalPage}
				</div>			
				<c:forEach items="${requestScope.list3}" var="rs">						
		                <div class="col-md-12 firstconnt" style="height: 240px;border-bottom: 1px solid #D4D4D4;">
		                	<!--      描述：第一div(包括用户头像、用户昵称、日期时间、关注字样)开始-->
		                	<div class="col-md-12"  style="height: 40px;margin: 0px ;padding: 5px;  line-height: 40px;">
								<div class="col-md-2" style="text-align: center;padding: 0px;margin: 0px;">
										<!-- 第一行左边图片 开始-->
									<img src="${rs.TOUXIANG }" style="border-radius:50%; overflow:hidden; width: 28px;height:28px;" />
										<!-- 第一行左边图片结束  -->
								</div>
								<div class="col-md-10" style="padding-left: 10px;">				    	
								   	<div class="col-md-12" style=" height: 20px;line-height: 20px;margin-top: 5px;">
					                    <span>${rs.SENDNAME}</span>					      
					                </div>
					              <div class="col-md-12" style="  color:#889db6;font:12px/18px arial;overflow:hidden;zoom:1;height: 20px;line-height: 10px;">
					              	 <span>
					                   ${rs.PUBLISHTIME}
					                </span>					            
					              </div>					    
								</div>								  
								    	
						    </div>						    
                            <!--  描述：下边内容、大图、点赞、评论、转发开始-->          
						    <div class="col-md-12" style="height:170px ;padding: 5px;">						    	
						    	<div class="col-md-12">						    		
						         <div class="" style="border: none;" >   				     
                                 ${rs.CONTENT}                     
                                  </div>
                                  <div class="weiboid"  >   
                                  ${rs.WEIBOID}                     
                                  </div><div class="typeid" >   
                                  ${rs.TYPEID}                     
                                  </div>						    							    		
						    	</div>
						    	<!--描述：用户发的图片开始-->                                 
						    	<div class="col-md-12" style="text-align: center;">
						    		<img src="${rs.IMAGE }" style="width: 200px;height: 122px;"/>
						    	</div>
						    	<div class="col-md-12">
						    		<div class="rightshoucangqu">
				                    <ul>
					               <li><a><span class="glyphicon glyphicon-new-window"></span> &nbsp;<span>${rs.ZANNUM}</span></a></li>
					               <li><a><span class="glyphicon glyphicon-comment"></span> &nbsp;<span>${rs.COMMENTNUM}</span></a></a></li>
					               <li><a><span class="glyphicon glyphicon-thumbs-up"></span> &nbsp;<span>${rs.FORWARDNUM}</span></a></a></li>
				                   </ul>
				
			                      </div>		
						    	</div>
						    	
						    </div>	
						     
	               </div>
	               </c:forEach>
				</c:if>	
	               
	              <!--	描述：右侧中间滚动的内容结束-->
	         </div>	
		
 			
	</div>

					</div>

				</div>
			</div>
		</div>
		<!-- 回复评论的弹出窗口 -->
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="modal fade" id="reply" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="replyHead">回复</h4>
								</div>
								<div class="modal-body">
									<textarea id="replyContent"
										style="width: 565px; height: 150px;"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" id="confirm">保存</button>
								</div>
							</div>

						</div>

					</div>

				</div>
			</div>
		</div>

		<!-- 回复回复的弹出窗口 -->
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="modal fade" id="reply_reply" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="reply_replyHead">回复</h4>
								</div>
								<div class="modal-body">
									<textarea id="reply_replyContent"
										style="width: 565px; height: 150px;"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary"
										id="reply_confirm">确定</button>
								</div>
							</div>

						</div>

					</div>

				</div>
			</div>
		
		</div>
		
			<!-- 模态窗口 -->
		<div class="modal fade" id="modal-container-580488" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">账号登录</h4>
					</div>
					<div class="modal-body">
						<form action="LoginRegister" method="post">
							<div id="name">
								<input type="text" id="textname" name="namet" placeholder="用户名" />
							</div>
							<div id="password">
								<input type="password" id="pwd" name="pwdt" placeholder="密码" />
							</div>
							<div id="changeuser">
								<input type="hidden" name="cu"  value="user" />
							</div>
							<div id="btn_up">
								<input type="hidden" name="op" value="logintreply" /> <input
									type="submit" id="log" value="登录" />
							</div>
							<div id="zc_wj" style="text-align: center;">
								<a class="a1" href="regiter.jsp" id="xiaomireg">注册账号</a>&nbsp;
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
</body>

<script type="text/javascript">
	var mn="<%=session.getAttribute("username")%>";
	var weiboid;
	var commentId;
	var replyerA;
	var replyerB;
	var replyContent;
	$(function() {
		//回复评论按钮的点击事件
		$(".replyA").click(function() {
			var th = $(this);
			if (mn=="null") {
				$.judgelogin(th);
			} 
			//微博编号
			weiboid = $(this).prev().prev().val();
			//评论编号
			commentId = $(this).next().val();
			//回复者
			replyerA = $(this).prev().val();
			//被回复的人
			replyerB = $(this).parent("div").prev().prev().text();
		})
		
		//删除按钮的点击事件
		$(".del").click(function(){
			var th = $(this);
			if (mn=="null") {
				$.judgelogin(th);
			} 
		})
		//回复评论之后的确定按钮点击事件
		$("#confirm").click(
				function() {
					//回复内容
					replyContent = $("#replyContent").val();
					location.href = "WeiBoServlet?op=reply&commentId="
							+ commentId + "&replyerA=" + replyerA
							+ "&replyerB=" + replyerB + "&replyContent="
							+ replyContent + "&weiboid=" + weiboid;
				});
	});

	$(function() {
		//回复评论按钮的点击事件
		$(".reply_replyA").click(function() {
			//微博编号
			
			weiboid = $(this).prev().prev().val();
			//评论编号
			commentId = $(this).next().val();
			//回复者
			replyerA = $(this).prev().val();
			//被回复的人
			replyerB = $(this).next().next().val();
			alert(replyerA+" "+replyerB);
		
		})
		
		//回复评论之后的确定按钮点击事件
		$("#reply_confirm").click(
				function() {
					//回复内容
					replyContent = $("#reply_replyContent").val();					
					location.href = "WeiBoServlet?op=reply&commentId="
							+ commentId + "&replyerA=" + replyerA
							+ "&replyerB=" + replyerB + "&replyContent="
							+ replyContent + "&weiboid=" + weiboid;
				});
	});

	//评论按钮的点击事件
	$(function() {
		$("#sendBtn")
				.click(
						function() {							
							var th = $(this);
							if (mn=="null") {
								$.judgelogin(th);
							} 
							else{
							var nikeName = $("#nikeName").text();
							var weiboId = $("#weiboId").val();
							var commentContent = $("#cm_area").val();
							location.href = "WeiBoServlet?op=queryWbById&cmsuccess=yes&nikeName="
									+ nikeName
									+ "&weiboId="
									+ weiboId
									+ "&commentContent=" + commentContent;
							}
							
						})
						
				
						
		/*判断用户是否已进行过登录*/
		$.extend({'judgelogin':function(th){			
			th.attr({
					"href" : "#modal-container-580488",
					"data-toggle" : "modal"
				});
			}});    
		
		
	});
</script>
</html>

