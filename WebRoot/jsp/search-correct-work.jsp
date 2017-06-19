<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/15
  Time: 22:54
  Info:批改作业
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
    }else if(!user_china_name.contains("老师")){
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
    <title>学 生 作 业</title>
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
        .btn {
            position: absolute;
            width: 120px;
            color: #414747;
            font-size: 16px;
            padding: 5px;
            margin-top: 30px;
            margin-left: -60px;
            text-decoration: none;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            /* box-shadow: 0.5px 0.5px 1px #414747; */
            border: solid #7F8585 1px;
            background: #D4D8D8;
        }

        .btn:hover {
            background: #FC091B;
            color: #fff;

        }

    </style>
    <script type="text/javascript">
        var jsondata = '<%=searchResult%>';
        var data = $.parseJSON(jsondata); //json格式化
        $(document).ready(function () {
            $("#dg").datagrid({
                width: '500px',
                height: 'auto',
                rownumbers: true,
                singleSelect: true,
                nowrap: true,
                fitColumns: true,
                toolbar:'#tb',
                columns: [[
                    {field: "workName", title: "作业名称", align: 'center'},
                    {field: "workInfo", title: "详情备注", align: 'center'},
                    {field: "workPhone", title: "联系电话", align: 'center'},
                    {field: "workDate", title: "上传日期", align: 'center'},
                    {
                        field: "workGrade", title: "作业得分", align: 'center',
                        styler: function(value,row,index){
                            if (value !=""){
                                return 'color:red;font-weight:600';
                            }
                        }
                    },
                    {field: "file", title: "作业", hidden: true},
                    {field: "userid", title: "学号", hidden: true},
                    {field: "id", title: "作业id", hidden: true},
                    {field: "user_china_name", title: "姓名", hidden: true},
                    {field: "profession", title: "专业", hidden: true},
                    {field: "classinfo", title: "班级", hidden: true},
                    {field: "eMail", title: "邮箱", hidden: true},
                    {
                        field: "file-format", title: "作业格式", hidden: true,align: 'center',
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
                            title: row.workName + '  批改打分',timeout:'2000', msg: '<a href="#" onclick="open_dlg()">' +
                            '<img style="width: 50px;margin-top: -20px" src="../images/icon_edit.png"></a>'
                        });
                    }
                }
            })
        });

        function open_dlg() {
            $('#dlg').dialog('open').dialog('setTitle','批 改 分 数');
            var row = $('#dg').datagrid('getSelected');
            $('#workid').val(row.id);
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
                document.getElementById("tip").innerHTML = "* 您没有学生向您上传作业";
            }
        }
        function checkNullForGrade(){
            var grade = document.getElementById("grade").value;
            var mess = document.getElementById("isnullForGrade");
            if (grade == "") {
                mess.innerHTML = "*分数不能为空";
                return false;
            } else if (grade <0 || grade>100) {
                mess.innerHTML = "*请输入0-100的数字";
                return false;
            } else {
                mess.innerHTML = "";
            }
        }

        function do_it(form) {
            if(form.grade.value==""){
                alert("分数不能为空");
                form.grade.focus();
                return false;
            }
            if(form.grade.value <0 ||form.grade.value >100){
                alert("请输入0-100的数字");
                form.grade.focus();
                return false;
            }
            return true;
        }
    </script>

</head>
<body style="padding-left:22%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" onclick="test()" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 8px">
    <img style="width: 10px;" src="../images/light.png">
    点击记录为学生作业打分。
</div>
<table id="dg" class="easyui-datagrid" toolbar="#toolbar">
</table>
<div id="tb" style="background: #F9F9F9;text-align: center" >
    <form action="/Homework/QueryWorkWithTeacher" method="post" >
        <input id="item_label"  name="item_label" value="correct_work" style="display: none">
        <span>作业名称:</span>
        <input id="item_workName" placeholder="检索关键字" name="item_workName" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <span>日期搜索:</span>
        <input id="item_date" placeholder="例如：05-20" name="item_date" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <input type="submit" value="搜索" style="border-radius:6px;line-height:16px;border:1px solid #ccc;background: #F9F9F9;">
    </form>
</div>

<div id="dlg" class="easyui-dialog" title="批改作业" style="background:inherit;width:400px;height:180px;padding:30px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" action="/Homework/ChangeUser" method="post" onsubmit="return do_it(this);">
        <div class="fitem">
            <input type="type" id="workid" name= "workid" class="box" style="display: none">
            <input type="text" id="grade" name= "grade" onblur="checkNullForGrade()" onkeyup="value=this.value.replace(/\D+/g,'')"
                   placeholder="请输入得分(数字1-100)" class="box">
        </div>
        <div id="isnullForGrade" name="isnullForGrade" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
        <input type="submit" class="btn" value="提交打分">
    </form>
</div>

</body>
</html>