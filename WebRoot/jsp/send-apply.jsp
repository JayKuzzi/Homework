<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/13
  Time: 12:26
  Info:请求修改个人其他信息
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bb.dao.UserDao" %>
<%@ page import="com.bb.bean.User" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%
    User user = null;
    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null) {
        returnChinaName = "未登录";
    } else {
        returnChinaName = user_china_name + "欢迎您";
        try {
            user = UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>个人信息</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
        function bodyload() {
            var chinaName = document.getElementsByTagName("p")[0].innerHTML;
            if (chinaName == "未登录") {
                alert("会话超时，请重新登录！");
                window.location.href = '/Homework';
            }
        }
    </script>
    <link rel="stylesheet" type="text/css" href="../css/my-info.css"/>

</head>
<body style="padding-left:15%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload()">
<div class="div-reg">
    <h1 class="font-tittle">个人信息</h1>
    <p hidden><%=returnChinaName%></p>
    <form>
        <table align="center">
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">姓名：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="<%=user.getUserChinaName()%>" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">学号：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="<%=user.getUserId()%>" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">专业：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="<%=user.getProfession()%>" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">班级：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="<%=user.getClassinfo()%>" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">邮箱：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="<%=user.geteMail()%>" class="box"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>  