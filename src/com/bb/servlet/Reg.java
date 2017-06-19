package com.bb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.bb.bean.User;
import com.bb.dao.UserDao;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * 注册
 * Create by woo-bo
 */
public class Reg extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String user_id = request.getParameter("user_id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String user_china_name = request.getParameter("user_china_name");
        String classInfo = request.getParameter("class_info");
        String profession = request.getParameter("profession");
        String email = request.getParameter("email");
        PrintWriter out = response.getWriter();
        User newUser = new User(user_id, user_china_name, username, password, classInfo, profession, email);
        // 判断数据库中否连接成功
        int count = UserDao.add(newUser);
        if (count > 0) {
            out.print("<script>");
            out.print("alert('注册成功');");
            out.print("window.location.href='/Homework'");
            out.print("</script>");
        } else {
            System.out.println("注册失败！");
        }
    }

}
