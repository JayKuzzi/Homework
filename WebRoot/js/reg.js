function reg(form) {
    if (document.getElementById("isnull").innerHTML == "*抱歉，用户名重复") {
        alert("*抱歉，用户名重复！");
        form.username.focus();
        return false;
    }

    if (document.getElementById("isnullForNum").innerHTML == "*抱歉，此学号重复") {
        alert("*抱歉，此学号重复");
        form.user_id.focus();
        return false;
    }

    if (form.username.value == "") {
        alert("用户不能为空！");
        form.username.focus();
        return false;
    }
    if (form.username.value.length < 2) {
        alert("用户名至少2位！");
        form.username.focus();
        return false;
    }
    if (form.password.value == "") {
        alert("密码不能为空！");
        form.password.focus();
        return false;
    }
    if (form.password.value.length < 6) {
        alert("密码至少6位！");
        form.password.focus();
        return false;
    }
    if (form.repassword.value == "") {
        alert("确认密码不能为空！");
        form.repassword.focus();
        return false;
    }
    if (form.password.value != form.repassword.value) {
        alert("两次密码输入不一致！");
        form.repassword.focus();
        return false;
    }
    if (form.user_china_name.value == "") {
        alert("姓名不能为空");
        form.user_china_name.focus();
        return false;
    }
    if (form.user_china_name.value.length < 2) {
        alert("姓名至少2位！");
        form.user_china_name.focus();
        return false;
    }
    if (form.user_id.value == "") {
        alert("学号不能为空");
        form.user_id.focus();
        return false;
    }
    if (form.user_id.value.length < 8) {
        alert("学号至少8位！");
        form.user_id.focus();
        return false;
    }
    if (form.email.value == "") {
        alert("电子邮箱不能为空！");
        form.email.focus();
        return false;
    }
    if (form.email.value.length < 10) {
        alert("电子邮箱至少10位！");
        form.email.focus();
        return false;
    }

    //对电子邮件格式的验证
    var myreg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
    if (!myreg.test(form.email.value)) {
        alert("请输入有效的邮箱");
        form.email.focus();
        return false;
    }
    if (form.verify2.value == "") {
        alert("验证码不能为空！");
        form.verify2.focus();
        return false;
    }
    if (form.code2.value != form.verify2.value.toUpperCase()) { //若输入的验证码与产生的验证码不一致时
        alert("验证码输入错误!"); //则弹出验证码输入错误
        createCodeAgain();
        form.verify2.value = "";//清空文本框
        form.verify2.focus();
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
    var mess = document.getElementById("isnull");
    var mess2 = document.getElementById("isnullForNum");
    if (xmlhttp.readyState == 4) {
        if (xmlhttp.status == 200) {
            if (xmlhttp.responseText == "false")
                mess.innerHTML = "恭喜您，用户可以使用";
            else if (xmlhttp.responseText == "true")
                mess.innerHTML = "*抱歉，用户名重复";
            else if (xmlhttp.responseText == "false2")
                mess2.innerHTML = "恭喜您，此学号可以使用";
            else if (xmlhttp.responseText == "true2")
                mess2.innerHTML = "*抱歉，此学号重复";
        } else
            alert("请求处理返回有误！")
    }
}


function checkNullForName() {
    var username = document.getElementById("username").value;
    var mess = document.getElementById("isnull");
    if (username == "") {
        mess.innerHTML = "*用户名不能为空";
        return false;
    } else if (username.length < 2) {
        mess.innerHTML = "*用户名至少2位";
        return false;
    } else {
        doAjax("/Homework/CheckName?username=" + username + "&user_id=");
    }
}


function checkNullForPass() {
    var password = document.getElementById("password").value;
    var mess = document.getElementById("isnullForPass");
    if (password == "") {
        mess.innerHTML = "*密码不能为空";
        return false;
    } else if (password.length < 6) {
        mess.innerHTML = "*密码至少6位";
        return false;
    } else {
        mess.innerHTML = "";
    }
}

function checkNullForPassAgain() {
    var password = document.getElementById("password").value;
    var repassword = document.getElementById("repassword").value;
    var mess = document.getElementById("isnullForPassAgain");
    if (repassword == "") {
        mess.innerHTML = "*确认密码不能为空";
        return false;
    } else if (password != repassword) {
        mess.innerHTML = "*两次密码不一致";
        return false;
    } else {
        mess.innerHTML = "";
    }
}

function checkNullForChinaName() {
    var user_china_name = document.getElementById("user_china_name").value;
    var mess = document.getElementById("isnullForChinaName");
    if (user_china_name == "") {
        mess.innerHTML = "*姓名不能为空";
        return false;
    } else if (user_china_name.length < 2) {
        mess.innerHTML = "*姓名至少2位";
        return false;
    } else {
        mess.innerHTML = "";

    }
}

function checkNullForNum() {
    var user_id = document.getElementById("user_id").value;
    var mess = document.getElementById("isnullForNum");
    if (user_id == "") {
        mess.innerHTML = "*学号不能为空";
        return false;
    } else if (user_id.length < 8) {
        mess.innerHTML = "*学号至少8位";
        return false;
    } else {
        doAjax("/Homework/CheckName?username=&user_id=" + user_id);
    }
}

function checkNullForEmail() {
    //对电子邮件格式的验证
    var myreg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
    var email = document.getElementById("email").value;
    var mess = document.getElementById("isnullForEmail");
    if (email == "") {
        mess.innerHTML = "*邮箱不能为空";
        return false;
    } else if (email.length < 10) {
        mess.innerHTML = "*邮箱至少10位";
        return false;
    } else if (!myreg.test(email)) {
        mess.innerHTML = "*请输入有效的邮箱";
        return false;
    } else {
        mess.innerHTML = "";

    }
}

function checkNullForVerify() {
    var verify = document.getElementById("verify2").value;
    var mess = document.getElementById("isnullForVerify");
    if (verify == "") {
        mess.innerHTML = "*验证码不能为空";
        return false;
    } else {
        mess.innerHTML = "";
    }
}

function GoHome() {
    window.history.back(-1);
}

var code; //在全局定义验证码
//产生验证码
window.onload = function createCode() {
    code = "";
    var codeLength = 4;//验证码的长度
    var checkCode = document.getElementById("code2");
    var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
    for (var i = 0; i < codeLength; i++) {//循环操作
        var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
        code += random[index];//根据索引取得随机数加到code上
    }
    checkCode.value = code;//把code值赋给验证码
}

function createCodeAgain() {
    code = "";
    var codeLength = 4;//验证码的长度
    var checkCode = document.getElementById("code2");
    var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
    for (var i = 0; i < codeLength; i++) {//循环操作
        var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
        code += random[index];//根据索引取得随机数加到code上
    }
    checkCode.value = code;//把code值赋给验证码
}