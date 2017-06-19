function login(form) {
    if (form.username.value == "") {
        alert("用户不能为空！");
        form.username.focus();
        return false;
    }
    if (form.password.value == "") {
        alert("密码不能为空！");
        form.password.focus();
        return false;
    }
    if (form.verify.value == "") {
        alert("验证码不能为空！");
        form.verify.focus();
        return false;
    }
    if (form.code.value != form.verify.value.toUpperCase()) { //若输入的验证码与产生的验证码不一致时
        alert("验证码输入错误!"); //则弹出验证码输入错误
        createCodeAgain();
        form.verify.value = "";//清空文本框
        form.verify.focus();
        return false;

    }
    return true;

}

function checkNull(word,keyName,messName) {
    var username = document.getElementById(keyName).value;
    var mess = document.getElementById(messName);
    if (username == "") {
        mess.innerHTML = "*"+word+"不能为空";
        return false;
    } else {
        mess.innerHTML = "";
    }
}


var code; //在全局定义验证码
//产生验证码
window.onload = function createCode() {
    code = "";
    var codeLength = 4;//验证码的长度
    var checkCode = document.getElementById("code");
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
    var checkCode = document.getElementById("code");
    var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
    for (var i = 0; i < codeLength; i++) {//循环操作
        var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
        code += random[index];//根据索引取得随机数加到code上
    }
    checkCode.value = code;//把code值赋给验证码
}
