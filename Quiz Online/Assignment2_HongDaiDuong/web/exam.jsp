<%-- 
    Document   : exam
    Created on : Jan 30, 2021, 12:20:16 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam</title>
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
            h1{
                color: mediumaquamarine;
            }
            td.select{
                border: 2px solid grey;
                padding: 10px;
                margin-top: 5px;
                width: 20px;
                text-align: center;
            }
            a.pre,a.next{
                text-decoration: none;
            }
            form.test{
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <h3>Hello Student '${sessionScope.name}'</h3>
        <form action="submit" method="POST" class="test">
            <input type="submit" value="Submit" onclick="return confirm('Are you sure to submit ?')"/>
        </form>
        <form action="exam" method="POST" class="test">
            <input type="submit" value="Refresh"/>
        </form>
    <center>
        <c:if test="${not empty warning}">
            <p><font color="red">${warning}</font></p>
        </c:if>
        <h1>QUIZ: ${title.code} ${title.des}</h1>
        <h1>Multiple Choice 10 questions</h1>
        <h2><font color="grey">-----------------------------------------</font></h2>
        <c:if test="${not empty sessionScope.exam}">
            <c:if test="${not empty quiz}">
                <form action="save" method="POST">
                    <h2>${number}.  ${quiz.q.question}</h2>
                    <table>
                        <tr>
                            <td>A.  ${quiz.q.a}</td>
                        </tr>
                        <tr>
                            <td>B.  ${quiz.q.b}</td>
                        </tr>
                        <tr>
                            <td>C.  ${quiz.q.c}</td>
                        </tr>
                        <tr>
                            <td>D.  ${quiz.q.d}</td>
                        </tr>
                    </table>
                    <br/>
                    <b>Select: </b> 
                    <select name="answer">
                        <option></option>
                        <option ${value == 1? "selected":""}>Answer A</option>
                        <option ${value == 2? "selected":""}>Answer B</option>
                        <option ${value == 3? "selected":""}>Answer C</option>
                        <option ${value == 4? "selected":""}>Answer D</option>
                    </select>
                    <input type="hidden" name="quizid" value="${quiz.q.id}"/>
                    <input type="hidden" name="number" value="${number}"/>
                    <input type="submit" value="Save Answer"/>
                </form>
                <br/>    
                <table>
                <tr>
                    <td class="paging"><a  class="pre" href="pre?index=${number}"><</a></td>
                    <c:forEach var="i" begin="1" end="10">
                        <td class="paging" style="${number == i? "background-color:lightblue":""}"><a class="paging" href="exam?index=${i}">${i}</a></td>
                    </c:forEach>
                    <td class="paging"><a class="next" href="next?index=${number}">></a></td>
                </tr>
                </table>
                <p>- Selected -</p>
                <table>
                    <tr>
                        <td class="select" style="${sessionScope.s1 == 1? "background-color:green":""}">1</td>
                        <td class="select" style="${sessionScope.s2 == 2? "background-color:green":""}">2</td>
                        <td class="select" style="${sessionScope.s3 == 3? "background-color:green":""}">3</td>
                        <td class="select" style="${sessionScope.s4 == 4? "background-color:green":""}">4</td>
                        <td class="select" style="${sessionScope.s5 == 5? "background-color:green":""}">5</td>
                        <td class="select" style="${sessionScope.s6 == 6? "background-color:green":""}">6</td>
                        <td class="select" style="${sessionScope.s7 == 7? "background-color:green":""}">7</td>
                        <td class="select" style="${sessionScope.s8 == 8? "background-color:green":""}">8</td>
                        <td class="select" style="${sessionScope.s9 == 9? "background-color:green":""}">9</td>
                        <td class="select" style="${sessionScope.s10 == 10? "background-color:green":""}">10</td>
                    </tr>
                </table>
            </c:if>
        </c:if>
        
    </center>
    </body>
</html>
