<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/2
  Time: 10:47
  Info:学生欢迎页
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username ="";
    String user_china_name = "";
    String returnChinaName = "";
    String value =request.getServletContext().getInitParameter("tip");
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    username = (String) request.getSession().getAttribute("username");
    if (user_china_name == null)
        returnChinaName = "未登录";
    else if(user_china_name.contains("老师"))
        returnChinaName = "未登录";
    else if(user_china_name.contains("管理员"))
        returnChinaName = "未登录";
    else
        returnChinaName = user_china_name + "同学 ";
%>
<html>
<head>
    <title>作业管理工作室</title>
    <link rel="shortcut icon" href="../images/icon.ico" >
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyui/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="../css/welcome-student.css"/>
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/welcome-student.js"></script>

</head>
<body class="easyui-layout" style="margin: 2px" onload="bodyload();showLeftTime()" link="#414747" alink="#414747"
      vlink="#414747">
<div data-options="region:'north',border:false" style="
    height:105px;margin-bottom: 1px" class="myhead">
    <div class="north-left">
        <img onclick="refresh_once()" src="../images/tittle.png" height="100px" class="logo">
    </div>
    <div class="north-center">
        <input type="button" id="btn1" onclick="work()" class="btn2" value="我的作业"/><b class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn2" onclick="grade()" class="btn2" value="成绩查询"/><b class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn3" onclick="show()" class="btn2" value="作业展示"/><b class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn4" onclick="me()" class="btn2" value="个人信息"/><b class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn5" onclick="question()" class="btn2" value="常见问题"/><b
            class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn6" onclick="about()" class="btn2" value="联系作者"/>
    </div>
    <div class="north-right">
        <p id="ChinaName" class="timeinfo2"><%=returnChinaName%></p>
        <a href="/Homework/Login_out" style="position: absolute;margin-top: 16px;margin-left:5px;color: #4F5F49;font-size: 11px;font-weight: 600">退出</a>
        <p class="sessionInfo">(学生用户)</p>
        <div class="timeinfo"><span id="time"></span></div>
        <div class="timeinfo3"><span id="time2"></span></div>
    </div>
</div>
<div id="west" data-options="region:'west',border:false" style="width:230px; " class="myleft">
    <div id="work" style="width:200px;background:inherit;padding:5px;margin-left: 10px;margin-top: 10px">
        <div class="easyui-panel" title="交  作   业" collapsible="false"
             style="background:inherit;width:200px;height:100px;text-align: center;">
            <input type="button" onclick="upWork()" class="btn" value="上 传 作 业"/>
        </div>
        <br/>
        <div class="easyui-panel" title="我 的 作 业" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="findWork()" class="btn" value="查 询 作 业"/>
            <input type="button" onclick="deleteWork()" class="btn" value="删 除 作 业"/>
            <input type="button" onclick="changeWork()" class="btn" value="修 改 作 业"/>
        </div>
    </div>
    <div id="show" style="display:none;width:200px;background:inherit;padding:5px;margin-left: 10px;margin-top: 10px">
        <div class="easyui-panel" title="作 业 展 示" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="workShow()" class="btn" value="优 秀 作 业"/>
        </div>
        <br/>
        <div class="easyui-panel" title="我 要 展 示" collapsible="false"
             style="background:inherit;width:200px;height:100px;text-align: center;">
            <input type="button" onclick="upShow()" class="btn" value="我 要 展 示"/>
        </div>
    </div>
    <div id="me" style="display:none;width:200px;background:inherit;padding:5px;margin-left: 10px;margin-top: 10px">
        <div class="easyui-panel" title="个 人 信 息" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="myInfo()" class="btn" value="详 细 信 息"/>
            <input type="button" onclick="passChange()" class="btn" value="修 改 密 码"/>
            <input type="button" onclick="emailChange()" class="btn" value="修 改 邮 箱"/>
        </div>
        <br/>
        <div class="easyui-panel" title="其 他 修 改" collapsible="false"
             style="background:inherit;width:200px;height:100px;text-align: center;">
            <input type="button" onclick="otherChange()" class="btn" value="申 请 修 改"/>
        </div>
    </div>
    <div id="question" style="display:none;width:200px;background:inherit;padding:5px;margin-left: 10px;margin-top: 10px">
        <div class="easyui-panel" title="常 见 问 题" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="question_list()" class="btn" value="常 见 问 题"/>
        </div>
        <br/>
        <div class="easyui-panel" title="我 要 反 馈" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="my_question()" class="btn" value="我 要 反 馈"/>
        </div>
    </div>
