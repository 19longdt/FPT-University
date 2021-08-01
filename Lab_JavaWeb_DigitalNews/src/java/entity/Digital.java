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
public class Digital {

    private int ID;
    private String title, description, image, author, time, shortDes;

    public Digital() {
    }

    public Digital(int ID, String title, String description, String image, String author, String time, String shortDest) {
        this.ID = ID;
        this.title = title;
        this.description = description;
        this.image = image;
        this.author = author;
        this.time = time;
        this.shortDes = shortDest;
    }

    public Digital(String title, String description, String image, String author, String time, String shortDest) {
        this.title = title;
        this.description = description;
        this.image = image;
        this.author = author;
        this.time = time;
        this.shortDes = shortDest;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDes(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDest) {
        this.shortDes = shortDest;
    }
}
