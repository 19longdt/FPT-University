<%-- 
    Document   : MakeQuiz
    Created on : 17-May-2021, 10:11:00
    Author     : hp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/make.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <script>
            function check() {
                var answer = document.getElementsByName("answer");
                var checkedValue = "", c = 0;
                for (var i = 0; i < answer.length; ++i) {
                    if (answer[i].checked == true) {
                        checkedValue = answer[i].value;
                        c = 1;
                        break;
                    }
                }
                if (c == 0) {
                    alert("Answer not checked.");
                    return ;
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <jsp:include page="Header.jsp" ></jsp:include>
                <form action="MakeQuiz" method="post">
                        <table>
                            <tbody>
                                <tr>
                                    <td>Question:</td>
                                    <td><textarea name="question" required></textarea></td>
                                </tr>
                            <c:forEach begin="1" end="4" var="o">
                                <tr>
                                    <td>Option${o}: </td>
                                    <td><textarea name="option${o}" required></textarea></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td>Answer:</td>
                                <td>
                                    <c:forEach begin="0" end="3" var="o">
                                        <input type="radio" name="answer" id="radio" value="${o + 1}" />Option ${o + 1}
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <!--<a href="#" onclick="check()">Save</a>-->
                                    <input type="submit" id="" value="Save" >${resultMakeQuiz}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
