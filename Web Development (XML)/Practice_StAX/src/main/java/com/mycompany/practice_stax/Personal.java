/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practice_stax;

/**
 *
 * @author 19longdt
 */
public class Personal {
    private String id, photo, givenName, familyName, email, link, link1, url;

    public Personal() {
    }

    public Personal(String id, String photo, String givenName, String familyName, String email, String link, String link1, String url) {
        this.id = id;
        this.photo = photo;
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
        this.link = link;
        this.link1 = link1;
        this.url = url;
    }

    @Override
    public String toString() {
        return "\nPersonal{" + "id=" + id + ", photo=" + photo + ", givenName=" + givenName + ", familyName=" + familyName + ", email=" + email + ", link=" + link + ", link1=" + link1 + ", url=" + url + '}';
    }

    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLink() {
        return link;
    }
    
    public String getLink1() {
        return link1;
    }
    public void setLink1(String link1) {
        this.link1 = link1;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
