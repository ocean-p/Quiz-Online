<%-- 
    Document   : login
    Created on : Jan 23, 2021, 11:06:09 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style type="text/css">
            form.test{
                display: inline-block;
            }
        </style>
    </head>
    <body>
    <center>
        <h1>QUIZ SYSTEM</h1>
        <c:if test="${not empty message}">
            <p><font color="green"><b>${message}</b></font></p>
        </c:if>
        <form action="login" method="POST">
            <table>
                <tr>
                    <td>Email: </td>
                    <td><input type="text" name="email" value="${param.email}" /></td>
                </tr>
                
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="password" value=""/></td>
                </tr>
                <c:if test="${not empty err}">
                   <p><font color="red">${err}</font></p>
                </c:if>
            </table>
            <br/>
            <input type="submit" value="Login"/>
        </form>
        <br/>
        <form action="createForm" method="POST" class="test">
            <input type="submit" value="Create Account" name="btAction" />
        </form>
        <form action="home" method="POST" class="test">
            <input type="submit" value="Refresh"/>
        </form>
    </center>
    </body>
</html>
