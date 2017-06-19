
function login(form) {
	if (form.username.value == "") {
		alert("用户不能为空！");
		return false;
	}
	if (form.password.value == "") {
		alert("密码不能为空！");
		return false;
	}
}