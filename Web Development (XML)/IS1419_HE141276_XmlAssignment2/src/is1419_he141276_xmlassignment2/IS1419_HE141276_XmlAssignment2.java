/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package is1419_he141276_xmlassignment2;

import java.util.List;
import java.util.Scanner;

/**
 *
 * @author 19longdt
 */
public class IS1419_HE141276_XmlAssignment2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String pathFile = "C:\\Users\\win\\OneDrive\\Máy tính\\SUM 22\\XML\\IS1419_HE141276_XmlAssignment2\\src\\cars.xml";
        MyHandler myH = new MyHandler();
        List<Cars> listC = myH.getAllCars(pathFile);

        while (true) {
            Scanner sc = new Scanner(System.in);

            System.out.println("=====Xml Program=====");
            System.out.println("1. Read file car.xml");
            System.out.println("2. Add Car to car.xml");
            System.out.println("3. Update Car in car.xml");
            System.out.print("Please choice one option: ");

            int choice = (int) (checkNumberLimit(1, 4));
            switch (choice) {
                case 1:
                    System.out.println(listC);
                    break;
                case 2:
                    System.out.print("Enter CarId ");
                    int cid = (int) (checkNumberLimit(1, Double.MAX_VALUE));

                    boolean carExists = listC.stream().anyMatch(car -> cid == car.getCarId());
                    if (!carExists) {
                        System.out.println("Enter Car Info: ");
                        System.out.print("\tEnter Car Name: ");
                        String carName = sc.nextLine();

                        System.out.print("\tEnter Make: ");
                        String make = sc.nextLine();

                        System.out.print("\tEnter Model: ");
                        String model = sc.nextLine();

                        System.out.print("\tEnter Price: ");
                        Double price = checkNumberLimit(0, Double.MAX_VALUE);

                        System.out.print("\tEnter Type: ");
                        String type = sc.nextLine();

                        Car c = new Car(carName, make, model);
                        Cars cs = new Cars(cid, c, price, type);
                        listC.add(cs);
                        myH.writeFile(pathFile, listC);
                    } else {
                        System.out.println("CarId exists!");
                    }
                    break;
                case 3:
                    System.out.print("Enter CarId ");
                    int cid1 = (int) (checkNumberLimit(1, Double.MAX_VALUE));

                    boolean carExists1 = listC.stream().anyMatch(car -> cid1 == car.getCarId());
                    if (carExists1) {
                        for (Cars cars : listC) {
                            if (cid1 == cars.getCarId()) {
                                System.out.println("Enter Car Info: ");
                                System.out.print("\tOld Name: " + cars.getCarInfo().getName() + " - new Name: ");
                                String carName = sc.nextLine();

                                System.out.print("\tOld Make: " + cars.getCarInfo().getMake()+ " - new Make: ");
                                String make = sc.nextLine();

                                System.out.print("\tOld Model: " + cars.getCarInfo().getModel()+ " - new Model: ");
                                String model = sc.nextLine();

                                System.out.print("\tOld Price: " + cars.getPrice()+ " - new Price: ");
                                Double price = checkNumberLimit(0, Double.MAX_VALUE);

                                System.out.print("\tOld Type: " + cars.getType()+ " - new Type: ");
                                String type = sc.nextLine();
                                
                                Car c = new Car(carName, make, model);
                                cars.setCarId(cid1);
                                cars.setCarInfo(c);
                                cars.setPrice(price);
                                cars.setType(type);
                            }
                        }
                        myH.writeFile(pathFile, listC);
                    } else {
                        System.out.println("CarId not exists!");
                    }
                    break;
                case 4:
                    System.exit(0);
            }
        }
    }

    public static double checkNumberLimit(double min, double max) {
        Scanner sc = new Scanner(System.in);
        double n;
        while (true) {
            try {

                n = Double.parseDouble(sc.nextLine());
                if (n >= min && n <= max) {
                    return n;
                } else {
                    System.err.println("Please enter number between " + min + " and " + max);
                }
            } catch (NumberFormatException e) {
                System.err.println("Please enter number");
            }
        }
    }

}
