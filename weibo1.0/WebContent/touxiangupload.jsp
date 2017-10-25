<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.btn-upload{position: relative; display:inline-block;height:36px; *display:inline;overflow:hidden;vertical-align:middle;cursor:pointer}
.upload-url{cursor: pointer}
.input-file{position:absolute; right:0; top:0; cursor: pointer; z-index:1; font-size:30em; *font-size:30px;opacity:0;filter: alpha(opacity=0)}
.btn-upload .input-text{ width:auto}
.form-group .upload-btn{ margin-left:-1px}
	</style>
  </head>
  
  <body>
<span class="btn-upload form-group">
 <form action="GoodsServlet" method="post" enctype="multipart/form-data">
  <input class="input-text upload-url radius" type="text" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:void();" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a>
  <input type="file" multiple name="goodsImg" class="input-file">
  <input type="submit" class="btn btn-primary radius" value="提交" >
  </form>
</span>
  </body>
</html>
