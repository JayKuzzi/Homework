package com.bb.servlet;

import com.bb.bean.Work;
import com.bb.dao.WorkDao;
import com.bb.util.NowTime;

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
 * 改作业
 * Create by woo-bo
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
public class ChangeWork extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String change_workName = request.getParameter("change_workName");
            String change_workMess = request.getParameter("change_workMess");
            if (change_workMess.equals("")) {
                change_workMess = "无";
            }
            String change_workTeacher = request.getParameter("change_workTeacher");
            String change_workPhone = request.getParameter("change_workPhone");
            String id = request.getParameter("cid");
//            获取上传的文件
            Part change_part = request.getPart("change_file");
            if (change_part.getSize()==0) {
                Work work = new Work(Integer.parseInt(id), Integer.parseInt(change_workTeacher), change_workName, NowTime.getNowDate(), change_workPhone, change_workMess);
                WorkDao.update(work);
                response.sendRedirect("jsp/up-success.jsp");
                return;
            }else{
                //获取请求的信息
                String name = change_part.getHeader("content-disposition");
//            System.out.println(name);//测试使用
//            System.out.println(workMess);//
                //获取上传文件的目录
                String root = request.getServletContext().getRealPath("/workFiles");
//            System.out.println("测试上传文件的路径：" + root);
                //获取文件的后缀
                String str = name.substring(name.lastIndexOf("."), name.length() - 1);
//            System.out.println("测试获取文件的后缀：" + str);
                //生成一个新的文件名，不重复，数据库存储的就是这个文件名，不重复的
                String filename = root.replaceAll("\\\\", "/")+"/" + UUID.randomUUID().toString() + str;
//            System.out.println("测试产生新的文件名：" + filename);
                //上传文件到指定目录，不想上传文件就不调用这个
                change_part.write(filename);

//            //修改到数据库
                Work work = new Work(Integer.parseInt(id), Integer.parseInt(change_workTeacher), change_workName,filename, NowTime.getNowDate(), change_workPhone, change_workMess);
                WorkDao.updateWithFile(work);
                response.sendRedirect("jsp/up-success.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.write("修改失败！请速速联系汪博：156-1010-6465");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}