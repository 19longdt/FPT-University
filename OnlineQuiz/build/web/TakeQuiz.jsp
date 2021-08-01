<%-- 
    Document   : TakeQuiz
    Created on : 15-May-2021, 16:24:22
    Author     : hp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/takequiz.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <style>
            #inputNumber{
                display: none;
            }
            #timeout{
                display: none;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function checkFinish() {
                var mycheck = document.getElementById("mycheck");
                if (mycheck.checked) {
                    window.location = "Result?checkFinish=1";
                } else {
                    alert("CheckBox not checked.");
                }
            }
            
            function Next() {
                var answer = document.getElementsByName("answer");
//                var answer1 = document.getElementById("#ans").value;
                var checkedValue = "";
                for (var i = 0; i < answer.length; ++i) {
                    if (answer[i].checked == true) {
                        checkedValue = answer[i].value;
                        break;
                    }
                }
//                alert(checkedValue);
                $.ajax({
                    url: "/OnlineQuiz/NextQuiz",
                    type: 'post',
                    data: {
                        ans: checkedValue
                    },
                    success: function (result) {
                        var content = document.getElementById("content");
                        content.innerHTML = result;
                    }
                });
            }

            function startTimer(duration, display) {
                var timer = duration;
                var seconds;
                var minutes;
                var a = document.getElementById('timeout');
                var b = document.querySelector('#info #time');
                var content = document.getElementById("content");
                var info = document.getElementById('info');
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10);
                    seconds = parseInt(timer % 60, 10);
                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;
                    display.textContent = minutes + ":" + seconds;

//                    if(timer == 2){
//                    }
//                    
                    if (timer == 0) {
//                        timer = 0;
                        a.style.display = "block";
                        b.style.display = "none";
                        info.style.display = "none";
                        content.style.display = "none";
                    }
                    timer--;
                }, 1000);
            }
            onload = function () {

                var setTime = (${sessionScope.timeout}),
                        display = document.querySelector('#info #time');
                startTimer(setTime, display);
            };
        </script>
    </head>
    <body>
        <!-- ss.numberQuestion, result == null-->

        <c:if test="${sessionScope.numberQuestion == null && result == null}">
            <div class="container">
                <div class="content">
                    <jsp:include page="Header.jsp" ></jsp:include>
                        <form action="preTake" method="post">
                            <br>
                            <h3>Enter number of questions: </h3>
                            <input type="text" name="numberQuestion" value="" />
                            <input type="submit" value="Start" />
                            <br>
                            <p>${check}</p>
                    </form>
                </div>
            </div>

        </c:if>

        <!--finish, result == null-->

        <c:if test="${finish == null && result == null }">
            <c:if test="${sessionScope.numberQuestion != null}">   

                <div class="container">

                    <div class="content">
                        <jsp:include page="Header.jsp" ></jsp:include>
                        <%--<c:if test="${sessionScope.result == null}">--%>
                        <div id="info">Time Remaining <span id="time"></span> </div>
                        <%--</c:if>--%>
                        ${sessionScope.tt}
                        <div id="timeout">
                            <form action="Result?checkFinish=1" method="post">
                                Time Out, <input type="submit" value="View Score" />    
                            </form>
                        </div>
                        <div id="content">
                            <h4>${question}</h4>
                            <c:forEach items="${listOption}" var="o">
                                <input class="valueChecked" type="checkbox" id="ans" name="answer" value="${o}"/>${o}
                                <br>
                            </c:forEach>
                            <button onclick="Next()" >Next</button>
                        </div>
                    </div>
                </div>   
            </c:if>
        </c:if>

        <!--finish != null, result == null-->
        <c:if test="${finish != null && result == null }">
            <div>
                <!--            <form action="Result" method="post">-->
                <input type="checkbox" id="mycheck" />${finish}
                <br>
                <a href="#" onclick="checkFinish()">Finish</a>
                <!--<input type="submit" value="Finish" />-->           
                <!--</form>-->
            </div>
        </c:if> 

        <!--result != null-->
        <c:if test="${result != null}">

            <div class="container">
                <div class="content">
                    <jsp:include page="Header.jsp" ></jsp:include>
                    <c:if test="${sessionScope.status == null}">
                        <h3>Your Score <span style="color: red;">${result}</span></h3>
                        </c:if>
                        <c:if test="${sessionScope.status != null}">
                        <h3>Your Score <span style="color: green;">${result}</span></h3>
                        </c:if>
                    <br>
                    <h3>Take another test  <input type="button" onclick="check()" value="Start" id="button"></h3>

                    <form id="inputNumber" action="preTake" method="post">
                        <h3>Enter number of questions: </h3>
                        <input type="text" name="numberQuestion" value="" />
                        <input type="submit" value="Start" />
                    </form>
                    <script>
                        function check() {
                            var button = document.getElementById("button");
                            var numberQuestion = document.getElementById("inputNumber");
                            if (button.value === "Start") {
                                numberQuestion.style.display = "block";
                                button.value = "Close";
                            } else {
                                numberQuestion.style.display = "none";
                                button.value = "Start";
                            }
                        }
                    </script>
                </div>
            </div>
        </c:if>

    </body>
</html>
