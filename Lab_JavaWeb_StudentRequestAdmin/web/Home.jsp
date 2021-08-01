<%-- 
    Document   : Home
    Created on : 28-Jun-2021, 21:07:32
    Author     : hp
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%LocalDate currentDate = LocalDate.now();%>
        <div class="container">
            <div class="header">
                <h1>FPT Education System</h1>
                <h3>Teacher Control Panel</h3>
            </div>

            <div class="content">
                <div class="left">
                    <c:if test="${sessionScope.user == null}">
                        <a href="Home.jsp"><button>Login</button></a>
                        <a href="#"><button>Home</button></a>
                        <a href="#"><button>View Request</button></a>
                    </c:if>

                    <c:if test="${sessionScope.user != null}">
                        <a href="logout"><button>Welcome ${sessionScope.user.shortName}, Logout</button></a>
                        <a href="login"><button>Home</button></a>
                        <a href="view"><button>View Request</button></a>
                    </c:if>
                    <a href="#"><button>Solve Request</button></a>
                    <a href="#"><button>Today is: <%=currentDate%></button> </a>
                </div>
                <div class="right">
                    <c:if test="${sessionScope.user == null}">
                        <div class="login">
                            <h2>Member Login</h2>
                            <p>Using your username and password</p>
                            <form id="inputlogin" action="login" method="post">
                                <table>
                                    <tr>
                                        <td>Username: </td>
                                        <td><input type="text" name="userName" value="${userName}"></td>
                                    </tr>
                                    <tr>
                                        <td>Password </td>
                                        <td><input type="password" name="password" value="${password}"></td>
                                    </tr>
                                </table>
                                <input class="btnLogin" type="submit" value="Login">
                                <h5>${result}</h5>  
                            </form>
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.user != null}">
                        <div class="after_login">
                            <h3 style="color: dodgerblue;">Request received by today</h3>
                            <table class="request_today" border="groove 2px">
                                <tr>
                                    <th>Department name</th>
                                    <th>Number of Request</th>
                                    <th>View</th>
                                </tr>
                                <c:forEach items="${listToday}" var="i">
                                    <tr>
                                        <td>${i.requestName}</td>
                                        <td>${i.count}</td>
                                        <td><a href="view?requestTo=${i.requestToDid}&today=1">View</a></td>
                                    </tr>
                                </c:forEach>
                            </table>

                            <h3 style="color: dodgerblue;">Request received in the last 2 days</h3>
                            <table class="request_last" border="groove 2px">
                                <tr>
                                    <th>Department name</th>
                                    <th>Number of Request</th>
                                    <th>View</th>
                                </tr>
                                <c:forEach items="${listLast2Day}" var="i">
                                    <tr>
                                        <td>${i.requestName}</td>
                                        <td>${i.count}</td>
                                        <td><a href="view?requestTo=${i.requestToDid}&today=0">View</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </c:if>
                </div>

            </div>
            <div class="footer"></div>
        </div>
    </body>
</html>
