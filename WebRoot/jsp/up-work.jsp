<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/8
  Time: 14:47
  Info:上传作业
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%

    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null)
        returnChinaName = "未登录";
    else
        returnChinaName = user_china_name;
%>
<html>
<head>
    <title>上 交 作 业</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="../js/up-work.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/up-work.css"/>
</head>
<body onload="bodyload();createCode()">
<p hidden><%=returnChinaName%></p>
<div class="div-reg">
    <form action="/Homework/UpWork" method="post" enctype="multipart/form-data" onsubmit="return do_it(this);">
        <table align="center" style="padding-top: 70px">
            <tr>
                <td><input onblur="checkNullForName()" type="text" placeholder="作业名称" name="workName" id="workName"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnull" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <select onblur="checkNullForTeacher()" class="box" name="workTeacher" id="workTeacher"
                            placeholder="批阅老师">
                        <option value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择批阅老师</option>
                        <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;张老师</option>
                        <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;李老师</option>
                        <option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;王老师</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForTeacher" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForPhone()" onkeyup="value=this.value.replace(/\D+/g,'')" type="text"
                           placeholder="联系电话" name="workPhone" id="workPhone"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForPhone" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input type="text" placeholder="备注信息（可不填）" name="workMess" id="workMess" class="box">
                </td>
            </tr>
            <tr>
                <td><input type="file" name="workFile" id="workFile" class="box4" onchange="getPhotoSize(this)"></td>
            </tr>
            <tr>
                <td><input onblur="checkNullForVerify()" type="text" name="verify2" id="verify2" placeholder="验证码"
                           class="box2"/>
                    <input type="button" id="code2" name="code2" onclick="createCodeAgain()" class="box3"/></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForVerify" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
        </table>
        <div class="div-btn">
            <input type="submit" class="btn" value="上 交">
        </div>
        <div id="tip" style="display:none;text-align: center;color: #FC091B"> 或许您的文件过大，请耐心等待。。。</div>
    </form>
</div>

</body>
</html>