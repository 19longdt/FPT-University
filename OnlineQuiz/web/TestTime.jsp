<%-- 
    Document   : index
    Created on : 15-May-2021, 13:11:01
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <script>
            function startTimer(duration, display) {
                var timer = duration, minutes, seconds;

                var a = document.getElementById('a');
                var b = document.getElementById('b');
                var n = document.getElementById('next');
                var info = document.getElementById('info');

                setInterval(function () {
                    minutes = parseInt(timer / 60, 10)
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;

                    if (--timer < 0) {
                    timer = 0;
                            a.style.display = "none";
                            b.style.display = "none";
                            n.style.display = "none";
                         //   int countCorrectAnswer = Integer.parseInt(String.valueOf(session.getAttribute("countCorrectAnswer")));
                           // int numberQuestion = Integer.parseInt(String.valueOf(session.getAttribute("numberQuestion")));
                    info.innerHTML = "Time out !!! Your Score: 10 🙂";
                    }
                }, 1000);
            }

            window.onload = function () {
                var fiveMinutes = 1 * 5,
                        display = document.querySelector('#time');
                startTimer(fiveMinutes, display);
            };
        </script>
    <body>
        <div id="info">Registration closes in <span id="time">05:00</span> minutes!</div>
        <p id="a">
            <input type="checkbox" name="a" > 
            a answer
        </p>
        <p id="b">
            <input type="checkbox" name="b" > 
            b answer
        </p>
        <input type="button" value="Next" id = "next">
    </body>
</html>
