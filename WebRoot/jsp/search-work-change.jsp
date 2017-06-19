<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/7
  Time: 15:18
  Info:搜索作业结果页（在修改作业界面）
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String searchResult = "";
    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null) {
        returnChinaName = "未登录";
    } else {
        returnChinaName = user_china_name + "欢迎您";
        try {
            searchResult= (String) request.getSession().getAttribute("searchResult");
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
        var jsondata = '<%=searchResult%>';
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
                    {field: "workDate", title: "修订日期", align: 'center'},
                    {field: "file", title: "作业下载", hidden: true},
                    {field: "teacherId", title: "老师id", hidden: true},
                    {field: "id", title: "id", hidden: true},
                    {
                        field: "file-format", title: "文件格式", align: 'center',
                        formatter: function (value, row, index) {
                            if (row) {
                                var diskPath =row.file;
                                var extionName =diskPath.substring(diskPath.lastIndexOf(".")+1);
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
                        $.messager.show({title: '作业 '+row.workName+' 修改',timeout:'2000', msg: '<a href="#" onclick="open_dlg()">' +
                        '<img style="width: 50px;margin-top: -20px" src="../images/icon_edit.png"></a>'});
                    }
                }
            })
        });

        function open_dlg() {
            $('#dlg').dialog('open').dialog('setTitle','修 改 作 业 信 息');
            var row = $('#dg').datagrid('getSelected');
            $('#change_workName').val(row.workName);
            $('#change_workTeacher').val(row.teacherId);
            $('#change_workPhone').val(row.workPhone);
            $('#change_workMess').val(row.workInfo);
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
                document.getElementById("tip").innerHTML = "* 没 有 所 搜 到 任 何 记 录";
            }
        }

        function do_it(form) {
            if (form.change_workName.value == "") {
                alert("作业名称不能为空！");
                form.change_workName.focus();
                return false;
            }
            if (form.change_workName.value.length < 2) {
                alert("作业名称至少2位！");
                form.change_workName.focus();
                return false;
            }
            if (form.change_workPhone.value == "") {
                alert("联系方式不能为空！");
                form.change_workPhone.focus();
                return false;
            }
            if (form.change_workPhone.value.length !=11) {
                alert("请输入有效的手机号！");
                form.change_workPhone.focus();
                return false;
            }
        }
    </script>

</head>
<body style="padding-left:15%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 38px">
    <img style="width: 10px;" src="../images/light.png">
        修改记录时，若不选择文件，则不修改原本文件。</div>
<table id="dg" class="easyui-datagrid" toolbar="#toolbar">
</table>
<div id="tb" style="background: #F9F9F9;text-align: center" >
    <form action="/Homework/QueryWork" method="post" >
        <input id="item_label"  name="item_label" value="change_work" style="display: none">
        <span>作业名称:</span>
        <input id="item_workName" placeholder="检索关键字" name="item_workName" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <span>日期搜索:</span>
        <input id="item_date" placeholder="例如：05-20" name="item_date" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <input type="submit" value="搜索" style="border-radius:6px;line-height:16px;border:1px solid #ccc;background: #F9F9F9;">
    </form>
</div>
<div id="dlg" class="easyui-dialog" title="作业信息" style="background:inherit;width:400px;height:280px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/ChangeWork" id="fm" method="post" enctype="multipart/form-data" onsubmit="return do_it(this);">
        <input id="cid" name= "cid" style="display: none" class="easyui-validatebox" required="true">
        <div class="fitem">
            <label>作业名称:</label>
            <input id="change_workName" name= "change_workName" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>选择老师:</label>
            <select onblur="checkNullForTeacher()" style="width: 150px" name= "change_workTeacher" id="change_workTeacher">
                <option value="1">张老师</option>
                <option value="2">李老师</option>
                <option value="3">王老师</option>
            </select>
        </div>
        <div class="fitem">
            <label>联系电话:</label>
            <input onkeyup="value=this.value.replace(/\D+/g,'')" id="change_workPhone" name= "change_workPhone" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>作业文件:</label>
            <input type="file" name= "change_file" id="change_file" style="width:150px;margin-top: 7px">
        </div>
        <div class="fitem">
            <label>备注信息:</label>
            <input id="change_workMess" name= "change_workMess" class="easyui-validatebox" style="height: 50px;margin-top: 7px" required="true">
        </div>
        <input type="submit" style="margin-top: 10px;background: red;color: #ffffff;width: 100px;height: 30px" value="确定修改">
    </form>
</div>
</body>
</html>