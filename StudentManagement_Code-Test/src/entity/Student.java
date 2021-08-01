/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;

/**
 *
 * @author USE
 */
public class Student implements Serializable{

    private int id;
    private String code;
    private double mark;
    private String name;
    private String className;

    public Student() {
    }

    public Student(int id, String code, String name, String className, double mark) {
        this.id = id;
        this.code = code;
        this.mark = mark;
        this.className = className;
        this.name = name;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }

    public String getType(double mark) {
        String type = "";
        if (mark > 7.5) {
            type = "A";
        } else if (mark >= 6 && mark <= 7.5) {
            type = "B";
        } else if (mark >= 4 && mark < 6) {
            type = "C";
        } else {
            type = "D";
        }
        return type;
    }

    @Override
    public String toString() {
        return id + "\t" + code + "\t" + name + "\t" + className + "\t" + getType(mark);
    }

}
