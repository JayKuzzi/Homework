<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/15
  Time: 00:52
  Info:学生作业展示申请
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.bb.dao.WorkShowDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String resultAllShow = "";
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
            resultAllShow = WorkShowDao.resultAllShow();
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
        .box2 {
            margin-top: 10px;
            font-size: 15px;
            border-radius: 0px;
            margin-bottom: 10px;
            text-align: center;
            border: 1px solid #7F8585;
            width: 120px;
            height: 35px;
            background-color: #D2D6D6;
        }
        .btn {
            position: absolute;
            width: 120px;
            color: #414747;
            font-size: 16px;
            padding: 5px;
            margin-top: 10px;
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
        var jsondata = '<%=resultAllShow%>';
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
                    {field: "preview", title: "作业截图", hidden: true},
                    {field: "id", title: "申请表id", hidden: true},
                    {field: "state", title: "状态"},
                    {field: "user_china_name", title: "姓名", hidden: true},
                    {field: "profession", title: "专业", hidden: true},
                    {field: "classinfo", title: "班级", hidden: true},
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
                            title: '打开  '+row.workName + '  截图',timeout:'2000', msg: '<a href="#" onclick="open_dlg()">' +
                            '<img style="width: 50px;margin-top: -20px" src="../images/icon_pic.png"></a>'
                        });
                    }
                }
            })
        });

        function open_dlg() {
            $('#dlg').dialog('open').dialog('setTitle','申 请 详 情');
            var row = $('#dg').datagrid('getSelected');
            var preview = row.preview;
            var previewPath = preview.substring(preview.indexOf("/Homework"));
            $('#applyId').val(row.id);
            document.getElementById("showName").innerHTML=row.workName+'<br>作者：'+row.user_china_name+'<br>来自：'+row.profession+'  '+row.classinfo;
            $('#pic').attr('src',previewPath);
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
                document.getElementById("tip").innerHTML = "* 没有任何申请记录";
            }
        }

        function do_it(form) {
            if(form.changeState.value=="请选择状态") {
                alert("请选择状态");
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
    点击查看学生申请详情。
</div>
<table id="dg" class="easyui-datagrid">
</table>

<div id="dlg" class="easyui-dialog" title="申请详情" style="background:inherit;width:700px;height:550px;padding:10px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" action="/Homework/ChangeUser" method="post" onsubmit="return do_it(this);">
        <div class="fitem">
            <input type="type" id="applyId" name= "applyId" class="box" style="display: none">
            <div id="showName" name= "showName" style="font-weight: 600;font-size: 14px;color: red;margin-bottom: 10px"></div>
            <img id="pic" name= "pic" src="" style="width: 500px">
            <br>
            <select name="changeState" id="changeState" class="box2">
                <option value="请选择状态">请选择状态</option>
                <option value="已通过">通过</option>
                <option value="未通过">下架</option>
            </select>
        </div>
        <input type="submit" class="btn" value="提交">
    </form>
</div>

</body>
</html>