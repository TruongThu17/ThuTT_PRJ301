<%-- 
    Document   : login
    Created on : Mar 18, 2022, 1:38:38 AM
    Author     : win
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="static/css/login1.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class ="title">Inventory Management</div>
         <c:if test="${err!=null}"><div style ="color: red; font-size: 20px; margin-bottom: 40px;">${err}</div></c:if>
    <div class ="login-page">
        <div class ="log">Đăng nhập tài khoản</div>
        <form class ="form" method ="POST" action = "login">
            <input type="text" name="username" placeholder="Tên đăng nhập" class ="form"/><br/>
            <input type="password" name="password" placeholder="Mật Khẩu" class ="form"/><br/>
            <input type="checkbox" name ="remember"/> <span class="txt1">
                    Nhớ mật khẩu
                </span> </br>
            <input type="submit" value="Đăng Nhập" class ="form dn"/><br/>
        </form>
        <ul class="login-more p-t-190">
            <li >
                <span class="txt1">
                    Quên
                </span>

                <a href="forgotpass" class="txt2">
                    Tên đăng nhập/ Mật khẩu?
                </a>
            </li>
        </ul>
       <!-- Button trigger modal -->
       
        
    </div>
    </body>
</html>
