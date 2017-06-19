<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
    <head>  
        <title>用户登录</title>  
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        	<script type="text/javascript" src="js/login.js"></script>
        	<link rel="stylesheet" type="text/css" href="css/login.css"/>
    </head>  
    <body>  
    		<img src="images/mail.png"/>
            <div class="div-login"> 
               <h1 class ="font-tittle">Welcome</h1>  
                <form action="LoginServlet" method="post" onsubmit="return login(this);">  
                    <table align="center">  
                        <tr> 
                            <td><input type="text" placeholder="请输入用户名" name="username" class="box"></td>  
                        </tr>  
                        <tr> 
                            <td><input type="password" placeholder="请输入密码" name="password" class="box"></td>  
                        </tr>  
                     </table> 
                     <div class="div-btn">
                    <input class="btn" type="button" onclick="window.location.href='reg.jsp'" value="注 册">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="btn" type="submit" value="登 录">  
                    </div>
                </form>  
            </div>  
    </body>  
</html>  