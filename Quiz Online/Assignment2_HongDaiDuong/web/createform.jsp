<%-- 
    Document   : createform
    Created on : Jan 23, 2021, 11:40:35 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <style type="text/css">
            td{
                padding: 10px;
            }
        </style>
    </head>
    <body>
    <form action="home" method="POST">
        <input type="submit" value="Back"/>
    </form>
    <center>
        <h1>Create Account</h1>
        <form action="createAccount" method="POST">
            <table>
                <c:set var="err" value="${requestScope.ERRORS}"/>
                <tr>
                    <td><b>Email: </b></td>
                    <td><input type="text" name="txtemail" value="${param.txtemail}"/></td>
                </tr>
                <c:if test="${not empty err.emailErr}">
                    <tr>
                        <td><font color="red">${err.emailErr}</font></td>
                    </tr>
                </c:if>

                <tr>
                    <td><b>Name: </b></td>
                    <td><input type="text" name="txtname" value="${param.txtname}"/>(5 - 50 chars)</td>
                </tr>    
                <c:if test="${not empty err.nameErr}">
                    <tr>
                        <td><font color="red">${err.nameErr}</font></td>
                    </tr>
                </c:if>

                <tr>
                    <td><b>Password: </b></td>
                    <td><input type="password" name="txtpass" value="${param.txtpass}"/></td>
                </tr>   
                <c:if test="${not empty err.passErr}">
                    <tr>
                        <td> <font color="red">${err.passErr}</font></td>
                    </tr>
                </c:if>
                    
                <tr>
                    <td><b>Confirm Password: </b></td>
                    <td><input type="password" name="txtconfirm" value="${param.txtconfirm}"/></td>
                </tr>   
                <c:if test="${not empty err.confirmErr}">
                    <tr>
                        <td><font color="red">${err.confirmErr}</font></td>
                    </tr>
                </c:if>

            </table>
            <br/>
            <input type="submit" value="Create" onclick="return confirm('Are you sure to create')"/>

        </form>
        </center>        
    </center>
    </body>
</html>
