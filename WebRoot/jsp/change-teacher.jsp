<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/16
  Time: 14:30
  Info:修改老师
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bb.dao.UserDao" %>
<%@ page import="com.bb.dao.TeacherDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String result = "";
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
            result = TeacherDao.resultWithTeacher();
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
        var jsondata = '<%=result%>';
        var data = $.parseJSON(jsondata); //json格式化
        $(document).ready(function () {
            $("#dg").datagrid({
                width: '250px',
                height: 'auto',
                rownumbers: true,
                singleSelect: true,
                nowrap: true,
                fitColumns: true,
                toolbar:'#tb',
                columns: [[
                    {field: "name", title: "姓名", align: 'center'},
                    {field: "phone", title: "手机", align: 'center'},
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
                        $.messager.show({title: '修改 '+row.name+' 手机',timeout:'2000', msg: '<a href="#" onclick="open_dlg()">' +
                        '<img style="width: 50px;margin-top: -20px" src="../images/icon_edit.png"></a>'});
                    }
                }
            })
        });

        function open_dlg() {
            $('#dlg').dialog('open').dialog('setTitle','修 改 老 师 信 息');
            var row = $('#dg').datagrid('getSelected');
            $('#cid4').val(row.id);
            $('#name').val(row.name);
            $('#phone').val(row.phone);
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
            if (form.phone.value == "") {
                alert("手机不能为空！");
                form.phone.focus();
                return false;
            }
            if (form.phone.value.length !=11) {
                alert("请输入有效的手机号！");
                form.phone.focus();
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
<body style="padding-left:35%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 38px">
    <img style="width: 10px;" src="../images/light.png">
        点 击 修 改 老 师 信 息 。</div>
<table id="dg" class="easyui-datagrid">
</table>
<div id="dlg" class="easyui-dialog" title="修改老师" style="background:inherit;width:400px;height:200px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/ChangeUser" id="fm" method="post" onsubmit="return do_it(this);">
        <div style="color: red;font-weight: 500;margin-bottom: 3px">老师姓名唯一，不可修改。</div>
        <input id="cid4" name= "cid4" style="display: none" class="easyui-validatebox" required="true">
        <div class="fitem">
            <input type="button" id="name" name= "name" class="box" required="true">
        </div>
        <div class="fitem">
            <label>手机:</label>
            <input onkeyup="value=this.value.replace(/\D+/g,'')" id="phone" name= "phone" class="easyui-validatebox" required="true">
        </div>
        <input type="submit" style="margin-top: 10px;background: red;color: #ffffff;width: 100px;height: 30px" value="确定修改">
    </form>
</div>
</body>
</html>