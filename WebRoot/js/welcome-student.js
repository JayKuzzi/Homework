var btn1, btn2, btn3, btn4, btn5, btn6;
function bodyload() {
    btn1 = document.getElementById("btn1");
    btn2 = document.getElementById("btn2");
    btn3 = document.getElementById("btn3");
    btn4 = document.getElementById("btn4");
    btn5 = document.getElementById("btn5");
    btn6 = document.getElementById("btn6");

    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    }
}

function work() {
    btn1.style.backgroundColor = "#4E5D48";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "inherit";
    btn5.style.backgroundColor = "inherit";
    btn6.style.backgroundColor = "inherit";
    btn1.style.color = "white";
    btn2.style.color = "#414747";
    btn3.style.color = "#414747";
    btn4.style.color = "#414747";
    btn5.style.color = "#414747";
    btn6.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else {
        document.getElementById("work").style.display = "";
        document.getElementById("show").style.display = "none";
        document.getElementById("me").style.display = "none";
        document.getElementById("question").style.display = "none";
    }

    // document.getElementById("west").innerHTML = "<iframe src='' frameBorder='0' width='900' scrolling='no' height='900'></iframe>";
}


function grade() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "#4E5D48";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "inherit";
    btn5.style.backgroundColor = "inherit";
    btn6.style.backgroundColor = "inherit";
    btn1.style.color = "#414747";
    btn2.style.color = "white";
    btn3.style.color = "#414747";
    btn4.style.color = "#414747";
    btn5.style.color = "#414747";
    btn6.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('成绩查询', '/Homework/jsp/grade.jsp');
}

function show() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "#4E5D48";
    btn4.style.backgroundColor = "inherit";
    btn5.style.backgroundColor = "inherit";
    btn6.style.backgroundColor = "inherit";

    btn1.style.color = "#414747";
    btn2.style.color = "#414747";
    btn3.style.color = "white";
    btn4.style.color = "#414747";
    btn5.style.color = "#414747";
    btn6.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else {
        document.getElementById("work").style.display = "none";
        document.getElementById("show").style.display = "";
        document.getElementById("me").style.display = "none";
        document.getElementById("question").style.display = "none";
    }

}

function me() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "#4E5D48";
    btn5.style.backgroundColor = "inherit";
    btn6.style.backgroundColor = "inherit";

    btn1.style.color = "#414747";
    btn2.style.color = "#414747";
    btn3.style.color = "#414747";
    btn4.style.color = "white";
    btn5.style.color = "#414747";
    btn6.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    }
    {
        document.getElementById("work").style.display = "none";
        document.getElementById("show").style.display = "none";
        document.getElementById("me").style.display = "";
        document.getElementById("question").style.display = "none";
    }
}

function question() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "inherit";
    btn5.style.backgroundColor = "#4E5D48";
    btn6.style.backgroundColor = "inherit";

    btn1.style.color = "#414747";
    btn2.style.color = "#414747";
    btn3.style.color = "#414747";
    btn4.style.color = "#414747";
    btn5.style.color = "white";
    btn6.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else {
        document.getElementById("work").style.display = "none";
        document.getElementById("show").style.display = "none";
        document.getElementById("me").style.display = "none";
        document.getElementById("question").style.display = "";
    }

}
function about() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "inherit";
    btn5.style.backgroundColor = "inherit";
    btn6.style.backgroundColor = "#4E5D48";

    btn1.style.color = "#414747";
    btn2.style.color = "#414747";
    btn3.style.color = "#414747";
    btn4.style.color = "#414747";
    btn5.style.color = "#414747";
    btn6.style.color = "white";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('联系作者', '/Homework/jsp/author.jsp');
}

function upWork() {
    var btn_list = document.getElementById("work").getElementsByTagName("input");
    btn_list[0].style.color = "white";
    btn_list[0].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=0){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }
    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('上传作业', '/Homework/jsp/up-work.jsp');

}

