<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/9
  Time: 16:22
  Info:反馈问题
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
        function formSeedback(form) {
            if (form.seedback_tittle.value == "") {
                alert("反馈标题不能为空");
                form.seedback_tittle.focus();
                return false;
            }
            if (form.seedback_tittle.value.length < 2) {
                alert("反馈标题至少2位！");
                form.seedback_tittle.focus();
                return false;
            }
            if (form.seedback_content.value == "") {
                alert("反馈内容不能为空");
                form.seedback_content.focus();
                return false;
            }
            if (form.seedback_content.value.length < 10) {
                alert("反馈内容至少10个字符！");
                form.seedback_content.focus();
                return false;
            }
            return true;
        }


        function checkNullForSeedTittle() {
            var seedback_tittle = document.getElementById("seedback_tittle").value;
            var mess = document.getElementById("isnullForTittle");
            if (seedback_tittle == "") {
                mess.innerHTML = "*反馈标题不能为空";
                return false;
            } else if (seedback_tittle.length < 2) {
                mess.innerHTML = "*反馈标题至少2位";
                return false;
            } else {
                mess.innerHTML = "";
            }
        }
        function checkNullForSeedContent() {
            var seedback_content = document.getElementById("seedback_content").value;
            var mess = document.getElementById("isnullForContent");
            if (seedback_content == "") {
                mess.innerHTML = "*反馈内容不能为空";
                return false;
            } else if (seedback_content.length < 10) {
                mess.innerHTML = "*反馈内容至少10个字符";
                return false;
            } else {
                mess.innerHTML = "";
            }
        }


        function bodyload() {
            var chinaName = document.getElementsByTagName("p")[0].innerHTML;
            if (chinaName == "未登录") {
                alert("会话超时，请重新登录！");
                window.location.href = '/Homework';
            }
        }

        function onKeyPress(event) {
            event = event || window.event;
            if (event.keyCode == 13) {
                event.returnValue = false;
                $('#seedback_content').val('').focus();
            }
        }
    </script>
    <link rel="stylesheet" type="text/css" href="../css/seedback.css"/>

</head>
<body style="padding-left:15%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload()">
<div class="div-reg">
    <h1 class="font-tittle">问题反馈</h1>
    <p hidden><%=returnChinaName%></p>
    <form action="/Homework/ChangeUser" method="post" onsubmit="return formSeedback(this);">
        <table align="center">
            <tr>
                <td><input style="display: none" type="text" name="changing_name4" id="changing_name4" class="box" value="<%=user.getUserName()%>"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">姓名：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" name="changing_name" id="changing_name" value="<%=user.getUserChinaName()%>" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">联系方式：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="<%=user.geteMail()%>" class="box"></td>
            </tr>
            <tr>
                <td><input onblur="checkNullForSeedTittle()" type="text" placeholder="请输入反馈标题" name="seedback_tittle"
                           id="seedback_tittle" class="box">
                </td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForTittle" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><textarea onblur="checkNullForSeedContent()"  placeholder="请输入反馈内容" name="seedback_content"
                              onkeypress="onKeyPress(event)" id="seedback_content" class="box2" style="word-wrap:break-word" ></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForContent" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
        </table>
        <div style="text-align: center;margin-top: -10px">
            <input type="submit" class="red-btn" value="提交反馈">
        </div>
    </form>
</div>

</body>
</html>  