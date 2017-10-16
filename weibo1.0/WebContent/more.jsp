<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css" /> 
		<link rel="stylesheet" type="text/css" href="css/more.css"/>
	   <script src="backdrop/pixi.js" type="text/javascript"></script>
       <script src="backdrop/quicksketch.min.js" type="text/javascript"></script>
       <script src="backdrop/introBG.js" type="text/javascript"></script>
		<meta charset="UTF-8">
		<title></title>
		
	</head>
	<body class="home" >	
    <canvas width="100%" height="100%"></canvas>				
	<!--头部logo以及导航栏开始-->
		<div id="header" ">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-9 column  sousuo" >
						<img style="height: 40px;widows: 50px;" src="img/logo.PNG" />
						<input id="serach" type="search" placeholder="大家都在搜：鹿晗、关晓彤分手">
						<input type="button" class="btnsearch" name="" id="" value="" />					    
					</div>
					    <div class="col-md-3 column daohan3">
                        <ul class="nav navbar-nav navbar-right">
                        	<li>
								<a href="index.html"><span class="glyphicon glyphicon-home"></span>首页</a>
							</li>
							<li>
								<a href="regiter.html">注册</a>
							</li>
							<li class="nav navbar-nav navbar-right">
								<a id="loginmain" href="#modal-container-580488" role="button" class="btn" data-toggle="modal">登录</a>
							</li>
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
             <div class="col-md-7 column" style="background-color: white; padding: 0px;">																							
						<!--第一行 -->							
							
										<div class="col-md-2"  style="height: 95px;  background-color: white; text-align: center; line-height: 85px;">
											<!-- 第一行左边图片 开始-->
											<img src="img/1.1.jpg" style="border-radius:50%; overflow:hidden; width: 65px;height:65px;" />
											<!-- 第一行左边图片结束  -->
										</div>
										<!-- 第一行右边开始  -->
										<div class="col-md-10" style="height: 95px;background-color: rgb(255,255,255); " >																									
					                       <div class="morename" style="font-weight:bolder;line-height: 30px;">
					                       	<div  style="display: inline-block;">
					                       		 <a    href=""  style="text-decoration: none;  ">edc陈冠希</a> 	
					                       	</div>
					                     
					                       <div  style="display: inline-block;margin: 0px;margin-left: 350px;background-color: white; box-shadow: 1px 1px 1px #888888; margin-top: 10px;width: 60px;text-align: center;">
					                                  <div   style="display: inline-block;color: orangered;font-size: x-large;">
					                                  	&#43;
					                                  </div>	<input type="button" style="background-color: white; " name="" id="" value="关注" />
					                        </div>
					                    </div>                        
					                     <div style="color:#889db6;font:12px/18px arial;overflow:hidden;zoom:1;">
					                     	<span>
					                     		10月05日 12:20 &nbsp;来自 iPhone客户端
					                     	</span>
					                     </div>                          
					                      <div style="margin-top: 10px;">
					                      	谢谢我自己
					                      </div>   			
                                       </div>																					
			<!--
            	作者：offline
            	时间：2017-10-14
            	描述：中间图片区域开始
            -->	  
			<div style=" text-align: center;  height: 460px;margin-top: 95px; padding: 10px;background-color: rgb(242,242,245);">
				<div style="margin-top: 20px;" >
					<img   style="width:502px ;" src="img/imagemore/cheng.jpg"/>
				</div>			 
			</div>
			
			<!--
            	作者：offline
            	时间：2017-10-14
            	描述：中间图片区域结束
            -->	  
			<div class="shoucangqu">
				<ul>
					<li><a href="#"> <span class="glyphicon glyphicon-star-empty"></span>&nbsp;<span>收藏</span></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-new-window"></span> &nbsp;<span>4524</span></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-comment"></span> &nbsp;<span>4524</span></a></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> &nbsp;<span>4524</span></a></a></li>
				</ul>
				
			</div>
			
				<!--
                	作者：offline
                	时间：2017-10-14
                	描述：评论到所有评论开始
                -->	
				
<div id="msgBox" style=" background-color: rgb(242,242,245);" >
    <form>    
    	<div>    
            <p id="face" style="position:absolute;"><img src="img/imagemore/HI.jpg" class="current" /></p>
            <textarea  class="teratext"   style="width: 580px;margin-left: 60px;border: 1px solid #D9D9D9;"></textarea>           
    	</div>
        <div class="tr">
            <p>
                <input id="sendBtn" type="button" value="评论" style="background-color: rgb(255,192,159);color: white;" title="快捷键 Ctrl+Enter" />
            </p>
        </div>
    </form>
    <div class="list" style=" background-color: rgb(242,242,245);">
        <h3><span style="background-color: rgb(242,242,245);;">按热度</span></h3>
        <ul>
            <li>

                <div class="userPic"><img src="img/imagemore/1.jpg" /></div>
                <div class="content">
                    <div class="userName"><a href="#" style="color: orangered;">伯牙绝弦</a>:</div>
                    <div class="msgInfo">下一季的中国有嘻哈的就是你了</div>
                    <div class="times"><span>07月05日 15:14</span><a class="del" href="javascript:;">删除</a></div>
                </div>

            </li>
            <li>
                <div class="userPic"><img src="img/imagemore/2.jpg" /></div>
                <div class="content">
                    <div class="userName"><a href="#" style="color: orangered;">火力全开</a>:</div>
                    <div class="msgInfo">我是歌手第五季</div>
                    <div class="times"><span>07月05日 12:20</span><a class="del" href="javascript:;">删除</a></div>

                </div>
            </li>
           
        </ul>
    </div>	
  </div>
							
				<!--
                	作者：offline
                	时间：2017-10-14
                	描述：所有评论结束
              -->							
			</div>
	   <div class="col-md-4 column" style="background-color: white;margin-left: 10px; padding-left: 0px;padding-right: 0px;">																							
		<div style="margin-left: 20px;">
			<h5 style="font-weight: bold;">相关推荐</h5>
		</div>
			
		<div style="padding: 20px;border-bottom: 1px solid #DAE0E5;" class="rightlist">
				<img alt="300x200" src="img/imagemore/6.jpg" />
						<div class="caption">
							<h3>
								Thumbnail label
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
				</div>
		</div>
					
	<div style="padding: 20px;" class="rightlist">
				<img alt="300x200" src="img/imagemore/6.jpg" />
						<div class="caption">
							<h3>
								Thumbnail label
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
				</div>
		</div>
			<div style="padding: 20px;" class="rightlist">
				<img alt="300x200" src="img/imagemore/6.jpg" />
						<div class="caption">
							<h3>
								Thumbnail label
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
				</div>
		</div>
			
			
		</div>	
			
		</div>
	</div>
</div>	

	</body>
</html>
