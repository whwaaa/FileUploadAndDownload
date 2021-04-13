package com.xiaojumao.servlet;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;
import java.io.IOException;

/**
 * @Author: whw
 * @Description:
 * @Date Created in 2021-04-10 21:32
 * @Modified By:S
 */
@WebServlet(urlPatterns = "/UploadServlet")
public class UploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // 1.创建上传文件的对象
            SmartUpload smartUpload = new SmartUpload();

            // 2.初始化上传操作
            PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(
                    this, req, resp, null, false, 1024*1024*10, true);
            smartUpload.initialize(pageContext);
            // 2.1 设置编码
            smartUpload.setCharset("UTF-8");

            // 3.上传
            smartUpload.upload();

            // 4.获取文件信息
            File file = smartUpload.getFiles().getFile(0);
            String fileName = file.getFileName();
            String fileType = file.getContentType();
            float size = (float)file.getSize()/1024/1024;
            String formatSize = String.format("%.2f", size) + "M";
            System.out.println("文件大小:" + formatSize);
            System.out.println("文件类型:" + fileType);
            fileType = fileType.contains("image") ? "image" : "";

            // 5.指定上传的路径
            String uploadPath = "/uploadfiles/" + fileName;

            // 6.保存到指定位置
            // 若FileUpDown应用根目录下存在“file”子目录,则以SAVEAS_VIRTUAL方式保存文件,否则以SAVEAS_PHYSICAL方式保存文件
            file.saveAs(uploadPath, File.SAVEAS_VIRTUAL);

            // 7.跳转成功页面
            req.setAttribute("fileName", fileName);
            req.setAttribute("fileSize", formatSize);
            req.setAttribute("fileType", fileType);
            req.getRequestDispatcher("success.jsp").forward(req, resp);
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
    }
}
