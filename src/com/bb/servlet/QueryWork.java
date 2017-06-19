package com.bb.servlet;

import com.bb.dao.UserDao;
import com.bb.dao.WorkDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 搜索作业
 * Create by woo-bo
 */
public class QueryWork extends HttpServlet {
    String result;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String item_workName = request.getParameter("item_workName");
        String item_date = request.getParameter("item_date");
        String pageType = request.getParameter("item_label");
        if (item_date == "" && item_workName != "") {
            result = WorkDao.resultSetToJsonWithworkName(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_workName);
        } else if (item_date != "" && item_workName == "") {
            result = WorkDao.resultSetToJsonWithDate(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_date);
        } else if (item_date != "" && item_workName != ""){
            result = WorkDao.resultSetToJsonWithDouble(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_date, item_workName);
        } else {
            result = WorkDao.resultSetToJsonWithDouble(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId(), item_date, item_workName);
        }

        if (pageType.equals("change_work")) {
            request.getSession().setAttribute("searchResult", result);
            response.sendRedirect("jsp/search-work-change.jsp");
            return;
        } else if (pageType.equals("delete_work")) {
            request.getSession().setAttribute("searchResult", result);
            response.sendRedirect("jsp/search-work-delete.jsp");
            return;
        } else if (pageType.equals("my_work")) {
            request.getSession().setAttribute("searchResult", result);
            response.sendRedirect("jsp/search-work.jsp");
            return;
        } else if (pageType.equals("grade")) {
            request.getSession().setAttribute("searchResult", result);
            response.sendRedirect("jsp/search-grade.jsp");
            return;
        }
         else if (pageType.equals("up-show")) {
            request.getSession().setAttribute("searchResult", result);
            response.sendRedirect("jsp/search-work-workshow.jsp");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
