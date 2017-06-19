var btn1, btn2, btn3, btn4;
function bodyload() {
    btn1 = document.getElementById("btn1");
    btn2 = document.getElementById("btn2");
    btn3 = document.getElementById("btn3");
    btn4 = document.getElementById("btn4");

    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    }
}

function manager() {
    btn1.style.backgroundColor = "#4E5D48";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "inherit";
    btn1.style.color = "white";
    btn2.style.color = "#414747";
    btn3.style.color = "#414747";
    btn4.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else {
        document.getElementById("work").style.display = "";
        document.getElementById("question").style.display = "none";
    }

    // document.getElementById("west").innerHTML = "<iframe src='' frameBorder='0' width='900' scrolling='no' height='900'></iframe>";
}


function show() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "#4E5D48";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "inherit";

    btn1.style.color = "#414747";
    btn2.style.color = "white";
    btn3.style.color = "#414747";
    btn4.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else {
        addTab('优秀作业', '/Homework/jsp/workshow.jsp');

    }

}

function question() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "#4E5D48";
    btn4.style.backgroundColor = "inherit";
    btn1.style.color = "#414747";
    btn2.style.color = "#414747";
    btn3.style.color = "white";
    btn4.style.color = "#414747";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else {
        document.getElementById("work").style.display = "none";
        document.getElementById("question").style.display = "";
    }

}
function about() {
    btn1.style.backgroundColor = "inherit";
    btn2.style.backgroundColor = "inherit";
    btn3.style.backgroundColor = "inherit";
    btn4.style.backgroundColor = "#4E5D48";

    btn1.style.color = "#414747";
    btn2.style.color = "#414747";
    btn3.style.color = "#414747";
    btn4.style.color = "white";
    var chinaName = document.getElementsByTagName("p")[0].innerHTML;
    if (chinaName == "未登录") {
        alert("会话超时，请重新登录！");
        window.location.href = '/Homework';
    } else
        addTab('联系作者', '/Homework/jsp/author.jsp');
}

function changeStudent() {
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
        addTab('修改学生', '/Homework/jsp/change-student.jsp');

}

function deleteStudent() {
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
        addTab('删除学生', '/Homework/jsp/delete-student.jsp');
}

function ApplyStudent() {
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
        addTab('学生申请', '/Homework/jsp/apply-student.jsp');
}


function changeTeacher() {
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
        addTab('修改老师', '/Homework/jsp/change-teacher.jsp');
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

function seedback_list() {
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
        addTab('反馈消息', '/Homework/jsp/seed_list.jsp');
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

