<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path1);
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/imguploadcss/dhtmlXVault.css" />

    <script language="JavaScript" type="text/javascript" src="${path}js/dhtmlXVault.js"></script>

    <script language="JavaScript" type="text/javascript">
        var vault = null;
        function doOnLoad() {
            preLoadImages();
            vault = new dhtmlXVaultObject();
            vault.setServerHandlers("${path}imgupload/UploadHandler.jsp", "${path}imgupload/GetInfoHandler.jsp", "${path}imgupload/GetIdHandler.jsp");
            vault.create("vault1");
	}

	function preLoadImages(){
		var imSrcAr = new Array("btn_add.gif","btn_clean.gif","btn_upload.gif","ico_file.png","ico_image.png","ico_sound.png","ico_video.png","ico_zip.png","pb_back.gif","pb_demoUload.gif","pb_empty.gif");
		var imAr = new Array(0);
		for(var i=0;i<imSrcAr.length;i++){
			imAr[imAr.length] = new Image();
			imAr[imAr.length-1].src = "imgs/"+imSrcAr[i];
		}
	}
    </script>

    <style>
	body {font-size:12px}
	.{font-family:arial;font-size:12px}
	h1 {cursor:hand;font-size:16px;margin-left:10px;line-height:10px}
	xmp {color:green;font-size:12px;margin:0px;font-family:courier;background-color:#e6e6fa;padding:2px}
	.hdr{
		background-color:lightgrey;
		margin-bottom:10px;
		padding-left:10px;
	}
    </style>

</head>
 
  
  <body onload="doOnLoad()">
    <div style="color:#ff0000;font-size:12px;">* 目前支持的上传格式 jpg,gif,bmp,png</div>
    <div id="vault1"></div>
    
  </body>
</html>
