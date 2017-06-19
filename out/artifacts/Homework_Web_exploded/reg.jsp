<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
    <head>  
        <title>用户注册</title>  
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="js/reg.js"></script>
		<link rel="stylesheet" type="text/css" href="css/reg.css"/>
    </head>  
    <body>  
            <div class="div-reg">  
            <h1 class="font-tittle">Sign up</h1> 
            
                <form action="RegServlet" method="post" onsubmit="return reg(this);">  
                    <table align="center">  
                        <tr>
                        <td> <input type="text" placeholder="请输入用户名" name="username" class="box"></td>  
                        </tr>  
                        <tr>  
                            <td><input type="password" placeholder="请输入密码" name="password" class="box"></td>  
                        </tr>  
                        <tr>  
                            <td><input type="password" placeholder="请确认密码" name="repassword" class="box"></td>  
                        </tr>  
                        <tr>  
                            <td><input type="text" placeholder="请输入邮箱" name="email" class="box"></td>  
                        </tr>   
                        <tr>  
                            <td><input type="text" placeholder="请输入生日" name="birth" class="box"></td>  
                        </tr>  
                    </table>  
                    <div class="div-btn">
                    <input type="reset" class ="btn" value="重 置">  
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" class ="btn" value="注 册"> 
                    </div>
                </form>  
            </div>  
         
    </body>  
</html>  