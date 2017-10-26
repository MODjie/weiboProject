package com.qzz.weibo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.qzz.weibo.util.DataUtil;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 创建一个DiskFileItemFactory工厂对象
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 得到一个文件上传处理的临时目录
		ServletContext servletContext = this.getServletConfig()
				.getServletContext();
		File repository = (File) servletContext
				.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// ServletFileUpload 核心对象来做文件的上传操作
		ServletFileUpload upload = new ServletFileUpload(factory);

		// 解析request对象
		try {
			List<FileItem> items = upload.parseRequest(request);

			// List的处理 可以使用foreach 也可以用迭代器
			// Process the uploaded items
			Iterator<FileItem> iter = items.iterator();
			while (iter.hasNext()) {
				// FileItem 一个fileItem理解为一个表单的元素对象
				// 按照之前的表单 两个item 文本框 文件域
				FileItem item = iter.next();

				// isFormField() 如果这个item是表单域（表达实际上就是 非文件上传的部分,非文件域）
				if (item.isFormField()) {

					String name = item.getFieldName();
					String value = item.getString();

					System.out.println(" isFormField name :" + name + ",value"
							+ value);

				} else {
					// 文件域的处理
					String fieldName = item.getFieldName();
					String fileName = item.getName(); // 文件名
					String contentType = item.getContentType();
					boolean isInMemory = item.isInMemory();
					long sizeInBytes = item.getSize(); // 大小
					String houzhui = fileName.substring(fileName.lastIndexOf("."));
					fileName=System.currentTimeMillis()+houzhui;
					
					// path应该如何来赋值？ 这个文件上传之后的实际目录是哪里 ->还要将文件名写完整
					// 分析 实际上应该是 tomcat下的webapps/工程名/某个目录 暂时定为 imgs
					String path = request.getRealPath("/upload/" +fileName);
					System.out.println("path :" + path);
					// 构建一个FIle对象出来
					fileName = "upload/"+fileName;
					DataUtil.fileName=fileName;
					File uploadedFile = new File(path);
					// write写 实际就是文件上传的具体动作
					item.write(uploadedFile);
					
					PrintWriter out = response.getWriter();
					out.print("<script>parent.location.href='W_UserInfoServlet?op=updatetouxiang'</script>");
					
					System.out.println("上传成功~");

				}
			}

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
