<%-- 
    Document   : ManageQuiz
    Created on : 18-May-2021, 10:56:45
    Author     : hp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="t" class="modal.QuizDAO" scope="request" />
        <title>Manage Quiz Page</title>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>

        <div class="container">
            <div class="content">
                <jsp:include page="Header.jsp" ></jsp:include>
                    <div class="content">
                        <h4>Number of question: <span>${count}</span></h4> 
                    <c:if test="${count > 0}">
                        <table >
                            <thead>
                                <tr>
                                    <th>Question</th>
                                    <th>Date Created</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listQuiz}" var="o">
                                    <tr>
                                        <td>${o.question}</td>
                                        <td>${o.date}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${count < 1}">
                        <p><a href="MakeQuiz.jsp" >Make Quiz</a> Now!</p>
                    </c:if>

                </div>
                <c:if test="${count > 10}">
                    <div class="pagination">
                        <c:forEach begin="1" end="${end}" var="o">
                            <a class="${index == o ? "active" : ""}" href="ManageQuiz?index=${o}">${o}</a>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>
