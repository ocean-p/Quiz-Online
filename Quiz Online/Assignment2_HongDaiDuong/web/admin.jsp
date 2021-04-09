<%-- 
    Document   : admin
    Created on : Jan 23, 2021, 11:38:06 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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
            td.question{
                text-align: center;
            }
            form.test{
               display: inline-block;
            }
            td.delete{
                text-align: center;
                background-color: red;
                width: 150px;
            }
            td.update{
                text-align: center;
                background-color: blue;
                width: 150px;
            }
            a.update, a.delete{
                color: white;
                text-decoration: none;    
            }
            a.update:hover, a.delete:hover{
                color: purple;
            }
            tr.each:hover{
              background-color: lightgrey;  
            }
            th{
                background-color: seagreen;
                color: white;
                font-size: 20px;
            }
            table.question{
                border-collapse: collapse;
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
        <h3>Hello Admin '${sessionScope.name}'</h3>
        <form action="logout" method="POST" class="test">
            <input type="submit" value="Logout" onclick="return confirm('Are you sure to logout ?')"/>
        </form>
        <form action="addForm" method="POST" class="test">
            <input type="submit" value="Add Question"/>
        </form>
        <form action="bin" method="POST" class="test">
            <input type="submit" value="Recycle Bin"/>
        </form>
        <form action="historyEdit" method="POST" class="test">
            <input type="submit" value="History Edit"/>
        </form>
    <center>
        <h1>QUIZ MANAGEMENT</h1>
        <form action="home" method="POST">
            <input type="submit" value="Home"/>
        </form>
        <br/>
        <form action="search" method="POST">
            <input type="text" name="search" value="${value}" placeholder="Search by question content" class="search"/>
            <input type="submit" value="Search"/>
        </form>
        <br/>
        <%--subject--%>
        <c:if test="${not empty subject}">
            <table>
                <tr>
                    <c:forEach var="s" items="${subject}">
                        <td class="subject" style="${s.id == subid? "background-color:lightgrey":""}"><a class="subject" href="subject?id=${s.id}">${s.code} - ${s.des}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if> 
        <%------------------------%>
        <%--question--%>
        <c:if test="${not empty value}">
            <h2>- Result of '${value}' -</h2>
        </c:if>    
        <c:if test="${not empty question}">
            <c:if test="${empty subid}">
                <c:if test="${empty value}">
                    <h2>- All Active Questions -</h2>
                </c:if>
            </c:if>
            <c:if test="${not empty subid}">
                <h2>- Subject -</h2>
            </c:if>        
            <table class="question" width="100%" border="2">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Question</th>
                        <th>Correct Answer</th>
                        <th>ID Question</th>
                        <th colspan="2">Option</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="q" items="${question}" varStatus="d">
                        <tr class="each">
                            <td class="question">${d.count}</td>
                            <td>${q.question}</td>
                            <td>${q.correct}</td>
                            <td class="question">${q.id}</td>
                            <td class="update"><a href="updateForm?id=${q.id}" class="update">Update</a></td>
                            <td class="delete"><a href="delete?id=${q.id}" class="delete" onclick="return confirm('Sure to delete the question at number ${d.count} ?')">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <%------------------------%>    
        <%--empty question--%>
        <c:if test="${empty question}">
            <h3><font color="grey">No question active</font></h3>
        </c:if>
        
        
        
        <%------------------------%>    
        <%--paging--%>
        <c:if test="${page > 1}">
            <br/>
            <table>
                <tr>
                    <c:forEach var="i" begin="1" end="${page}">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="home?index=${i}">${i}</a></td>
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
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="subject?index=${i}&id=${subid}">${i}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
        <%------------------------%>    
        <%--paging 3--%>
        <c:if test="${page3 > 1}">
            <br/>
            <table>
                <tr>
                    <c:forEach var="i" begin="1" end="${page3}">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="search?index=${i}&search=${value}">${i}</a></td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
    </center>
</body>
</html>
