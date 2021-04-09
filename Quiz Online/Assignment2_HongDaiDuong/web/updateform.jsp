<%-- 
    Document   : updateform
    Created on : Jan 24, 2021, 8:29:04 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Question</title>
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
            <input type="submit" value="Back To Home"/>
        </form>
    <center>
        <h1>Update Question Form</h1>
        <form action="update" method="POST">
            <table>
                <c:set var="err" value="${requestScope.ERRORS}"/>
                <c:set var="q" value="${sessionScope.questionupdate}"/>
                <tr>
                    <td><b>Create Time: </b></td>
                    <td>${q.createtime}</td>
                </tr>
                <br/>
                <tr>
                    <td><b>ID: </b></td>
                    <td>${q.id}</td>
                </tr>

                <tr>
                    <td><b>Content: </b></td>
                    <td><textarea name="content" class="content" rows="5">${q.question}</textarea></td>
                </tr>
                <c:if test="${not empty err.contentErr}">
                    <tr>
                        <td><font color="red">${err.contentErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer A: </b></td>
                    <td><textarea name="aa" class="answer" rows="3">${q.a}</textarea></td>
                </tr>
                <c:if test="${not empty err.aErr}">
                    <tr>
                        <td><font color="red">${err.aErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer B: </b></td>
                    <td><textarea name="ab" class="answer" rows="3">${q.b}</textarea></td>
                </tr>
                <c:if test="${not empty err.bErr}">
                    <tr>
                        <td><font color="red">${err.bErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer C: </b></td>
                    <td><textarea name="ac" class="answer" rows="3">${q.c}</textarea></td>
                </tr>
                <c:if test="${not empty err.cErr}">
                    <tr>
                        <td><font color="red">${err.cErr}</font></td>
                    </tr>
                </c:if>
                <tr>
                    <td><b>Answer D: </b></td>
                    <td><textarea name="ad" class="answer" rows="3">${q.d}</textarea></td>
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
                            <option ${sessionScope.numbertrue==1?"selected":""}>Answer A</option>
                            <option ${sessionScope.numbertrue==2?"selected":""}>Answer B</option>
                            <option ${sessionScope.numbertrue==3?"selected":""}>Answer C</option>
                            <option ${sessionScope.numbertrue==4?"selected":""}>Answer D</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b>Subject: </b></td>
                    <td>
                        <select name="subjectcbb">
                            <c:forEach items="${sessionScope.subjectupdate}" var="s">
                                <option ${q.sid==s.id?"selected":""}>${s.id}-${s.code}:${s.des} </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <input type="hidden" name="id" value="${q.id}"/>
                <input type="hidden" name="delete" value="${q.isdelete}"/>
                <input type="hidden" name="time" value="${q.createtime}"/>
            </table>
            <br/>
            <input type="submit" value="Update" onclick="return confirm('Are you sure to update ?')" />
        </form>
    </center>
    </body>
</html>
