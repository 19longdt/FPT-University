/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practice_dom;

/**
 *
 * @author 19longdt
 */
public class Planest {
    private String color;
    private String name;
    private Common_Unit mass, day, radius, density, distance;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Common_Unit getMass() {
        return mass;
    }

    public void setMass(Common_Unit mass) {
        this.mass = mass;
    }

    public Common_Unit getDay() {
        return day;
    }

    public void setDay(Common_Unit day) {
        this.day = day;
    }

    public Common_Unit getRadius() {
        return radius;
    }

    public void setRadius(Common_Unit radius) {
        this.radius = radius;
    }

    public Common_Unit getDensity() {
        return density;
    }

    public void setDensity(Common_Unit density) {
        this.density = density;
    }

    public Common_Unit getDistance() {
        return distance;
    }

    public void setDistance(Common_Unit distance) {
        this.distance = distance;
    }

    @Override
    public String toString() {
        return "Planest{" + "color=" + color + ", name=" + name + ", mass=" + mass + ", day=" + day + ", radius=" + radius + ", density=" + density + ", distance=" + distance + '}';
    }

}
