<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/1
  Time: 09:20
  Info:登陆界面
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset = UTF-8" pageEncoding="UTF-8" %>
<%

    //el表达式
    String names = "";
    String pwd = "";
    //取出Cookie
    Cookie[] c = request.getCookies();
    if(c!=null){
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("users")) {
                //存着数据（用户名+密码）
                names = c[i].getValue().split("-")[0];
                pwd = c[i].getValue().split("-")[1];
                //再一次的存起来（备用）
                request.setAttribute("xingming", names);
                request.setAttribute("mima", pwd);
            }
        }
    }
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>作业管理工作室</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/Homework/js/login.js"></script>
    <link rel="stylesheet" type="text/css" href="/Homework/css/login.css"/>
</head>
<body>
<div class="div-login">
    <h1 class="font-tittle">Welcome</h1>
    <form action="/Homework/Login" method="post" onsubmit="return login(this);">
        <table align="center">
            <tr>
                <td><input onblur="checkNull('用户名','username','isnullForName')" type="text" placeholder="用户名" name="username" id="username" class="box"
                           value="${xingming}"></td>
            </tr>
            <tr>
                <td><div id="isnullForName" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div></td>
            </tr>
            <tr>
                <td><input onblur="checkNull('密码','password','isnullForPass')" type="password" placeholder="密码" name="password" id="password" class="box"
                           value="${mima}"></td>
            </tr>
            <tr>
                <td><div id="isnullForPass" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div></td>
            </tr>
            <tr>
                <td><input onblur="checkNull('验证码','verify','isnullForVerify')" type = "text" name="verify" id = "verify" placeholder="验证码" class="box2"/>
                <input type = "button" id="code" name="code" onclick="createCodeAgain()" class="box3"/></td>
            </tr>
            <tr>
                <td><div id="isnullForVerify" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div></td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="ck" style="zoom:140%"><span class="remember"> 记住我20秒</span>
                </td>
            </tr>

        </table>
        <div class="div-btn">
            <input class="btn" type="button" onclick="window.location.href='jsp/reg.jsp'" value="注 册">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input class="btn" type="submit" value="登 录">
        </div>
        <div style="margin-left: 100px;width: 200px;border-bottom: 1px solid red;text-align: center;color: red">【测试用户】</div>
        <div style="margin-left: 8px;text-align: center;color: red;font-size: 10px">【学生】bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【密码】123456</div>
        <div style="margin-left: 1px;text-align: center;color: red;font-size: 10px">【老师】tzhang 【密码】zhang</div>
        <div style="margin-left: 3px;text-align: center;color: red;margin-right: 25px;font-size: 10px">【老师】tli &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【密码】li</div>
        <div style="margin-left: 1px;text-align: center;color: red;font-size: 10px">【管理】admin  &nbsp;【密码】admin</div>


    </form>
</div>
</body>
</html>  