<%-- 
    Document   : recyclebin
    Created on : Jan 25, 2021, 9:45:36 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recycle Bin</title>
        <style type="text/css">
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
            td.number, td.id, td.time, td.op{
                text-align: center;
            }
            tr.each:hover{
                background-color: yellow;
            }
            a.restore{
                text-decoration: none;
                color: ivory;
            }
            td.op{
                background: indigo;
                width: 150px;
            }
            a.restore:hover{
                color: brown;
            }
            table{
                border-collapse: collapse;
            }
            th{
                background-color: coral;
                color: azure;
                font-size: 20px;
            }
            td{
                padding: 10px;
            }
            input.search{
                width: 50%;
                border: none;
                border-bottom: 2px solid black;
                padding: 12px 20px;
                margin: 8px 0;
                font-size: 100%;
                box-sizing: border-box;
            }
        </style>
    </head>
    <body>
        <form action="home" method="POST">
            <input type="submit" value="Back To Home"/>
        </form>
    <center>
        <h1>Recycle Bin</h1>
        <p><font color="grey">- Please restore for updating -</font></p>
        <form action="bin" method="POST">
            <input type="submit" value="Refresh"/>
        </form>
        <br/>
        <%--------------------------%>
        <%--Search 2--%>
        <form action="search2" method="POST">
            <input type="text" name="search" value="${value}" placeholder="Search by question content" class="search"/>
            <input type="submit" value="Search"/>
        </form>
        <%--------------------------%>
        <%--question--%>
        <c:if test="${not empty value}">
            <h2>- Result of '${value}' -</h2>
        </c:if>
        <c:if test="${not empty question}">
            <c:if test="${empty value}">
                <h2>- All Inactive Questions -</h2>
            </c:if>
            <table width=100%" border="2">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Question</th>
                        <th>Question ID</th>
                        <th>Create Date</th>
                        <th>Option</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="q" items="${question}" varStatus="d">
                        <tr class="each">
                            <td class="number">${d.count}</td>
                            <td>${q.question}</td>
                            <td class="id">${q.id}</td>
                            <td class="time">${q.createtime}</td>
                            <td class="op"><a href="restore?id=${q.id}" class="restore" onclick="return confirm('Are you sure to restore question at number ${d.count} ?')">Restore</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <%--------------------------%>
        <%--empty question--%>
        <c:if test="${empty question}">
            <h3><font color="grey">No question inactive</font></h3>
        </c:if>
        <%--------------------------%>
        <%--paing 4--%>
        <c:if test="${page4 > 1}">
            <br/>
            <table>
                <tr>
                    <c:forEach var="i" begin="1" end="${page4}">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="bin?index=${i}">${i}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if> 
        <%--------------------------%>
        <%--paing 5--%>
        <c:if test="${page5 > 1}">
            <br/>
            <table>
                <tr>
                    <c:forEach var="i" begin="1" end="${page5}">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="search2?index=${i}&search=${value}">${i}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if> 
    </center>
    </body>
</html>
