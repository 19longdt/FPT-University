/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author hp
 */
public class Test {
    private int idQuestion;
    private int timmer;

    public Test() {
    }

    public Test(int idQuestion, int timmer) {
        this.idQuestion = idQuestion;
        this.timmer = timmer;
    }

    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion) {
        this.idQuestion = idQuestion;
    }

    public int getTimmer() {
        return timmer;
    }

    public void setTimmer(int timmer) {
        this.timmer = timmer;
    }
    
}
