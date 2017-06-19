package com.bb.servlet;

import com.bb.bean.User;
import com.bb.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 检查可用项
 * Create by woo-bo
 */
@WebServlet(name = "CheckName")
public class CheckName extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String user_id = request.getParameter("user_id");

        String changing_name = request.getParameter("changing_name");
        String agoPass = request.getParameter("agoPass");

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        if (!name.equals("")) {
            List<User> userList = UserDao.getByUsername(name);
            if (userList.isEmpty())
                out.write("false");
            else
                out.write("true");
        } else if (!user_id.equals("")) {
            List<User> userList = UserDao.getByNum(user_id);
            if (userList.isEmpty())
                out.write("false2");
            else
                out.write("true2");

        }else if(!agoPass.equals("")){
            List<User> userList = UserDao.getByUsername(changing_name);
            if(userList.get(0).getUserPass().equals(agoPass))
                out.write("passOk");
            else
                out.write("passNotOk");
        }

    }
}
