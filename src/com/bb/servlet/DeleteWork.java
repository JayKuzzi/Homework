package com.bb.servlet;

import com.bb.bean.Work;
import com.bb.dao.WorkDao;
import com.bb.dao.WorkShowDao;
import com.bb.util.NowTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;


/**
 * 删作业
 * Create by woo-bo
 */
public class DeleteWork extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String delete_id = request.getParameter("cid");
            List<Integer> ids= WorkShowDao.QuaryId();
            if(!ids.contains(Integer.parseInt(delete_id))){
                Work work =new Work(Integer.parseInt(delete_id));
                WorkDao.delete(work);
                response.sendRedirect("jsp/up-success.jsp");
                return;
            }else {
                out.print("<script>");
                out.print("alert('要删除的作业正在展示，不可删除！');");
                out.print("window.location.href='/Homework/jsp/delete-work.jsp'");
                out.print("</script>");
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