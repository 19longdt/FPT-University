/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package is1419_he141276_xmlassignment2;

/**
 *
 * @author 19longdt
 */
public class Car {
    private String Name, Make, Model;

    public Car() {
    }

    public Car(String Name, String Make, String Model) {
        this.Name = Name;
        this.Make = Make;
        this.Model = Model;
    }

    @Override
    public String toString() {
        return "Car{" + "Name=" + Name + ", Make=" + Make + ", Model=" + Model + '}';
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getMake() {
        return Make;
    }

    public void setMake(String Make) {
        this.Make = Make;
    }
    
}
