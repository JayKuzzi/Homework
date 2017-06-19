package com.bb.servlet;

import com.bb.bean.ApplyChange;
import com.bb.bean.Feedback;
import com.bb.bean.User;
import com.bb.bean.Work;
import com.bb.dao.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 改密码
 * Create by woo-bo
 */
public class ChangeUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String changing_name = request.getParameter("changing_name");
        String changing_name2 = request.getParameter("changing_name2");
        String new_password = request.getParameter("new_password");
        String new_email = request.getParameter("new_email");

        String changing_name3 = request.getParameter("changing_name3");
        String ChangeType = request.getParameter("ChangeType");
        String content = request.getParameter("content");

        String changing_name4 = request.getParameter("changing_name4");
        String seedback_tittle = request.getParameter("seedback_tittle");
        String seedback_content = request.getParameter("seedback_content");

        String workid = request.getParameter("workid");
        String grade = request.getParameter("grade");


        String applyId = request.getParameter("applyId");
        String changeState = request.getParameter("changeState");


        String cid = request.getParameter("cid");
        String user_china_name = request.getParameter("user_china_name");
        String userid = request.getParameter("userid");
        String profession = request.getParameter("profession");
        String classinfo = request.getParameter("classinfo");
        String eMail = request.getParameter("eMail");
        String password = request.getParameter("password");


        String cid2 = request.getParameter("cid2");

        String cid3 = request.getParameter("cid3");

        String cid4 = request.getParameter("cid4");
        String phone = request.getParameter("phone");
        PrintWriter out = response.getWriter();
        if (changing_name != null && new_password != null) {
            int count = UserDao.ChangePass(new_password, changing_name);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('修改成功');");
                out.print("window.location.href='/Homework'");
                out.print("</script>");
            } else {
                System.out.println("修改失败！请联系汪博。156-1010-6465");
            }
        }

        if (changing_name2 != null && new_email != null) {
            int count = UserDao.ChangeEamil(new_email, changing_name2);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('修改成功');");
                out.print("window.location.href='/Homework/jsp/welcome-student.jsp'");
                out.print("</script>");
            } else {
                System.out.println("修改失败！请联系汪博。156-1010-6465");
            }
        }

        if (changing_name3 != null && content != null && ChangeType != null) {
            ApplyChange applyChange = new ApplyChange(UserDao.getByUsername(changing_name3).get(0).getId(), ChangeType, content, "等待通过");
            int count = ApplyChangeDao.add(applyChange);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('已发送与管理员，请耐心等待通过。');");
                out.print("window.location.href='/Homework/jsp/welcome-student.jsp'");
                out.print("</script>");
            } else {
                System.out.println("操作失败！请联系汪博。156-1010-6465");
            }
        }

        if (changing_name4 != null && seedback_tittle != null && seedback_content != null) {
            Feedback feedback = new Feedback(UserDao.getByUsername(changing_name4).get(0).getId(), seedback_tittle, seedback_content);
            int count = FeedBackDao.add(feedback);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('感谢你的反馈，我们会尽快修复。');");
                out.print("window.location.href='/Homework/jsp/seedback.jsp'");
                out.print("</script>");
            } else {
                System.out.println("操作失败！请联系汪博。156-1010-6465");
            }
        }

        if (workid != null && grade != null) {
            int count = WorkDao.updateGrade(Integer.parseInt(workid), grade);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('打分成功！');");
                out.print("window.location.href='/Homework/jsp/correct-work.jsp'");
                out.print("</script>");
            } else {
                System.out.println("操作失败！请联系汪博。156-1010-6465");
            }
        }
        if (applyId != null && changeState != null) {
            int count = WorkShowDao.ChangeState(Integer.parseInt(applyId), changeState);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('操作成功，已经改变展示状态，点击自动跳转验证。');");
                out.print("window.location.href='/Homework/jsp/workshow.jsp'");
                out.print("</script>");
            } else {
                System.out.println("操作失败！请联系汪博。156-1010-6465");
            }
        }
        if (cid != null) {
            User user = new User(Integer.parseInt(cid), userid, user_china_name, password, classinfo, profession, eMail);
            int count = UserDao.update(user);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('操作成功');");
                out.print("window.location.href='/Homework/jsp/change-student.jsp'");
                out.print("</script>");
            } else {
                System.out.println("操作失败！请联系汪博。156-1010-6465");
            }
        }
        if (cid2 != null) {
            List<Integer> ids= WorkDao.QuaryId();
            List<Integer> ids2=ApplyChangeDao.QuaryId();
            List<Integer> ids3=FeedBackDao.QuaryId();
            if(!ids.contains(Integer.parseInt(cid2)) && !ids2.contains(Integer.parseInt(cid2)) && !ids3.contains(Integer.parseInt(cid2))){
                int count = UserDao.delete(Integer.parseInt(cid2));
                if (count > 0) {
                    out.print("<script>");
                    out.print("alert('操作成功');");
                    out.print("window.location.href='/Homework/jsp/delete-student.jsp'");
                    out.print("</script>");
                } else {
                    System.out.println("操作失败！请联系汪博。156-1010-6465");
                }
            }else {
                out.print("<script>");
                out.print("alert('要删除的用户存在作业或者申请修改条目或者反馈条目，目前不可删除！');");
                out.print("window.location.href='/Homework/jsp/delete-student.jsp'");
                out.print("</script>");
            }
        }
        if (cid3 != null) {
            int count = ApplyChangeDao.update(Integer.parseInt(cid3));
            if (count > 0) {
                out.print("<script>");
                out.print("alert('操作成功');");
                out.print("window.location.href='/Homework/jsp/apply-student.jsp'");
                out.print("</script>");
            } else {
                System.out.println("操作失败！请联系汪博。156-1010-6465");
            }
        }
        if (cid4 != null && phone != null) {
            int count = TeacherDao.update(Integer.parseInt(cid4),phone);
            if (count > 0) {
                out.print("<script>");
                out.print("alert('操作成功');");
                out.print("window.location.href='/Homework/jsp/change-teacher.jsp'");
                out.print("</script>");
            } else {
                System.out.println("操作失败！请联系汪博。156-1010-6465");
            }
        }
    }

}
