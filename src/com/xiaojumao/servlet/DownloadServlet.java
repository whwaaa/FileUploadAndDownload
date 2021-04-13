package com.xiaojumao.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * @Author: whw
 * @Description:
 * @Date Created in 2021-04-11 12:02
 * @Modified By:
 */
@WebServlet(urlPatterns = "/DownloadServlet")
public class DownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1.获取参数
        req.setCharacterEncoding("UTF-8");
        String fileName = req.getParameter("fileName");
        String path = "/uploadfiles/" + fileName;

        // 2.设置响应的头信息和响应的类型
        resp.setContentType("application/octet-stream");
        resp.addHeader("Content-Disposition","attachment;filename="+ URLEncoder.encode(fileName,"UTF-8"));

        // 3.跳转页面
        req.getRequestDispatcher(path).forward(req, resp);

        // 4.清空缓存区
        resp.flushBuffer();
    }
}
