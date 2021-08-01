<%-- 
    Document   : SolveRequest
    Created on : 28-Jun-2021, 21:08:02
    Author     : hp
--%>
<%@page import="java.time.LocalDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
                    <a href="logout"><button>Welcome ${sessionScope.user.shortName}, Logout</button></a>
                    <a href="login"><button>Home</button></a>
                    <a href="view"><button>View Request</button></a>
                    <a href="#"><button>Solve Request</button></a>
                    <button>Today is: <%=currentDate%></button>
                </div>
                <div class="right">
                    <div class="solve">
                        <h3 style="color: dodgerblue;">Request ID: ${r.id}</h3>
                        <form action="solverequest?requestID=${r.id}&add=1" method="post">
                            <table>
                                <tr>
                                    <td>Request to department</td>
                                    <td><input type="text" name="department" readonly value="${r.requestName}">                                 
                                    </td>
                                </tr>
                                <tr>
                                    <td>Student ID</td>
                                    <td><input type="text" name="stuId" readonly value="${r.studentId}"></td>
                                </tr>
                                <tr>
                                    <td>Student Name</td>
                                    <td><input type="text" name="stuName" readonly value="${r.studentName}"></td>
                                </tr>
                                <tr>
                                    <td>Date Create</td>
                                    <td><input type="text" name="dateCreate" readonly value="${r.dateCreated}"></td>
                                </tr>
                                <tr>
                                    <td>Request Title</td>
                                    <td><input type="text" name="title" readonly value="${r.title}" ></td>
                                </tr>
                                <tr>
                                    <td>Request Content</td>
                                    <td><textarea name="title" readonly>${r.content}</textarea></td>
                                </tr>
                                <tr>
                                    <td>Request Status</td>
                                    <td>
                                        <c:if test="${r.solution != null}">
                                            <input type="radio" name="status" style="width: auto;"  value="1" ${r.status == 1? "checked":""} readonly> <span style="color: green">Approve</span>
                                            <input type="radio" name="status" style="width: auto;"  value="2"  ${r.status == 2? "checked":""} readonly> <span style="color: red">Reject</span>
                                        </c:if>
                                        <c:if test="${r.solution == null}">
                                            <input type="radio" name="status" style="width: auto;"  value="1" checked > <span style="color: green">Approve</span>
                                            <input type="radio" name="status" style="width: auto;"  value="2" > <span style="color: red">Reject</span>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Date Close</td>
                                    <td><input type="text" name="dateClose" readonly value="${r.closeDate}"></td>
                                </tr>
                                <tr>
                                    <td>Solve By</td>
                                    <td><input type="text" name="solveBy" readonly value="${sessionScope.user.shortName}"></td>
                                </tr>
                                <tr>
                                    <td>Attaches (if have)</td>
                                    <td>
                                        <c:if test="${r.attachFile == null}">
                                            <a href="#" >Download File</a>
                                        </c:if>
                                        <c:if test="${r.attachFile != null}">
                                            <!--<a href="<%=request.getContextPath()%>/filea/${r.attachFile}" download >Download File</a>-->
                                            <a href="file/${r.attachFile}" download >Download File</a>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>School's Solution</td>
                                    <c:if test="${r.solution != null}">
                                        <td><textarea name="solution" readonly>${r.solution}</textarea></td>
                                    </c:if>
                                    <c:if test="${r.solution == null}">
                                        <td><textarea name="solution" required >School agrees to your request!!!</textarea></td>
                                    </c:if>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <c:if test="${check == null}">
                                            <button class="btnSave" type="submit" value="Save">Save </button>
                                        </c:if>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>

            </div>
            <div class="footer"></div>
        </div>
    </body>
</html>
