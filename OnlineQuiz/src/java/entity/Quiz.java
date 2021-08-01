/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author hp
 */
public class Quiz {

    private int idQuiz;
    private String question, answer, date;
    private ArrayList<String> option;

    public Quiz() {
    }
    public Quiz(String question, String date) {

        this.question = question;
        this.date = date;
    }
    public Quiz(String question, String answer, ArrayList<String> option) {

        this.question = question;
        this.answer = answer;
        this.option = option;
    }

    public Quiz(int idQuiz, String question, String answer, ArrayList<String> option) {
        this.idQuiz = idQuiz;
        this.question = question;
        this.answer = answer;
        this.option = option;
    }
    public Quiz(int idQuiz, String question, String answer, ArrayList<String> option, String date) {
        this.idQuiz = idQuiz;
        this.question = question;
        this.answer = answer;
        this.option = option;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getIdQuiz() {
        return idQuiz;
    }

    public void setIdQuiz(int idQuiz) {
        this.idQuiz = idQuiz;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public ArrayList<String> getOption() {
        return option;
    }

    public void setOption(ArrayList<String> option) {
        this.option = option;
    }

}
