<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/7
  Time: 17:54
  Info:我的作业
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
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <base href="${ctx}">
    <title>我 的 作 业</title>
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
                            title: '作业 ' + row.workName + ' 下载',timeout:'2000', msg: '<a href="' + downPath + '" target="_blank">' +
                            '<img style="width: 50px;margin-top: -20px" src="../images/down.png"></a>'
                        });
                    }
                }
            })
        });
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
    文本文档、图片文件点击下载直接打开，其他类型将启用下载！
</div>
<table id="dg" class="easyui-datagrid" toolbar="#toolbar">
</table>
<div id="tb" style="background: #F9F9F9;text-align: center" >
    <form action="/Homework/QueryWork" method="post" >
        <input id="item_label"  name="item_label" value="my_work" style="display: none">
        <span>作业名称:</span>
        <input id="item_workName" placeholder="检索关键字" name="item_workName" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <span>日期搜索:</span>
        <input id="item_date" placeholder="例如：05-20" name="item_date" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <input type="submit" value="搜索" style="border-radius:6px;line-height:16px;border:1px solid #ccc;background: #F9F9F9;">
    </form>
</div>
</body>
</html>