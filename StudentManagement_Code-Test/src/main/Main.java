/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import ValidateData.Validate;
import entity.*;
import FileHandler.ReadWrite;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import manage.*;

/**
 *
 * @author USE
 */
public class Main {

    static Validate check = new Validate();
    static AccountManager_F6 manageAccount = new AccountManager_F6();

    public static void main(String[] args) throws FileNotFoundException, IOException {

        List<Student> lstS = ReadWrite.readFileStudent();
        List<User> listUser = ReadWrite.readFileUser();

        while (true) {
            System.out.println("---------- LOGIN ----------");
            String username = check.checkUsernameLogin("Username: ", listUser);
            String password = check.checkPassword("Password: ");
            User user = manageAccount.login(listUser, password, username);
            if (user == null) {
                System.err.println("Wrong password");
            } else {
                System.out.println("Login Succesfull");
                if (user.getRole() == 1) {
                    MainControllerUser.AdminConttroller(lstS, listUser);
                    return;
                } else {
                    MainControllerStudent.studentController(lstS, listUser);
                    return;
                }
            }
        }

    }
}
