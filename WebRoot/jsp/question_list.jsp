<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/9
  Time: 14:14
  Info:常见问题
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bb.dao.WorkDao" %>
<%@ page import="com.bb.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userJson = "";
    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null) {
        returnChinaName = "未登录";
    } else {
        returnChinaName = user_china_name + "欢迎您";
        try {
            userJson = WorkDao.resultSetToJson(UserDao.getByUsername((String) request.getSession().getAttribute("username")).get(0).getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyui/demo/demo.css">
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <base href="${ctx}">
    <title>问 题 列 表</title>
    <script type="text/javascript">
        function bodyload() {
            var chinaName = document.getElementsByTagName("p")[0].innerHTML;
            if (chinaName == "未登录") {
                alert("会话超时，请重新登录！");
                window.location.href = '/Homework';
            }
        }
    </script>

</head>
<body style="padding-left:15%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();">
<p hidden><%=returnChinaName%></p>

<div class="easyui-panel" title="登 录 窗 口 问 题" collapsible="true"
     style="background:inherit;width:700px;height:auto;padding:10px;text-align: center;word-wrap:break-word" >
    <div style="color: #4E5D48 ;font-size: 18px">学生、教师、后台管理员入口均在同一个页面，登录后自动判断身份：
        <a href="/Homework/" target="_black">登录入口</a>。</div>
</div>
<br/>
<div class="easyui-panel" title="作 业 展 示 问 题" collapsible="true"
     style="background:inherit;width:700px;height:auto;padding:10px;word-wrap:break-word">
    <div style="color: #4E5D48 ;font-size: 18px">作业展示必须申请，在通过老师验证合格后，将给予展示。在"我要展示"处申请，申请时，必须将作业截图一并上传。必须为图片格式。</div>
</div>
<div class="easyui-panel" title="修 改 个 人 信 息" collapsible="true"
     style="background:inherit;width:700px;height:auto;padding:10px;word-wrap:break-word">
    <div style="color: #4E5D48 ;font-size: 18px">考虑到学生信息的唯一性，本网站不允许修改"邮箱"，"密码"以外的项，如若修改，必须向管理员修改。</div>
</div>
<br/>
<div class="easyui-panel" title="老 师 、 管 理 员 注 册 问 题" collapsible="false"
     style="background:inherit;width:700px;height:auto;padding:10px;text-align: center;word-wrap:break-word">
    <div style="color: #4E5D48 ;font-size: 18px">批阅作业老师需要去学校教务处登记注册，不允许在网站注册。（老师管理员用户注册跟学生注册代码类似，本Demo不在赘写。）唯一管理员及老师账户如下：<br>
    管理员：admin 密码：admin<br>张老师：tzhang 密码：zhang<br>李老师：tli&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码：li<br></div>
</div>
<br/>
<div class="easyui-panel" title="联 系 方 式 问 题" collapsible="true"
     style="background:inherit;width:700px;height:auto;padding:10px;word-wrap:break-word">
    <div style="color: #4E5D48 ;font-size: 18px">学生用户：在查询"我的作业"时可以查看或修改你提交时的联系方式，此联系方式会在老师用户查看作业时列出。如果你想联系批阅老师，可以在成绩查询处查看。<br>
        老师用户：你在下载学生作业列表中查看到学生作业对应的联系方式。</div>
</div>
<br/>
<div class="easyui-panel" title="系 统 使 用 说 明" collapsible="true"
     style="background:inherit;width:700px;height:auto;padding:10px;word-wrap:break-word">
    <div style="color: #4E5D48 ;font-size: 18px">此系统限制合作院校使用，外网访问仅用于测试，学校如若使用，请联系开发者，独立开发院校数据库及内网版本。</div>
</div>
<br/>
<div class="easyui-panel" title="其 他 问 题" collapsible="false"
     style="background:inherit;width:700px;height:auto;padding:10px;word-wrap:break-word">
    <div style="color: #4E5D48 ;font-size: 18px">老师用户可以管理所有申请展示的作业状态。</div>

</div>
<br/>

</body>
</html>