<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/16
  Time: 10:38
  Info:管理员欢迎页
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_china_name = "";
    String returnChinaName = "";
    String value =request.getServletContext().getInitParameter("tip");
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null)
        returnChinaName = "未登录";
    else if(!user_china_name.contains("管理员"))
        returnChinaName = "未登录";
    else
        returnChinaName = user_china_name ;
%>
<html>
<head>
    <title>作业管理工作室</title>
    <link rel="shortcut icon" href="../images/icon.ico" >
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyui/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="../css/welcome-teacher.css"/>
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/welcome-admin.js"></script>

</head>
<body class="easyui-layout" style="margin: 2px" onload="bodyload();showLeftTime()" link="#414747" alink="#414747"
      vlink="#414747">
<div data-options="region:'north',border:false" style="
    height:105px;margin-bottom: 1px" class="myhead">
    <div class="north-left">
        <img onclick="refresh_once()" src="../images/tittle.png" height="100px" class="logo">
    </div>
    <div class="north-center">
        <input type="button" id="btn1" onclick="manager()" class="btn2" value="管理用户"/><b class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn2" onclick="show()" class="btn2" value="作业展示"/><b class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn3" onclick="question()" class="btn2" value="常见问题"/><b class="xie">&nbsp;/&nbsp;</b>
        <input type="button" id="btn4" onclick="about()" class="btn2" value="联系作者"/>
    </div>
    <div class="north-right">
        <p id="ChinaName" class="timeinfo2"><%=returnChinaName%></p>
        <a href="/Homework/Login_out" style="position: absolute;margin-top: 16px;margin-left:5px;color: #4F5F49;font-size: 11px;font-weight: 600">退出</a>
        <p class="sessionInfo">(管理员用户)</p>
        <div class="timeinfo"><span id="time"></span></div>
        <div class="timeinfo3"><span id="time2"></span></div>
    </div>
</div>
<div id="west" data-options="region:'west',border:false" style="width:230px; " class="myleft">
    <div id="work" style="width:200px;background:inherit;padding:5px;margin-left: 10px;margin-top: 10px">
        <div class="easyui-panel" title="管 理 学 生" collapsible="false"
             style="background:inherit;width:200px;height:210px;text-align: center;">
            <input type="button" onclick="changeStudent()" class="btn" value="修 改 信 息"/>
            <input type="button" onclick="deleteStudent()" class="btn" value="删 除 信 息"/>
            <input type="button" onclick="ApplyStudent()" class="btn" value="学 生 申 请"/>
        </div>
        <br/>
        <div class="easyui-panel" title="管 理 老 师" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="changeTeacher()" class="btn" value="修 改 信 息"/>
        </div>
    </div>
    <div id="question" style="display:none;width:200px;background:inherit;padding:5px;margin-left: 10px;margin-top: 10px">
        <div class="easyui-panel" title="常 见 问 题" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="question_list()" class="btn" value="常 见 问 题"/>
        </div>
        <br/>
        <div class="easyui-panel" title="反 馈 列 表" collapsible="false"
             style="background:inherit;width:200px;height:auto;padding-bottom:20px;text-align: center">
            <input type="button" onclick="seedback_list()" class="btn" value="反 馈 信 息"/>
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
</body>
</html>
