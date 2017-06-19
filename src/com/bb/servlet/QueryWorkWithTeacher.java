package com.bb.servlet;

import com.bb.dao.UserDao;
import com.bb.dao.WorkDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 在老师页面搜索作业
 * Create by woo-bo
 */
public class QueryWorkWithTeacher extends HttpServlet {
    String result;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String item_workName = request.getParameter("item_workName");
        String item_date = request.getParameter("item_date");
        String pageType = request.getParameter("item_label");
        if (item_date == "" && item_workName != "") {
            result = WorkDao.resultSetToJsonWithworkName2(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_workName);
        } else if (item_date != "" && item_workName == "") {
            result = WorkDao.resultSetToJsonWithDate2(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_date);
        } else if (item_date != "" && item_workName != ""){
            result = WorkDao.resultSetToJsonWithDouble2(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_date, item_workName);
        } else {
            result = WorkDao.resultSetToJsonWithDouble2(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_date, item_workName);
        }

        if (pageType.equals("student_work")) {
            request.getSession().setAttribute("searchResult", result);
            response.sendRedirect("jsp/search-student-work.jsp");
            return;
        }else if (pageType.equals("correct_work")) {
            request.getSession().setAttribute("searchResult", result);
            response.sendRedirect("jsp/search-correct-work.jsp");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
