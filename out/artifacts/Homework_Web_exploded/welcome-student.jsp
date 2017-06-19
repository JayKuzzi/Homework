<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户登录</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />



<script type="text/javascript" src="js/welcome-student.js"></script>
<link rel="stylesheet" type="text/css" href="css/welcome-student.css" />
</head>

<body link="#A9A9A9" alink="#A9A9A9" vlink="#A9A9A9">

	<div class="div-tittle">
		<h1 class="font-tittle">欢迎使用作业管理系统</h1>
	</div>
	<div class="div-container">
		<div class="div-left">
			<h1 class="font-permission">${username}</h1>
			<h1 class="font-permission">${permission}</h1>
			<hr style="margin-bottom:40px;border:none;border-top:1px solid #414747;" />

			<input type="button" onclick="teacher()" class="btn" value="下 载 作 业" /> 
			<br>
			<input type="button" onclick="student()" class="btn" value="上 传 作 业" /> 
			<br>
			<input type="button" onclick="homework()" class="btn" value="成 绩 查 看" /> 
		</div>
		
		<div id="right" class="div-right">
			
		</div>
	</div>
	
	

</body>
</html>
