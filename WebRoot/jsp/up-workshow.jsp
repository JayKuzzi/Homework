<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/15
  Time: 18:54
  Info:我要展示
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
    <title>我 要 展 示</title>
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
                    {field: "name", title: "批改老师", align: 'center',},
                    {field: "phone", title: "联系老师", align: 'center',},
                    {field: "workDate", title: "上传日期", align: 'center'},
                    {
                        field: "workGrade", title: "作业得分", align: 'center',
                        styler: function(value,row,index){
                            if (value !=""){
                                return 'color:red';
                            }
                        }
                    },
                    {field: "id", title: "作业id", align: 'center',hidden: true}
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
                            title: '作业 ' + row.workName + ' 申请展示',timeout:'2000', msg: '<a href="#" onclick="up_show()">' +
                            '<img style="width: 50px;margin-top: -20px" src="../images/up-show.png"></a>'
                        });
                    }
                }
            })
        });
        function up_show(){
            $('#dlg').dialog('open').dialog('setTitle','申 请 优 秀 作 业');
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
                document.getElementById("tip").innerHTML = "* 您 还 没 有 上 传 任 何 作 业";
            }
        }

        function do_it(form) {
            if (form.showFile.value == "") {
                alert("您还未选择截图！");
                return false;
            }
        }

        function getPhotoSize(obj){
            var photoExt=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
            if(!/\.(jpg|png|JPG|PNG)$/.test(photoExt)){
                alert("请上传后缀名为jpg、png的图片!");
                obj.value="";
                return false;
            }
            var fileSize = 0;
            var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
            if (isIE && !obj.files) {
                var filePath = obj.value;
                var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
                var file = fileSystem.GetFile (filePath);
                fileSize = file.Size;
            }else {
                fileSize = obj.files[0].size;
            }
            fileSize=Math.round(fileSize/1024*100)/100; //单位为KB
            if(fileSize>=1024*1){
                alert("截图最大尺寸为1M，请重新选择!");
                obj.value="";
                return false;
            }
        }
    </script>

</head>
<body style="padding-left:15%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();test()">
<p hidden><%=returnChinaName%></p>
<div id="tip" onclick="test()" style="color: #FC091B;font-weight: 500;font-size: 12px;margin: 30px 0px 8px 38px">
    <img style="width: 10px;" src="../images/light.png">
    展示作业必须上传作业截图，并且通过老师同意方可展示！
</div>
<table id="dg" class="easyui-datagrid" toolbar="#toolbar">
</table>
<div id="tb" style="background: #F9F9F9;text-align: center" >
    <form action="/Homework/QueryWork" method="post" >
        <input id="item_label"  name="item_label" value="up-show" style="display: none">
        <span>作业名称:</span>
        <input id="item_workName" placeholder="检索关键字" name="item_workName" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <span>日期搜索:</span>
        <input id="item_date" placeholder="例如：05-20" name="item_date" style="line-height:20px;border:1px solid #ccc;background: #F9F9F9">
        <input type="submit" value="搜索" style="border-radius:6px;line-height:16px;border:1px solid #ccc;background: #F9F9F9;">
    </form>
</div>
<div id="dlg" class="easyui-dialog" title="上传展示截图" style="background:inherit;width:400px;height:180px;padding:22px 20px;text-align: center"
     closed="true" buttons="#dlg-buttons">
    <form action="/Homework/UpWorkShow" id="fm" method="post" enctype="multipart/form-data" onsubmit="return do_it(this);">
        <input id="workid" name= "workid" style="display: none" class="easyui-validatebox" required="true">
        <div style="color: red">请上传jpg、png图片格式，文件大小控制在1M以内</div>
        <div class="fitem">
            <label>选择截图:</label>
            <input type="file" name= "showFile" id="showFile" onchange="getPhotoSize(this)" style="width:150px;margin-top: 7px">
        </div>
        <input type="submit" style="margin-top: 10px;background: red;color: #ffffff;width: 100px;height: 30px" value="我要展示">
    </form>
</div>
</body>
</html>