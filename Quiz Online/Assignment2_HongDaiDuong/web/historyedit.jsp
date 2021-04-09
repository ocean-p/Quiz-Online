<%-- 
    Document   : historyedit
    Created on : Jan 26, 2021, 3:36:54 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Edit</title>
        <style type="text/css">
            table.history{
                border-collapse: collapse;
                width: 100%;
            }
            th,td{
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid grey;
            }
            td.paging{
                border: 2px solid grey;
                padding: 10px;
                margin-top: 5px;
                width: 20px;
                text-align: center;
            }
            td.paging:hover{
                background-color: lightblue;
            }
            a.paging{
                text-decoration: none;
            }
            tr.each:hover{
                background-color: khaki;
            }
        </style>
    </head>
    <body>
        <form action="home" method="POST">
            <input type="submit" value="Back To Home"/>
        </form>
    <center>
        <h1>History Edit</h1>
        <c:if test="${empty history}">
            <h3>No activity</h3>
        </c:if>
        <c:if test="${not empty history}">
            <table class="history">
                <thead>
                    <tr>
                        <th>Time</th>
                        <th>Activity</th>
                        <th>Question ID</th>
                        <th>Question Content</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="h" items="${history}">
                        <tr class="each">
                            <td>${h.time}</td>
                            <td>${h.activity}</td>
                            <td>${h.qid}</td>
                            <td>${h.q}</td>
                            <td>${h.email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <%--------------------------%>
        <%--paing--%>
        <c:if test="${page > 1}">
            <br/>
            <table>
                <tr>
                    <c:forEach var="i" begin="1" end="${page}">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="historyEdit?index=${i}">${i}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>     
    </center>
    </body>
</html>
