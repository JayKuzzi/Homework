
function reg(form) {
	if (form.username.value == "") {
		alert("用户不能为空！");
		return false;
	}
	if (form.password.value == "") {
		alert("密码不能为空！");
		return false;
	}
	if (form.repassword.value == "") {
		alert("确认密码不能为空！");
		return false;
	}
	if (form.password.value != form.repassword.value) {
		alert("两次密码输入不一致！");
		return false;
	}
	if (form.email.value == "") {
		alert("电子邮箱不能为空！");
		return false;
	}
	if (form.birth.value == "") {
		alert("生日不能为空！");
		return false;
	}

	//对电子邮件的验证
	var myreg =/[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
	if (!myreg.test(form.email.value)) {
		alert("请输入有效的E_mail！");
		return false;
	}


}