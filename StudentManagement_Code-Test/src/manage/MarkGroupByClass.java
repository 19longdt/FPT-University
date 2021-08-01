/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import entity.Student;
import FileHandler.ReadWrite;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author admin
 */
public class MarkGroupByClass {

    Scanner sc = new Scanner(System.in);

    public void showInfoStudent(List<Student> list) {

        String con = "";
        do {
            int flag = 0;
            System.out.println("Input Student className: ");
            String className = sc.nextLine();

            for (int i = 0; i < list.size(); i++) {

                if (className.equals(list.get(i).getClassName())) {
                    System.out.println("StudentID: " + list.get(i).getId() + " | Student Code: " + list.get(i).getCode() + " | Student Name: " + list.get(i).getName());
                    flag = 1;
                } else if (className.equals("")) {
                    flag = 2;
                }
            }

            if (flag == 0) {
                System.out.println("Class not Found!!");
            } else if (flag == 2) {
                System.out.println("Class name can not empty!!");
            }
            System.out.println("Do you want to continue? Yes(Y)/No(Press any key): ");
            con = sc.nextLine();

        } while (con.toLowerCase().equals("y"));

    }

    public int showInfoStudent(List<Student> list, String className) {
        int n = 0;
        String con = "";
        do {
            int flag = 0;
            System.out.println("Input Student className: ");

            for (int i = 0; i < list.size(); i++) {

                if (className.equals(list.get(i).getClassName())) {
                    System.out.println("StudentID: " + list.get(i).getId() + " | Student Code: " + list.get(i).getCode() + " | Student Name: " + list.get(i).getName());
                    flag = 1;
                } else if (className.equals("")) {
                    flag = 2;
                }
            }

            if (flag == 0) {
                System.out.println("Class not Found!!");
               return n=2;
            } else if (flag == 2) {
                System.out.println("Class name can not empty!!");
                return n=1;
            }
            System.out.println("Do you want to continue? Yes(Y)/No(Press any key): ");

        } while (con.toLowerCase().equals("y"));
        return n=0;
    }
}
