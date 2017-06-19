<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/2
  Time: 18:14
  Info:注册页面
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>作业管理系统注册</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="../js/reg.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/reg.css"/>
</head>
<body>
<div class="div-reg">
    <h1 class="font-tittle">Sign up</h1>
    <form action="../Reg" method="post" onsubmit="return reg(this);">
        <table align="center">
            <tr>
                <td><input onblur="checkNullForName()" onkeyup="value=value.replace(/[\W]/g,'') "
                           onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                           type="text" placeholder="用户名(英文)" name="username" id="username" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnull" name="isnull"  style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForPass()" type="password" placeholder="密码" name="password" id="password"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForPass" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForPassAgain()" type="password" placeholder="确认密码" name="repassword"
                           id="repassword" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForPassAgain" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForChinaName()" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
                           onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))"
                           type="text" placeholder="真实姓名(中文)" name="user_china_name" id="user_china_name" class="box">
                </td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForChinaName" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForNum()" onkeyup="value=this.value.replace(/\D+/g,'')"
                           type="text" placeholder="学号(数字)" name="user_id" id="user_id" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForNum" name="isnullForNum" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <select class="box" name="class_info" placeholder="请选择班级">
                        <option value="一班">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一班</option>
                        <option value="二班">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二班</option>
                        <option value="三班">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三班</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select class="box" name="profession" placeholder="请选择专业">
                        <option value="金融专业">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金融专业</option>
                        <option value="会计专业">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会计专业</option>
                        <option value="信息管理">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息管理</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForEmail()" type="text" placeholder="请输入邮箱" name="email" id="email" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForEmail" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForVerify()" type = "text" name="verify2" id = "verify2" placeholder="验证码" class="box2"/>
                    <input type = "button" id="code2" name="code2" onclick="createCodeAgain()" class="box3"/></td>
            </tr>
            <tr>
                <td><div id="isnullForVerify" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div></td>
            </tr>
        </table>
        <div class="div-btn">
            <input type="button" onclick="GoHome()" class="btn" value="返 回">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" class="btn" value="注 册">
        </div>
    </form>
</div>

</body>
</html>  