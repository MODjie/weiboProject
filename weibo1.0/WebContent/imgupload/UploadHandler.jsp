<%@page import="com.qzz.weibo.util.DataUtil"%>
<%@ page import="org.apache.commons.fileupload.*"  pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="com.scand.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
		+ request.getContextPath() + "/";
//String uploadFolder = path+"upload";
//String path = application.getRealPath(request.getRequestURI());
out.println(path);
//指定文件上传的目录
System.out.println(path);
String uploadFolder = request.getRealPath("/"+"\\upload");
out.println(uploadFolder);
//String uploadFolder=path+"WebContent";
out.print(uploadFolder);
// Check that we have a file upload request
boolean isMultipart = FileUpload.isMultipartContent(request);

if (!isMultipart) {

	out.println ("Use multipart form to upload a file!");

} else {

String fileId = request.getParameter("sessionId").toString().trim();
        
//创建数据工厂
FileItemFactory factory = new ProgressMonitorFileItemFactory(request, fileId);
ServletFileUpload upload = new ServletFileUpload(factory);

//从请求对象中获得要上传对象
List /* FileItem */ items = upload.parseRequest(request);

//迭代所有上传的FileItem
Iterator iter = items.iterator();
while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {
       //如果是表单对象再此处处理
    } else {
        //处理上传文件
		String fieldName = item.getFieldName();
		String fileName = item.getName();
		int i2 = fileName.lastIndexOf("\\");
		if(i2>-1) fileName = fileName.substring(i2+1);
		File dirs = new File(uploadFolder);
		if(!dirs.exists()){
		    dirs.mkdir();  
		
		}
		
		//dirs.mkdirs();
        long l = System.currentTimeMillis();
        String houzhui = fileName.substring(fileName.lastIndexOf("."));
        //指定文件的名字
        fileName = new Date().getTime()+""+houzhui;
      
        if(houzhui.equals(".jpg") || houzhui.equals(".gif") || houzhui.equals(".png") || houzhui.equals(".bmp") || houzhui.equals(".JPG") || houzhui.equals(".GIF") || houzhui.equals(".PNG") || houzhui.equals(".BMP")){
		 File uploadedFile = new File(dirs,fileName);
		 item.write(uploadedFile);
		 DataUtil.imgname="upload/"+fileName;
		 System.out.println("DataUtil.imgname"+DataUtil.imgname);
		 session.setAttribute("FileUpload.Progress."+fileId,"-1");
		
        }else{
         session.setAttribute("FileUpload.Progress."+fileId,"-2");
        }
		
    }
 }

}  
%>