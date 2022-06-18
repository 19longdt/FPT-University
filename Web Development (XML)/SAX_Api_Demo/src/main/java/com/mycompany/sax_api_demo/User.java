/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sax_api_demo;

/**
 *
 * @author 19longdt
 */
public class User {
    private String uid, username, password, role, mail;

    public User() {
    }

    public User(String uid, String username, String password, String role, String mail) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.role = role;
        this.mail = mail;
    }

    @Override
    public String toString() {
        return "User{" + "uid=" + uid + ", username=" + username + ", password=" + password + ", role=" + role + ", mail=" + mail + '}';
    }
    
    

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    
}
