/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dom_demo1;

/**
 *
 * @author 19longdt
 */
public class Book {

    public String Id;
    public String Name;
    public String Author;
    public float Price;
    public String Category;

    @Override
    public String toString() {
        return "Book{" + "Id=" + Id + ", Name=" + Name + ", Author=" + Author + ", Price=" + Price + ", Category=" + Category + '}' + "\n";
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String Author) {
        this.Author = Author;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }
    
    
}
