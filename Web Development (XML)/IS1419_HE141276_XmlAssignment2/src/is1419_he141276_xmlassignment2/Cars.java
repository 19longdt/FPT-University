/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package is1419_he141276_xmlassignment2;

/**
 *
 * @author 19longdt
 */
public class Cars {
    private int CarId;
    private Car CarInfo;
    private double Price;
    private String Type;

    public Cars() {
    }

    public Cars(int CarId, Car CarInfo, double Price, String Type) {
        this.CarId = CarId;
        this.CarInfo = CarInfo;
        this.Price = Price;
        this.Type = Type;
    }

    @Override
    public String toString() {
        return "\nCars{" + "CarId=" + CarId + ", CarInfo=" + CarInfo + ", Price=" + Price + ", Type=" + Type + '}';
    }

    public int getCarId() {
        return CarId;
    }

    public void setCarId(int CarId) {
        this.CarId = CarId;
    }

    public Car getCarInfo() {
        return CarInfo;
    }

    public void setCarInfo(Car CarInfo) {
        this.CarInfo = CarInfo;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }
    
    
}
