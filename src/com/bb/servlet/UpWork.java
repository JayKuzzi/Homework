package com.bb.servlet;
import com.bb.bean.User;
import com.bb.bean.Work;
import com.bb.dao.UserDao;
import com.bb.dao.WorkDao;
import com.bb.util.NowTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.List;
import java.util.UUID;

/**
 * 上传作业
 * Create by woo-bo
 */
//设置上传文件大小
@MultipartConfig(maxFileSize=1024*1024*10)
public class UpWork extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String workName = request.getParameter("workName");
            String workMess = request.getParameter("workMess");
            if(workMess.equals("")){
                workMess="无";
            }
            String workTeacher = request.getParameter("workTeacher");
            String workPhone = request.getParameter("workPhone");
            //获取上传的文件
            Part part = request.getPart("workFile");
            //获取请求的信息
            String name = part.getHeader("content-disposition");
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
            part.write(filename);
            //添加到数据库
            List<User> LoginName = UserDao.getByUsername((String) request.getSession().getAttribute("username"));
            Work work =new Work(LoginName.get(0).getId(),Integer.parseInt(workTeacher),workName,filename,"未批改", NowTime.getNowDate(),workPhone,workMess);
            WorkDao.add(work);
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