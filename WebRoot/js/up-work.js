function bodyload() {
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    }
}
function do_it(form) {
    if (form.workName.value == "") {
        alert("作业名称不能为空！");
        form.workName.focus();
        return false;
    }
    if (form.workName.value.length < 2) {
        alert("作业名称至少2位！");
        form.workName.focus();
        return false;
    }
    if(form.workTeacher.value =="0"){
        alert("你还没选择任课老师");
        return false;
    }
    if (form.workPhone.value == "") {
        alert("联系电话不能为空！");
        form.workPhone.focus();
        return false;
    }
    if (form.workPhone.value.length != 11) {
        alert("请输入有效的手机号！");
        form.workPhone.focus();
        return false;
    }
    if (form.workFile.value == "") {
        alert("您还未选择文件！");
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
    document.getElementById("tip").style.display = "";
    return true;
}

function checkNullForName() {
    var workName = document.getElementById("workName").value;
    var mess = document.getElementById("isnull");
    if (workName == "") {
        mess.innerHTML = "*作业名称不能为空";
        return false;
    } else if (workName.length < 2) {
        mess.innerHTML = "*作业名称至少2位";
        return false;
    } else {
        mess.innerHTML = "";
    }
}


function checkNullForTeacher() {
    var workTeacher = document.getElementById("workTeacher").value;
    var mess = document.getElementById("isnullForTeacher");
    if (workTeacher == "0") {
        mess.innerHTML = "*请选择批阅老师";
        return false;
    } else {
        mess.innerHTML = "";

    }
}


function checkNullForPhone() {
    var workPhone = document.getElementById("workPhone").value;
    var mess = document.getElementById("isnullForPhone");
    if (workPhone == "") {
        mess.innerHTML = "*手机号码不能为空";
        return false;
    } else if (workPhone.length < 11) {
        mess.innerHTML = "*请输入有效的手机号码";
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


var code; //在全局定义验证码
function createCode() {
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

function getPhotoSize(obj){
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
    if(fileSize>=1024*10){
        alert("照片最大尺寸为10M，请重新上传!");
        obj.value="";
        return false;
    }
}