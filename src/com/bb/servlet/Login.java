package com.bb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.bb.bean.User;
import com.bb.dao.UserDao;

/**
 * 登入
 * Create by woo-bo
 */
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<User> userList = UserDao.query();
        User inputuser = new User(username, password);
        if (userList.contains(inputuser)) {
            List<User> chinaNameList = UserDao.getByUsername(username);
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("user_china_name", chinaNameList.get(0).getUserChinaName());
            String ck = request.getParameter("ck");
            //被选中的状态是on 没有被选中的状态下是null
            if ("on".equals(ck)) {
                Cookie c = new Cookie("users", username + "-" + password);
                c.setMaxAge(20);
                response.addCookie(c);
            } else {
                Cookie c = new Cookie("users", username + "-" + password);
                c.setMaxAge(0);
                response.addCookie(c);
            }
            if (UserDao.getByUsername(username).get(0).getId()<=3) {
                response.sendRedirect("jsp/welcome-teacher.jsp");
                return;
            } else if(username.equals("admin")){
                response.sendRedirect("jsp/welcome-admin.jsp");
                return;
            }else {
                response.sendRedirect("jsp/welcome-student.jsp");
                return;
            }
        } else {
            out.print("<script>");
            out.print("alert('用户名或密码错误！');");
            out.print("window.location.href='/Homework'");
            out.print("</script>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
