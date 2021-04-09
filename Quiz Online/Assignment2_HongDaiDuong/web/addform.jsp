<%-- 
    Document   : addform
    Created on : Jan 25, 2021, 3:15:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Question</title>
        <style type="text/css">
            td{
                width: 120px;
                padding: 10px;
            }
            textarea.content, textarea.answer{
                width: 120%;
                font-size: 120%;
            }
            textarea.content{
                border: 2px solid blueviolet;
            }
            select.correct{
                border: 2px solid green;
            }
        </style>
    </head>
    <body>
        <form action="home" method="POST">
            <input type="submit" value="Back"/>
        </form>
    <center>
        <h1>Add Question Form</h1>
        <form action="add" method="POST">
            <table>
                <c:set var="err" value="${requestScope.ERRORS}"/>
                <tr>
                    <td><b>Content: </b></td>
                    <td><textarea name="content" class="content" rows="5">${param.content}</textarea></td>
                </tr>
                <c:if test="${not empty err.contentErr}">
                    <tr>
                        <td><font color="red">${err.contentErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer A: </b></td>
                    <td><textarea name="aa" class="answer" rows="3">${param.aa}</textarea></td>
                </tr>
                <c:if test="${not empty err.aErr}">
                    <tr>
                        <td><font color="red">${err.aErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer B: </b></td>
                    <td><textarea name="ab" class="answer" rows="3">${param.ab}</textarea></td>
                </tr>
                <c:if test="${not empty err.bErr}">
                    <tr>
                        <td><font color="red">${err.bErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer C: </b></td>
                    <td><textarea name="ac" class="answer" rows="3">${param.ac}</textarea></td>
                </tr>
                <c:if test="${not empty err.cErr}">
                    <tr>
                        <td><font color="red">${err.cErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer D: </b></td>
                    <td><textarea name="ad" class="answer" rows="3">${param.ad}</textarea></td>
                </tr>
                <c:if test="${not empty err.dErr}">
                    <tr>
                        <td><font color="red">${err.dErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Correct Answer: </b></td>
                    <td>
                        <select name="acorrect" class="correct">
                            <option ${number==1?"selected":""}>Answer A</option>
                            <option ${number==2?"selected":""}>Answer B</option>
                            <option ${number==3?"selected":""}>Answer C</option>
                            <option ${number==4?"selected":""}>Answer D</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b>Subject: </b></td>
                    <td>
                        <select name="subjectcbb">
                            <c:forEach items="${subject}" var="s">
                                <option ${sub==s.id?"selected":""}>${s.id}-${s.code}:${s.des} </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <br/>
            <input type="submit" value="Add Question" onclick="return confirm('Are you sure to add ?')" />
        </form>
    </center>
    </body>
</html>
