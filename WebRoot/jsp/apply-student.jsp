<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/16
  Time: 14:03
  Info:学生申请页
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bb.dao.UserDao" %>
<%@ page import="com.bb.dao.ApplyChangeDao" %>
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
            result= ApplyChangeDao.resultWithApply();
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
    <title>学生申请修改项</title>
    <script type="text/javascript">
        var jsondata = '<%=result%>';
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
                    {field: "tittle", title: "申请修改项", align: 'center'},
                    {field: "content", title: "申请修内容", align: 'center',},
                    {field: "state", title: "状态", align: 'center'},
                    {field: "id", title: "申请id", hidden:'true'},
                ]]
            })
            $("#dg").datagrid('loadData', data);//加载数据，不加表格数据不会显示

        });

        $(function () {
            $('#dg').datagrid({
                onClickRow: function (index, data) {
                    var row = $('#dg').datagrid('getSelected');
                    if (row) {
                        $.messager.show({title: '允许 '+row.user_china_name+' 修改',timeout:'2000', msg: '<a href="#" onclick="open_dlg()">' +
                        '<img style="width: 50px;margin-top: -20px" src="../images/icon_edit.png"></a>'});
                    }
                }
            })
        });

        function open_dlg() {
            $('#dlg').dialog('open').dialog('setTitle','申 请 修 改 信 息');
            var row = $('#dg').datagrid('getSelected');
            $('#cid3').val(row.id);
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
                document.getElementById("tip").innerHTML = "*数 据 库 中 没 有 申 请";
            }
        }
    </script>
</head>
<body style="padding-left:22%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 38px">
    <img style="width: 10px;" src="../images/light.png">
        （请管理员去修改学生内手动修改，因自动修改代码与其他功能相似，不在赘写。）</div>
<table id="dg" class="easyui-datagrid">
</table>
<div id="dlg" class="easyui-dialog" title="学生申请" style="background:inherit;width:200px;height:100px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/ChangeUser" id="fm" method="post" style="margin-top: -14px">
        <input id="cid3" name= "cid3" style="display: none" class="easyui-validatebox" required="true">
        <input type="submit" style="margin-top: 10px;background: red;color: #ffffff;width: 100px;height: 30px" value="给予通过">
    </form>
</div>
</body>
</html>