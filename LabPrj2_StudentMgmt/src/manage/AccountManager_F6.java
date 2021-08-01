/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import ValidateData.Validate;
import entity.User;
import java.util.*;

/**
 *
 * @author USE
 */
public class AccountManager_F6 {

    public Validate check = new Validate();
    Scanner sc = new Scanner(System.in);
    public static String temp = "";

   // static List<User> listU = ReadWrite.readFileUser();

    public User login(List<User> listU, String password, String username) {
        for (User user : listU) {
            if (username.equals(user.getName()) && password.equals(user.getPassword())) {
                temp = username;
                return user;
            }
        }
        return null;
    }

    public void logout() {
        if (check.checkYesNo("Do you want to logout?")) {
            System.exit(0);
        }
    }

    public boolean changeStudentPass(List<User> listU, String oldPass, String newPass, String username, String confPass) {
        username = temp;
        for (User user : listU) {
            if (username.equals(user.getName())) {
                while (true) {
                    user.setPassword(newPass);
                    if (confPass.equals(newPass)) {
                        //ReadWrite.writeFileUser(listU);
                        return true;
                    } else {
                        System.err.println("Confirm password incorrect");
                        return false;
                    }
                }
            }
        }
        return false;
    }

    public boolean changUserPass(List<User> listU, String code, String newPass) {
        for (User user : listU) {
            if ((user.getCode()).equals(code)) {
                while (true) {
                    user.setPassword(newPass);
                    //ReadWrite.writeFileUser(listU);
                    return true;
                }
            }
        }
        return false;
    }

    public void display(List<User> list) {
        for (User e : list) {
            System.out.println(e);
        }
    }
}