</div>
<div data-options="region:'south',border:false" style="height:100px; margin-top:2px;margin-bottom: 5px" class="myhead">
    <div id="footer-right">
        <img style="width: 155px;height: 52px" src="../images/pay.png">
    </div>
    <div id="footer-center"><a href="http://www.jianshu.com/u/19513cee1eb8">简 &nbsp; 书</a>&nbsp;|&nbsp;
        <a href="https://github.com/JayKuzzi">GitHub</a>&nbsp;|&nbsp;
        <a href="http://www.woobo.me">博 &nbsp; 客</a>
        <br>♥ ♥ ♥
        <br>Copyright © 2017 - Woobo.me All Rights Reserved.
    </div>
</div>
<div id="right" data-options="region:'center',border:false" class="myhead">
    <div id="tt" class="easyui-tabs" style="border-radius:10px;width:101%;height:100%;background: inherit;">
        <div title="欢迎页" iconCls="icon-tip" style="background: inherit;text-align: center">
            <div style="color:red;font-weight: 600">
                <marquee direction="left" behavior="scroll" scrollamount="3" scrolldelay="0" loop="-1" width="50%" height="20" bgcolor="#EEF0F0">
                <%=value%>
                </marquee>
            </div>
            <img style="width: 950px;height: 620px" src="../images/welcome.png">
        </div>
    </div>
</div>
<div id="dlg" class="easyui-dialog" title="修改密码" style="background:inherit;width:400px;height:300px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/ChangeUser" method="post" onsubmit="return formChangePass(this);">
        <table align="center">
            <tr>
                <td><input style="display: none" type="text" name="changing_name" id="changing_name" class="box" value="<%=username%>"></td>
            </tr>
            <tr>
                <td><input onblur="checkNullForAgoPass()" type="password" placeholder="原密码" name="ago_password" id="ago_password"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForAgoPass" name="isnullForAgoPass" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForNewPass()" type="password" placeholder="新密码" name="new_password" id="new_password"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForNewPass" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForNewPassAgain()" type="password" placeholder="确认密码" name="new_repassword"
                           id="new_repassword" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForNewPassAgain" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
        </table>
        <div class="div-btn">
            <input type="submit" class="red-btn" value="确认修改">
        </div>
    </form>
</div>

<div id="dlg2" class="easyui-dialog" title="修改邮箱" style="background:inherit;width:400px;height:200px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/ChangeUser" method="post" onsubmit="return formChangeEmail(this);">
        <table align="center">
            <tr>
                <td><input style="display: none" type="text" name="changing_name2" id="changing_name2" class="box" value="<%=username%>"></td>
            </tr>
            <tr>
                <td><input onblur="checkNullForEmail()" type="text" placeholder="请输入新邮箱" name="new_email" id="new_email"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForEmail" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
        </table>
        <div class="div-btn">
            <input type="submit" class="red-btn" value="确认修改">
        </div>
    </form>
</div>

<div id="dlg3" class="easyui-dialog" title="申请修改" style="background:inherit;width:400px;height:270px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <div align="center" style="color: red ;margin-bottom: 10px">唯一项的修改必须向管理员申请</div>
    <form action="/Homework/ChangeUser" method="post" onsubmit="return formChangeOther(this);">
        <table align="center">
            <tr>
                <td><input style="display: none" type="text" name="changing_name3" id="changing_name3" class="box" value="<%=username%>"></td>
            </tr>
            <tr>
                <td>
                    <select class="box" name="ChangeType" id= "ChangeType" >
                        <option value="选择更改项">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;选择更改项</option>
                        <option value="姓名">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</option>
                        <option value="学号">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</option>
                        <option value="专业">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</option>
                        <option value="班级">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForContent()" type="text" placeholder="请输入更改内容" name="content" id="content" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForContent" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
        </table>
        <div class="div-btn">
            <input type="submit" class="red-btn" value="确认修改">
        </div>
    </form>
</div>

</body>
</html>
