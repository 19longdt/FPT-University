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
public class User {

    private int id, type;
    private String userName, passWord, mail;

    public User(int id, int type, String userName, String passWord, String mail) {
        this.id = id;
        this.type = type;
        this.userName = userName;
        this.passWord = passWord;
        this.mail = mail;
    }

    public User(int type, String userName, String passWord, String mail) {
        this.type = type;
        this.userName = userName;
        this.passWord = passWord;
        this.mail = mail;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

}
