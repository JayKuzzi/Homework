package com.bb.servlet;


import com.bb.bean.WorkShow;
import com.bb.dao.WorkShowDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

/**
 * 我要展示
 * Create by woo-bo
 */
//设置上传文件大小
@MultipartConfig(maxFileSize=1024*1024*1)
public class UpWorkShow extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String workid = request.getParameter("workid");
            //获取上传的文件
            Part part = request.getPart("showFile");
            //获取请求的信息
            String name = part.getHeader("content-disposition");
//            System.out.println(name);//测试使用
//            System.out.println(workMess);//
            //获取上传文件的目录
            String root = request.getServletContext().getRealPath("/showFiles");
//            System.out.println("测试上传文件的路径：" + root);
            //获取文件的后缀
            String str = name.substring(name.lastIndexOf("."), name.length() - 1);
//            System.out.println("测试获取文件的后缀：" + str);
            //生成一个新的文件名，不重复，数据库存储的就是这个文件名，不重复的
            String filename = root.replaceAll("\\\\", "/")+"/" + UUID.randomUUID().toString() + str;
//            System.out.println("测试产生新的文件名：" + filename);
            //上传文件到指定目录，不想上传文件就不调用这个
            part.write(filename);
            //添加到数据库
            WorkShow workShow =new WorkShow(Integer.parseInt(workid),filename,"未通过");
            WorkShowDao.add(workShow);
            response.sendRedirect("jsp/up-success.jsp");
            return;
        } catch (Exception e) {
            e.printStackTrace();
            out.write("上传失败！请速速联系汪博：156-1010-6465");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}