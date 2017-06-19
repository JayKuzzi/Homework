<%@ page import="com.bb.dao.WorkShowDao" %><%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/15
  Time: 10:47
  Info:作业展示
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String resultSetToJson = "";
    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    resultSetToJson = WorkShowDao.resultSetToJson();
    if (user_china_name == null)
        returnChinaName = "未登录";
    else
        returnChinaName = user_china_name + "同学 ";
%>

<html>
<head>
    <title>优秀作业</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyui/demo/demo.css">
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        var jsondata = '<%=resultSetToJson%>';
        var data = $.parseJSON(jsondata); //json格式化

        function bodyload() {
            var chinaName = document.getElementsByTagName("p")[0].innerHTML;
            if (chinaName == "未登录") {
                alert("会话超时，请重新登录！");
                window.location.href = '/Homework';
            }else {
                if(data ==""){
                    $('#tt').tabs('add', {
                        title: "无优秀作业",
                        content: '<div style="padding-top:200px;color:red;margin-top:-16px;width:100%;height:100%;text-align: center;background: #EEF0F0">没有优秀作业，请上传作业并申请。</div>',
                        closable: false
                    });
                }else{
                    for (var i = 0; i < data.length; i++) {
                        var preview = data[i]["preview"];
                        var previewPath = preview.substring(preview.indexOf("/Homework"));
                        var workName = data[i]["workName"];
                        var user_china_name = data[i]["user_china_name"];
                        var workGrade = data[i]["workGrade"];
                        var profession = data[i]["profession"];
                        var classinfo = data[i]["classinfo"];
                        var content='<div style="padding-top:20px;margin-top:-16px;width:100%;height:100%;text-align: center;background: #EEF0F0"><p style="font-size: 16px;font-weight: 600;color: #F64C1B">'+workName+'<br>'+"作者："+user_china_name+'<br>'+"来自："+profession+"  "+classinfo+'<br>'+"  得分："+workGrade+'</p><img width="500px" src="'+previewPath+'"></div>';
                        $('#tt').tabs('add', {
                            title: workName,
                            content: content,
                            closable: false
                        });
                    }
                }
            }
        }

        $(function () {
            var index = 0;
            var t = $('#tt');
            var tabs = t.tabs('tabs');
            setInterval(function () {
                t.tabs('select', tabs[index].panel('options').title);
                index++;
                if (index >= tabs.length) {
                    index = 0;
                }
            }, 1500);
        });

    </script>
</head>
<body style="padding-left:17%;font-size: 12px;background: #EEF0F0;font-family: 微软雅黑;" onload="bodyload();">
<p hidden><%=returnChinaName%></p>
<div id="tt" class="easyui-tabs" style="width:700px;height:530px;background: #EEF0F0">
</div>
</body>
</html>
