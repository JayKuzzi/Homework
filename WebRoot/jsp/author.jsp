<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/13
  Time: 09:12
  Info:作者信息
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%

    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null) {
        returnChinaName = "未登录";
    } else {
        returnChinaName = user_china_name + "欢迎您";
    }

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>作者信息</title>
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
    <link rel="stylesheet" type="text/css" href="../css/author.css"/>

</head>
<body style="padding-left:15%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload()">
<div class="div-reg">
    <p hidden><%=returnChinaName%></p>
    <form style="text-align: center">
        <table align="center" style="text-align: center">
            <img style="text-align: center;width: 100px;margin-top: 30px" src="../images/avatar.jpg" >
            <p style="color: #4E5D49;font-size: 16px">汪博</p>
            <span style="color: #999999;font-size: 15px">致力进军IT行业，并一直为此付诸行动</span>
            <div style="margin-top: 20px">
                <a href="http://www.woobo.me" target="_blank">
                <img onmouseout="this.src='../images/blog.png'" onmouseover="this.src='../images/blog2.png'" style="text-align: center;width: 40px" src="../images/blog.png" >
                </a>
                <a href="https://github.com/JayKuzzi" target="_blank">
                <img onmouseout="this.src='../images/github.png'" onmouseover="this.src='../images/github2.png'" style="text-align: center;width: 40px;margin-left: 32px;margin-right: 32px" src="../images/github.png" >
                </a>
                <a href="http://www.jianshu.com/u/19513cee1eb8" target="_blank">
                <img onmouseout="this.src='../images/jian.png'" onmouseover="this.src='../images/jian2.png'"  style="text-align: center;width: 40px" src="../images/jian.png" >
                </a>
            </div>
            <div style="margin-top: 0px">
                <img  style="text-align: center;width: 250px" src="../images/wx.png" >
            </div>
        </table>
    </form>
</div>

</body>
</html>  