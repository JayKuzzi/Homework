<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/16
  Time: 11:23
  Info:修改学生
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bb.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userJson = "";
    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null) {
        returnChinaName = "未登录";
    } else if(!user_china_name.contains("管理员")){
        returnChinaName = "未登录";
    }else {
        returnChinaName = user_china_name ;
        try {
            userJson = UserDao.resultWithStudent();
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
    <title>修 改 作 业</title>
    <script type="text/javascript">
        var jsondata = '<%=userJson%>';
        var data = $.parseJSON(jsondata); //json格式化
        $(document).ready(function () {
            $("#dg").datagrid({
                width: '550px',
                height: 'auto',
                rownumbers: true,
                singleSelect: true,
                nowrap: true,
                fitColumns: true,
                toolbar:'#tb',
                columns: [[
                    {field: "user_china_name", title: "姓名", align: 'center'},
                    {field: "userid", title: "学号", align: 'center'},
                    {field: "profession", title: "专业", align: 'center'},
                    {field: "classinfo", title: "班级", align: 'center',},
                    {field: "eMail", title: "邮箱", align: 'center'},
                    {field: "username", title: "登录名", align: 'center'},
                    {field: "password", title: "密码", align: 'center'},
                    {field: "id", title: "数据库id", hidden:'true'}
                ]]
            })
            $("#dg").datagrid('loadData', data);//加载数据，不加表格数据不会显示

        });

        $(function () {
            $('#dg').datagrid({
                onClickRow: function (index, data) {
                    var row = $('#dg').datagrid('getSelected');
                    if (row) {
                        $.messager.show({title: '修改 '+row.user_china_name+' 信息',timeout:'2000', msg: '<a href="#" onclick="open_dlg()">' +
                        '<img style="width: 50px;margin-top: -20px" src="../images/icon_edit.png"></a>'});
                    }
                }
            })
        });

        function open_dlg() {
            $('#dlg').dialog('open').dialog('setTitle','修 改 学 生 信 息');
            var row = $('#dg').datagrid('getSelected');
            $('#cid').val(row.id);
            $('#username').val(row.username);
            $('#user_china_name').val(row.user_china_name);
            $('#userid').val(row.userid);
            $('#profession').val(row.profession);
            $('#classinfo').val(row.classinfo);
            $('#eMail').val(row.eMail);
            $('#password').val(row.password);
        }
        function bodyload() {
            var chinaName = document.getElementsByTagName("p")[0].innerHTML;
            if (chinaName == "未登录") {
                alert("会话超时，请重新登录！");
                window.location.href = '/Homework';
            }
        }

        function test() {
            if (jsondata.length <=2) {
                document.getElementById("tip").innerHTML = "*数 据 库 中 没 有 任 何 学 生";
            }
        }


        function do_it(form) {
            if (form.user_china_name.value == "") {
                alert("姓名不能为空！");
                form.user_china_name.focus();
                return false;
            }
            if (form.user_china_name.value.length < 2) {
                alert("姓名至少2位！");
                form.user_china_name.focus();
                return false;
            }
            if (form.userid.value == "") {
                alert("学号不能为空");
                form.userid.focus();
                return false;
            }
            if (form.userid.value.length < 8) {
                alert("学号至少8位！");
                form.userid.focus();
                return false;
            }
            var myreg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
            if (!myreg.test(form.eMail.value)) {
                alert("请输入有效的邮箱");
                form.eMail.focus();
                return false;
            }
            if (form.password.value == "") {
                alert("密码不能为空！");
                form.password.focus();
                return false;
            }
            if (form.password.value.length < 6) {
                alert("密码至少6位！");
                form.password.focus();
                return false;
            }
        }
    </script>
    <style type="text/css">
        .box {
            font-size: 12px;
            border-radius: 0px;
            margin-bottom: 10px;
            border: 1px solid #7F8585;
            width: 180px;
            height: 20px;
            background-color: #D2D6D6;
        }
    </style>
</head>
<body style="padding-left:22%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 38px">
    <img style="width: 10px;" src="../images/light.png">
        点 击 修 改 学 生 信 息 ，登 录 名 不 可 修 改 。</div>
<table id="dg" class="easyui-datagrid">
</table>
<div id="dlg" class="easyui-dialog" title="作业信息" style="background:inherit;width:400px;height:320px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/ChangeUser" id="fm" method="post" onsubmit="return do_it(this);">
        <div style="color: red;font-weight: 500;margin-bottom: 3px">登录名唯一，不可修改。</div>
        <input id="cid" name= "cid" style="display: none" class="easyui-validatebox" required="true">
        <div class="fitem">
            <input type="button" id="username" name= "username" class="box" required="true">
        </div>
        <div class="fitem">
            <label>姓名:</label>
            <input onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))" id="user_china_name" name= "user_china_name" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>学号:</label>
            <input onkeyup="value=this.value.replace(/\D+/g,'')" id="userid" name= "userid" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>专业:</label>
            <select id="profession" name= "profession" style="width:150px;">
                <option value="信息管理">信息管理</option>
                <option value="会计专业">会计专业</option>
                <option value="金融专业">金融专业</option>
            </select>
        </div>
        <div class="fitem">
            <label>班级:</label>
            <select id="classinfo" name= "classinfo" style="width:150px;">
                <option value="一班">一班</option>
                <option value="二班">二班</option>
                <option value="三班">三班</option>
            </select>
        </div>
        <div class="fitem">
            <label>邮箱:</label>
            <input id="eMail" name= "eMail" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>密码:</label>
            <input id="password" name= "password" class="easyui-validatebox" required="true">
        </div>
        <input type="submit" style="margin-top: 10px;background: red;color: #ffffff;width: 100px;height: 30px" value="确定修改">
    </form>
</div>
</body>
</html>