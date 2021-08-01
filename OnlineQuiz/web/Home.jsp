<%-- 
    Document   : Home
    Created on : 15-May-2021, 13:11:41
    Author     : hp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>

        </style>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <jsp:include page="Header.jsp" ></jsp:include>

                <c:if test="${sessionScope.student == null && sessionScope.teacher == null}">
                    <div class="login">
                        <form action="Login" method="post">

                            <table>
                                <h2>Login Form</h2>
                                <thead>
                                    <tr>
                                        <th>User Name: </th>
                                        <th><input type="text" name="username" value="" required=""/></th>
                                    </tr>
                                    <tr>
                                        <th>Password: </th>
                                        <th><input type="password" name="password" value="" required=""/></th>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th><input type="submit" value="Sign in" /><a href="Register.jsp">Register</a></th>
                                    </tr>
                                </thead>
                            </table>
                            <p>${result}</p>
                        </form>
                    </div>

                </c:if>

                <c:if test="${sessionScope.student != null || sessionScope.teacher != null}">
                    <h3>Welcome <span>${sessionScope.student.userName} ${sessionScope.teacher.userName}</span></h3>
                </c:if>
            </div>
        </div>
    </body>
</html>
