/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
let n1, n2, answer, opSelect, ansOpt, t, aRs, aTF, indexAns;
let operator = ['+', '-', '*'];
let QuesNo = document.getElementById("QuesNo");
let score = document.getElementById("score");
let question = document.getElementById("question");
let timer = document.getElementById("timer");
let message = document.getElementById("message");
let result = document.getElementById("result");
let gameBox = document.getElementById("in-game");
let endBox = document.getElementById("end-game");
let start = document.getElementById("start-btn");
let buttons = document.getElementsByTagName("button");
let startBox = document.getElementById("start-game");
let fScore = document.getElementById("fscore");

clearInterval(t);
score.innerHTML = "0";
QuesNo.innerHTML = "0";
nextQuestion();
gameBox.style.display = "block"
endBox.style.display = "none";
time.style.display = "block";

function restart() {
    clearInterval(t);
    score.innerHTML = "0";
    QuesNo.innerHTML = "0";
    nextQuestion();
    gameBox.style.display = "block";
    endBox.style.display = "none";
    time.style.display = "block";
}

function Finished() {
    gameBox.style.display = "none";
    endBox.style.display = "flex";
//    lastmessage();
}

for (let i = 0; i < 2; i++) {
    buttons[i].addEventListener('click', () => {
    
        if (buttons[i].value == aTF[indexAns]) {
            Correct();
        } else {
            Incorrect();
        }
        clearInterval(t);
        out();
    });
}

function nextQuestion() {
    timer.style.width = "100%";
    stop();
    fScore.innerHTML = score.innerHTML;

    n1 = Math.floor(Math.random() * 100);
    n2 = Math.floor(Math.random() * 100);
    opSelect = operator[Math.floor(Math.random() * 3)];

    question.innerHTML = n1 + opSelect + n2;
    answer = eval(question.innerHTML);
    aTF = ["true"];

    indexAns = Math.floor(Math.random() * 2);
    aRs = [answer + Math.floor(Math.random() * 10), answer * Math.floor(Math.random() * 10), answer - Math.floor(Math.random() * 10)];

    if (aTF[indexAns] == "true") {
        result.innerHTML = aRs[Math.floor(Math.random() * 3)];
    } else {
        aRs = [answer + Math.floor(Math.random() * 10), answer * Math.floor(Math.random() * 10), answer - Math.floor(Math.random() * 10)];
        result.innerHTML = aRs[Math.floor(Math.random() * 3)];
    }
    getQuesNo();

}

function stop() {
    t = setInterval(() => {
        timer.style.width = (parseInt(timer.style.width) - 5) + "%";
        if (parseInt(timer.style.width) == 0) {
            clearInterval(t);
            Finished();
        }
    }, 1000)
}

function getQuesNo() {
    QuesNo.innerHTML = parseInt(QuesNo.innerHTML) + 1;
}

function getScore() {
    score.innerHTML = parseInt(score.innerHTML) + 5;
}

function Correct() {
    getScore();
}

function Incorrect() {
    Finished();
}

function out() {
    setTimeout(() => {
        nextQuestion();
    }, 100);
}



