<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" target="_blank">

		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<link rel="stylesheet" href="css/visitor.css" />
			<link rel="stylesheet" type="text/css" href="css/visitorother.css" />	
		<link rel="stylesheet" type="text/css" href="css/vitorbody.css"/>
        <script src="backdrop/bodyvitor.js" type="text/javascript"></script>	
	    <meta charset="utf-8" />

  <script type="text/javascript">
     $(function(){	
    	 $(".contentid").hide();
    	 $(".contenttypeid").hide();
			$(".moreweibo").click(function(){ 
			var contetypeid=parseInt($(this).find(".contenttypeid").html());
		    var conteid=parseInt($(this).find(".contentid").html());
		    parent.location.href="firstWeiBoServlet?xra=xmoreweibo&contypeid="+contetypeid+"&conid="+conteid; 
	})
	       
})
		 
   </script>		
 
<title>Insert title here</title>
</head>
<body  class="home">
<canvas id="c" width="300" height="150"></canvas>   
      <div class="container" >             
      <div class="col-md-12 column" style="margin-top: 80px;">                                
	    <div class="row clearfix">        
					<div class="col-md-7 column" style="margin: 0px ; padding: 0px;">
						<div class="carousel slide" id="carousel-299699" data-ride="carousel" data-interval="2000">
							<div class="carousel-inner">
							<c:if test="${requestScope.hotpticture!=null}">
							<c:forEach items="${requestScope.hotpticture}" var="rs">
								<div class="item moreweibo" >
									<a href=""><img alt="" src="${rs.IMAGE}" width="700px"  height="300px"  /></a>
									
									<div class="carousel-caption">
										<h4>
								     ${rs.CONTENT}
							             </h4>
									</div>
								
								                   <div class="contentid">
                                                         ${rs.WEIBOID }  
                                                   </div>
                                                    <div class="contenttypeid">
                                                         ${rs.TYPEID }  
                                                   </div>
                                     </div>
								</c:forEach>
							</c:if>													
							</div>
							<a class="left carousel-control" href="#carousel-299699" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
							<a class="right carousel-control" href="#carousel-299699" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
							<ol class="carousel-indicators">
								<li data-slide-to="0" data-target="#carousel-299699">
								</li>
								<li data-slide-to="1" data-target="#carousel-299699" class="active">
								</li>
								<li data-slide-to="2" data-target="#carousel-299699">
								</li>
							</ol>

						</div>

						<!--中间的下面的内容开始-->
						<!--第一个开始-->
						<div class="carousel " style="margin-top: 20px;">	
							<c:if test="${requestScope.list!=null}">
                                <c:forEach items="${requestScope.list}" var="rs">											
								  <a href=""  style="text-decoration: none;">														
			                        <div class="col-md-12 moreweibo" id="zhongjianneirong"   style="height: 120px;width: 100%;margin-bottom: 15px; margin-bottom: 15px; padding-bottom: 6px; border-bottom: 1px solid #CFCFCF;">
										<div class="col-md-3" id="tupian" style="height: 120px;float: left;position: absolute;width: 40%;">
											<!-- 第一行左边图片 开始-->
											<img src="${rs.IMAGE }" width="160px" style="height: 120px;" />
											<!-- 第一行左边图片结束  -->
										</div>
										<!-- 第一行右边开始  -->
										<div class="col-md-9" style="height: 120px;float: right;width: 75%;" >
								
												<!-- 第一行右边 图片开始  -->
												<!-- 第一行右边上面的微博具体内容开始  -->
												<div class="form-group" style="height: 70px;text-align: left;line-height: 30px;">
 	
												   <div class="contentid">
                                                         ${rs.WEIBOID }  
                                                   </div>
                                                    <div class="contenttypeid">
                                                         ${rs.TYPEID }  
                                                   </div>
													<div class="panel-body content" style="border: none;">
                                                          ${rs.CONTENT }
                                                  </div>
                                                 												
												</div>
												<!-- 第一行右边上面的微博具体内容结束  -->
												<!-- 第一行右边下面的微博发布人头像、名字、时间、转发、评论、点赞开始  -->
												<div class="form-group  ffgroup" style="height:40px;line-height: 35px;">
            	

													<ul class="list-inline   "  style="float: left;display: inline-block;">
														<li ><img src="${rs.TOUXIANG }" style="border-radius:50%; overflow:hidden; width: 24px;height: 24px;" /></li>
														<li style="padding: 0px;">${rs.SENDNAME }</li>
														<li >${rs.PUBLISHTIME }</li>												
													</ul>
													<ul class="list-inline "  style="float: right;display: inline-block;">
														<li  "><a href=""> <span class="glyphicon glyphicon-new-window"></span>${rs.FORWARDNUM }</a></li>
														
														<li > <a href=""><span class="glyphicon glyphicon-comment"></span>${rs.COMMENTNUM }</a> </li>
								
														<li ><a  href=""><span class="glyphicon glyphicon-thumbs-up"></span>${rs.ZANNUM }</a></li>
														
													</ul>

												</div>

												<!-- 第一行右边下面的微博发布人头像、名字、时间、转发、评论、点赞结束  -->
										</div>
										<!-- 第一行右边边图片结束  -->
								</div>
					 </a>
                 </c:forEach>
                       </c:if>													                 
                     									 							
                           
	
                             
						</div>
					<!--第一个结束-->
					
				
					</div>
					</div>
					</div>
					</div>
					
		
					

					
</body>
</html>