function findWork() {
    var btn_list = document.getElementById("work").getElementsByTagName("input");
    btn_list[1].style.color = "white";
    btn_list[1].style.background = "#4E5D49";

    for (var i = 0; i < btn_list.length; i++) {
        if(i!=1){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }
    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('查询作业', '/Homework/jsp/my-work.jsp');
}

function deleteWork() {
    var btn_list = document.getElementById("work").getElementsByTagName("input");
    btn_list[2].style.color = "white";
    btn_list[2].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=2){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('删除作业', '/Homework/jsp/delete-work.jsp');
}


function changeWork() {
    var btn_list = document.getElementById("work").getElementsByTagName("input");
    btn_list[3].style.color = "white";
    btn_list[3].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=3){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('修改作业', '/Homework/jsp/change-work.jsp');
}


function myInfo() {
    var btn_list = document.getElementById("me").getElementsByTagName("input");
    btn_list[0].style.color = "white";
    btn_list[0].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=0){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('详细信息', '/Homework/jsp/my-info.jsp');
}

function passChange() {
    var btn_list = document.getElementById("me").getElementsByTagName("input");
    btn_list[1].style.color = "white";
    btn_list[1].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=1){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        open_dlg();
}
function emailChange() {
    var btn_list = document.getElementById("me").getElementsByTagName("input");
    btn_list[2].style.color = "white";
    btn_list[2].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=2){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        open_dlg2();
}
function otherChange() {
    var btn_list = document.getElementById("me").getElementsByTagName("input");
    btn_list[3].style.color = "white";
    btn_list[3].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=3){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        open_dlg3();
}


function question_list() {
    var btn_list = document.getElementById("question").getElementsByTagName("input");
    btn_list[0].style.color = "white";
    btn_list[0].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=0){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('常见问题', '/Homework/jsp/question_list.jsp');
}

function my_question() {
    var btn_list = document.getElementById("question").getElementsByTagName("input");
    btn_list[1].style.color = "white";
    btn_list[1].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=1){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('我要反馈', '/Homework/jsp/seedback.jsp');
}



function workShow() {
    var btn_list = document.getElementById("show").getElementsByTagName("input");
    btn_list[0].style.color = "white";
    btn_list[0].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=0){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('优秀作业', '/Homework/jsp/workshow.jsp');
}


function upShow() {
    var btn_list = document.getElementById("show").getElementsByTagName("input");
    btn_list[1].style.color = "white";
    btn_list[1].style.background = "#4E5D49";
    for (var i = 0; i < btn_list.length; i++) {
        if(i!=1){
            btn_list[i].style.color = "#414747";
            btn_list[i].style.background = "#D4D8D8";
        }

    }
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('我要展示', '/Homework/jsp/up-workshow.jsp');
}

function showLeftTime() {
    var now = new Date();
    var year = now.getYear();
    var month = now.getMonth()+1;
    var day = now.getDate();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    minutes = extra(minutes);
    seconds = extra(seconds);
    month = extra(month);
    day = extra(day);

    document.getElementById("time").innerHTML = hours + ":" + minutes + ":" + seconds + "";
    document.getElementById("time2").innerHTML = 2017 + "-" + month + "-" + day + "";
    //一秒刷新一次显示时间
    var timeID = setTimeout(showLeftTime, 1000);
}

function extra(x) {
    //如果传入数字小于10，数字前补一位0。
    if (x < 10) {
        return "0" + x;
    }
    else {
        return x;
    }
}


function refresh_once() {
    location.reload();
}

//添加tabs
function addTab(title, url) {
    if ($('#tt').tabs('exists', title)){
        $('#tt').tabs('select', title);
        var current_tab = $('#tt').tabs('getSelected');
        $('#tt').tabs('update',{
            tab:current_tab,
                options : {
                 content :'<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>'
            }
        });
    } else {
        var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
        $('#tt').tabs('add', {
            title: title,
            content: content,
            closable: true
        });
    }
}


$(function () {
    $('#tt').tabs({
        onSelect: function(title,index){
            var current_tab = $('#tt').tabs('getSelected');
            var url = $(current_tab.panel('options').content).attr('src');
            if(title != "欢迎页"){
                $('#tt').tabs('update',{
                    tab:current_tab,
                    options : {
                        content :'<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>'}
                });
            }
        }
    })
});


function open_dlg() {
    $('#dlg').dialog('open').dialog('setTitle','修 改 密 码');
}


function open_dlg2() {
    $('#dlg2').dialog('open').dialog('setTitle','修 改 邮 箱');
}


function open_dlg3() {
    $('#dlg3').dialog('open').dialog('setTitle','申 请 修 改');
}


function formChangePass(form) {
    if (form.ago_password.value == "") {
        alert("愿密码不能为空！");
        form.ago_password.focus();
        return false;
    }
    if (form.new_password.value == "") {
        alert("新密码不能为空！");
        form.new_password.focus();
        return false;
    }
    if (form.new_password.value.length < 6) {
        alert("新密码至少6位！");
        form.new_password.focus();
        return false;
    }
    if (form.new_repassword.value == "") {
        alert("确认密码不能为空！");
        form.new_repassword.focus();
        return false;
    }
    if (form.new_repassword.value != form.new_password.value) {
        alert("两次密码输入不一致！");
        form.new_repassword.focus();
        return false;
    }
    if (document.getElementById("isnullForAgoPass").innerHTML == "*抱歉，原始密码输入错误") {
        alert("原始密码错误！");
        return false;
    }
    return true;
}

var xmlhttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
}

