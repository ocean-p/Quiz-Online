<%-- 
    Document   : student
    Created on : Jan 23, 2021, 11:38:16 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Page</title>
        <style type="text/css">
            form.test{
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <h3>Hello Student '${sessionScope.name}'</h3>
        <form action="logout" method="POST" class="test">
            <input type="submit" value="Logout" onclick="return confirm('Are you sure to logout')"/>
        </form>
        <form action="home" method="POST" class="test">
            <input type="submit" value="Refresh"/>
        </form>
        <c:if test="${empty sessionScope.exam}">
            <form action="quizHis" method="POST" class="test">
                <input type="submit" value="Quiz History"/>
            </form>
        </c:if>
    <center>
        <h1>QUIZ EXAM</h1>
        <c:if test="${empty sessionScope.exam}">
            <p><font color="grey">- Select subject before take the exam -</font></p>
            <form action="exam" method="POST">
                <table>
                    <tr>
                        <td><b>Subject: </b></td>
                        <td>
                            <select name="subject">
                                <c:forEach var="s" items="${subject}">
                                    <option>${s.id}-${s.code}: ${s.des}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <input type="submit" value="Take Exam" name="action" onclick="return confirm('Are you ready to start ?')"/>
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
        <c:if test="${not empty sessionScope.exam}">
        <form action="exam" method="POST">
            <input type="submit" value="Back to Current Quiz"/>
        </form>
        </c:if>
        <c:if test="${not empty success}">
        <h3><font color="green">Submit Successfully!</font></h3>
        <p><font color="green">Go to 'Quiz History' to view grade</font></p>
        </c:if>    
    </center>
    </body>
</html>
