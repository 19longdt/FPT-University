<%-- 
    Document   : Header
    Created on : 17-May-2021, 10:02:52
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>JSP Page</title>
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            a.disabled {
                pointer-events: none;
                color: #ccc;
            }
        </style>
        <script>

        </script>
    </head>
    <body>
        <div id="nav-bar">

            <c:if test="${sessionScope.student == null && sessionScope.teacher == null}">
                <a href="Home.jsp">Home</a>
                <a href="TakeQuiz" class="disabled">Take Quiz</a>
                <a href="MakeQuiz" class="disabled" >Make Quiz</a> 
                <a class="disabled" href="ManageQuiz" >Manage Quiz</a> 
            </c:if>

            <c:if test="${sessionScope.student != null && sessionScope.teacher == null}">
                <a href="Home.jsp" class="${sessionScope.numberQuestion != null ? "disabled" : ""}">Home</a> 
                <a href="TakeQuiz.jsp" class="${sessionScope.numberQuestion != null ? "disabled" : ""}" >Take Quiz</a>
                <a href="MakeQuiz" class="disabled" >Make Quiz</a> 
                <a class="disabled" href="ManageQuiz" >Manage Quiz</a> 
                <a href="LogOut" class="${sessionScope.numberQuestion != null ? "disabled" : ""}">Log Out</a>            
            </c:if>

            <c:if test="${sessionScope.student == null && sessionScope.teacher != null}">
                <a href="Home.jsp">Home</a> 
                <a href="TakeQuiz.jsp"  >Take Quiz</a>
                <a href="MakeQuiz.jsp" >Make Quiz</a>
                <a href="ManageQuiz?index=1" >Manage Quiz</a> 
                <a href="LogOut" >Log Out</a>
            </c:if>
        </div>
    </body>
</html>
