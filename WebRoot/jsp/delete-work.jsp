<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/7
  Time: 18:53
  Info:删除作业
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
    <title>删 除 作 业</title>
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
                    {field: "workName", title: "作业名称", align: 'center'},
                    {field: "workInfo", title: "详情备注", align: 'center'},
//                    {
//                        field: "workGrade", title: "作业得分", align: 'center'
////                        formatter: function (value, row, index) {
////                        if (row.name == "张老师") {
////                            return 123;
////                        } else {
////                            return value;
////                        }
//                    },
                    {field: "workPhone", title: "联系电话", align: 'center'},
                    {field: "name", title: "批改老师", align: 'center',},
                    {field: "workDate", title: "上传日期", align: 'center'},
                    {field: "file", title: "作业下载", hidden: true},
                    {field: "id", title: "id", hidden: true},

                    {
                        field: "file-format", title: "文件格式", align: 'center',
                        formatter: function (value, row, index) {
                            if (row) {
                                var diskPath = row.file;
                                var extionName = diskPath.substring(diskPath.lastIndexOf(".") + 1);
                                return extionName;
                            } else {
                                return value;
                            }
                        }
                    }
                ]]
            })
            $("#dg").datagrid('loadData', data);//加载数据，不加表格数据不会显示
        });

        $(function () {
            $('#dg').datagrid({
                onClickRow: function (index, data) {
                    var row = $('#dg').datagrid('getSelected');
                    var diskPath = row.file;
                    var downPath = diskPath.substring(diskPath.indexOf("/Homework"));
                    if (row) {
                        $.messager.show({
                            title: '作业 ' + row.workName + ' 删除',timeout:'2000', msg: '<a href="#" onclick="delete_item()">' +
                            '<img style="width: 50px;margin-top: -20px" src="../images/icon_delete.png"></a>'
                        });
                    }
                }
            })
        });

        function delete_item(){
            $('#dlg').dialog('open').dialog('setTitle','确 定 删 除 作 业 ');
            var row = $('#dg').datagrid('getSelected');
            $('#cid').val(row.id);

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
                document.getElementById("tip").innerHTML = "* 您 还 没 有 上 传 任 何 作 业";
            }
        }


    </script>

</head>
<body style="padding-left:15%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" onclick="test()" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 38px">
    <img style="width: 10px;" src="../images/light.png">
    点 击 删 除 作 业。
</div>
<table id="dg" class="easyui-datagrid" toolbar="#toolbar">
</table>
<div id="tb" style="background: #F9F9F9;text-align: center" >
    <form action="/Homework/QueryWork" method="post" >
        <input id="item_label"  name="item_label" value="delete_work" style="display: none">
        <span>作业名称:</span>
        <input id="item_workName" placeholder="检索关键字" name="item_workName" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <span>日期搜索:</span>
        <input id="item_date" placeholder="例如：05-20" name="item_date" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <input type="submit" value="搜索" style="border-radius:6px;line-height:16px;border:1px solid #ccc;background: #F9F9F9;">
    </form>
</div>
<div id="dlg" class="easyui-dialog" title="确定删除" style="background:inherit;width:200px;height: 2px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/DeleteWork" id="fm" method="post" style="margin-top: -14px">
        <input id="cid" name= "cid" style="display: none" class="easyui-validatebox" required="true">
        <input type="submit" style="background: red;color: #ffffff;width: 100px;height: 30px" value="确定删除">
    </form>
</div>
</body>
</html>