function doAjax(url) {
    createXMLHttpRequest();
    xmlhttp.onreadystatechange = processRequest;
    xmlhttp.open("GET", url, true);
    xmlhttp.send(null);
}

function processRequest() {
    var mess = document.getElementById("isnullForAgoPass");
    if (xmlhttp.readyState == 4) {
        if (xmlhttp.status == 200) {
            if (xmlhttp.responseText == "passOk")
                mess.innerHTML = "原始密码正确";
            else if (xmlhttp.responseText == "passNotOk")
                mess.innerHTML = "*抱歉，原始密码输入错误";
        } else
            alert(xmlhttp.status);
    }
}



function checkNullForAgoPass() {
    var changing_name = document.getElementById("changing_name").value;
    var ago_password = document.getElementById("ago_password").value;
    var mess = document.getElementById("isnullForAgoPass");
    if (ago_password == "") {
        mess.innerHTML = "*原始密码不能为空";
        return false;
    } else {
        doAjax("/Homework/CheckName?username=&user_id=&changing_name="+changing_name+"&agoPass="+ago_password);
    }
}

function checkNullForNewPass() {
    var new_password = document.getElementById("new_password").value;
    var mess = document.getElementById("isnullForNewPass");
    if (new_password == "") {
        mess.innerHTML = "*新密码不能为空";
        return false;
    } else if (new_password.length < 6) {
        mess.innerHTML = "*新密码至少6位";
        return false;
    } else {
        mess.innerHTML = "";
    }
}

function checkNullForNewPassAgain() {
    var new_password = document.getElementById("new_password").value;
    var new_repassword = document.getElementById("new_repassword").value;
    var mess = document.getElementById("isnullForNewPassAgain");
    if (new_repassword == "") {
        mess.innerHTML = "*确认密码不能为空";
        return false;
    } else if (new_password != new_repassword) {
        mess.innerHTML = "*两次密码不一致";
        return false;
    } else {
        mess.innerHTML = "";
    }
}



function formChangeEmail(form) {
    if (form.new_email.value == "") {
        alert("电子邮箱不能为空！");
        form.new_email.focus();
        return false;
    }
    if (form.new_email.value.length < 10) {
        alert("电子邮箱至少10位！");
        form.new_email.focus();
        return false;
    }

    //对电子邮件格式的验证
    var myreg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
    if (!myreg.test(form.new_email.value)) {
        alert("请输入有效的邮箱");
        form.new_email.focus();
        return false;
    }
    return true;
}

function checkNullForEmail() {
    //对电子邮件格式的验证
    var myreg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
    var new_email = document.getElementById("new_email").value;
    var mess = document.getElementById("isnullForEmail");
    if (new_email == "") {
        mess.innerHTML = "*新邮箱不能为空";
        return false;
    } else if (new_email.length < 10) {
        mess.innerHTML = "*新邮箱至少10位";
        return false;
    } else if (!myreg.test(new_email)) {
        mess.innerHTML = "*请输入有效的邮箱";
        return false;
    } else {
        mess.innerHTML = "";

    }
}




function checkNullForContent() {
    var content = document.getElementById("content").value;
    var mess = document.getElementById("isnullForContent");
    if (content == "") {
        mess.innerHTML = "*更改内容不能为空";
        return false;
    } else {
        mess.innerHTML = "";

    }
}


function formChangeOther(form) {
    if (form.ChangeType.value == "选择更改项") {
        alert("请选择申请更改项！");
        return false;
    }
    if (form.content.value== "") {
        alert("更改内容不能为空！");
        form.content.focus();
        return false;
    }
    return true;
}