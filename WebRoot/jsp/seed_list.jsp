<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/16
  Time: 13:51
  Info:反馈信息
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bb.dao.UserDao" %>
<%@ page import="com.bb.dao.FeedBackDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String resultWithFeed = "";
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
            resultWithFeed = FeedBackDao.resultWithFeed();
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
    <title>反馈列表</title>
    <script type="text/javascript">
        var jsondata = '<%=resultWithFeed%>';
        var data = $.parseJSON(jsondata); //json格式化
        $(document).ready(function () {
            $("#dg").datagrid({
                width: '430px',
                height: 'auto',
                rownumbers: true,
                singleSelect: true,
                nowrap: true,
                fitColumns: true,
                toolbar:'#tb',
                columns: [[
                    {field: "user_china_name", title: "姓名", align: 'center'},
                    {field: "eMail", title: "邮箱", align: 'center'},
                    {field: "tittle", title: "标题", align: 'center'},
                    {field: "content", title: "内容", hidden:'true'},
                ]]
            })
            $("#dg").datagrid('loadData', data);//加载数据，不加表格数据不会显示

        });

        $(function () {
            $('#dg').datagrid({
                onClickRow: function (index, data) {
                    var row = $('#dg').datagrid('getSelected');
                    if (row) {
                        $.messager.show({title: '查看 '+row.user_china_name+' 反馈内容',timeout:'2000', msg: '<a href="#" onclick="open_dlg()">' +
                        '<img style="width: 50px;margin-top: -20px" src="../images/icon-more.png"></a>'});
                    }
                }
            })
        });

        function open_dlg() {
            $('#dlg').dialog('open').dialog('setTitle','反 馈 内 容');
            var row = $('#dg').datagrid('getSelected');
            $('#name').val(row.user_china_name);
            $('#eMail').val(row.eMail);
            $('#tittle').val(row.tittle);
            $('#content').val(row.content);
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
                document.getElementById("tip").innerHTML = "*数 据 库 中 没 有 任 何 反 馈";
            }
        }
    </script>
    <style type="text/css">
        .box {
            font-size: 19px;
            border-radius: 0px;
            margin-bottom: 10px;
            text-align: center;
            border: 1px solid #7F8585;
            width: 220px;
            height: 35px;
            background-color: #D2D6D6;

        }


        .box2 {
            word-wrap: break-word;
            font-size: 14px;
            border-radius: 0px;
            margin-bottom: 10px;
            text-align: center;
            border: 1px solid #7F8585;
            width: 220px;
            height: 100px;
            background-color: #D2D6D6;

        }
    </style>
</head>
<body style="padding-left:25%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 38px">
    <img style="width: 10px;" src="../images/light.png">
        点 击 查 看 反 馈 详 情</div>
<table id="dg" class="easyui-datagrid">
</table>
<div id="dlg" class="easyui-dialog" title="详情" style="background:inherit;width:500px;height:420px;padding:52px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form id="fm"  style="margin-top: -14px">
        <table align="center">
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">姓名：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" name="name" id="name" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">联系方式：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" name="eMail" id="eMail" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">反馈标题：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" name="tittle" id="tittle" class="box"></td>
            </tr>
            <tr>
                <td>
                    <div style="color: #ff0000 ; font-size: 10px ;margin-top: -11px">反馈内容：</div>
                </td>
            </tr>
            <tr>
                <td><input type="button" name="content" id="content" class="box2"></td>
            </tr>

        </table>
        <input type="submit" style="margin-top: 10px;background: red;color: #ffffff;width: 100px;height: 30px" value="确定">
    </form>
</div>
</body>
</html>