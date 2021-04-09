<%-- 
    Document   : quizhistory
    Created on : Jan 31, 2021, 10:55:50 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz History</title>
        <style type="text/css">
            td.subject{
                border: 2px solid green;
                padding: 10px;
                margin-top: 5px;
                width: 200px;
                text-align: center;
                border-radius: 10px;
            }
            td.subject:hover{
                background-color: lightgrey;
            }
            a.subject{
                text-decoration: none;
                color: blue;
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
            td{
                padding: 10px; 
            }
            form.test{
                display: inline-block;
            }
            th{
                background-color: gold;
            }
            td.option{
                background-color: tan;
                text-align: center;
            }
            a.option{
                text-decoration: none;
                color: white;
            }
            a.option:hover{
                color: blue;
            }
            tr.each:hover{
                background-color: cyan;
            }
            table.detail, table.submit{
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <form action="home" method="POST" class="test">
            <input type="submit" value="Back To Home"/>
        </form>
        <form action="quizHis" method="POST" class="test">
            <input type="submit" value="Refresh"/>
        </form>
    <center>
        <h1>QUIZ HISTORY</h1>
        <%--subject--%>
        <c:if test="${not empty subject}">
            <table>
                <tr>
                    <c:forEach var="s" items="${subject}">
                        <td class="subject" style="${s.id == subid? "background-color:lightgrey":""}"><a class="subject" href="subject2?id=${s.id}">${s.code} - ${s.des}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if> 
        <%------------------------%>
        <%--submit--%>
        <c:if test="${not empty submit}">
            <br/>
            <table width="100%" border="2" class="submit">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Quiz Id</th>
                        <th>Number Of Correct</th>
                        <th>Point</th>
                        <th>Date Start</th>
                        <th>Date End</th>
                        <th>Option</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${submit}" varStatus="d">
                        <tr class="each">
                            <td>${d.count}</td>
                            <td>${s.id}</td>
                            <td>${s.correct}</td>
                            <td>${s.point}</td>
                            <td>${s.start}</td>
                            <td>${s.end}</td>
                            <td class="option"><a class="option" href="detail?id=${s.id}">Detail</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <%------------------------%>
        <%--empty submit--%>
        <c:if test="${empty submit}">
            <c:if test="${empty detail}">
                <p><font color="grey">- Not yet submit any quizzes-</font></p>
            </c:if>
        </c:if>
        <%------------------------%>
        <%--paging 1--%>
        <c:if test="${page > 1}">
            <br/>
            <table>
                <tr>
                    <c:forEach var="i" begin="1" end="${page}">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="quizHis?index=${i}">${i}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
        <%------------------------%>    
        <%--paging 2--%>
        <c:if test="${page2 > 1}">
            <br/>
            <table>
                <tr>
                    <c:forEach var="i" begin="1" end="${page2}">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="subject2?index=${i}&id=${subid}">${i}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
        <%------------------------%>    
        <%--detail--%>
        <c:if test="${not empty detail}">
            <h3>- DETAIL -</h3>
            <table>
                <tr>
                    <td><b>Quiz id: </b></td>
                    <td>${sm.id}</td>
                </tr>
                <tr>
                    <td><b>Subject: </b></td>
                    <td>${sj.code} ${sj.des}</td>
                </tr>
                <tr>
                    <td><b>Number of correct: </b></td>
                    <td>${sm.correct}</td>
                </tr>
                <tr>
                    <td><b>Point: </b></td>
                    <td>${sm.point}</td>
                </tr>
                <tr>
                    <td><b>Time Start: </b></td>
                    <td>${sm.start}</td>
                </tr>
                <tr>
                    <td><b>Time End: </b></td>
                    <td>${sm.end}</td>
                </tr>
                <tr>
                    <td><b>Email: </b></td>
                    <td>${sm.email}</td>
                </tr>
            </table>
            
            <table width="100%" border="2" class="detail">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Question Id</th>
                        <th>Question Content</th>
                        <th>Correct Answer</th>
                        <th>Your Choose</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="d" items="${detail}" varStatus="c">
                        <tr class="each">
                            <td>${c.count}</td>
                            <td>${d.questionid}</td>
                            <td>${d.content}</td>
                            <td>${d.correct}</td>
                            <td>${d.choose}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </center>
    </body>
</html>
