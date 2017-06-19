<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/10
  Time: 15:55
  Info:操作成功提示页
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null)
        returnChinaName = "未登录";
    else
        returnChinaName = user_china_name + "欢迎您";
%>
<html>
<head>
    <title>操作成功</title>
    <style>
        body {
            font-size: 12px;
            background:#EEF0F0;
            font-family: 微软雅黑;
        }
    </style>
    <script>
        function bodyload() {
            var chinaName = document.getElementsByTagName("p")[0].innerHTML;
            if (chinaName == "未登录") {
                alert("会话超时，请重新登录！");
                window.location.href = '/Homework';
            }
        }
    </script>
</head>
<body style="text-align: center ;padding-top: 200px" onload="bodyload()">
<p hidden><%=returnChinaName%></p>
<img style="width: 600px" src="../images/up-success.png">
</body>
</html>
