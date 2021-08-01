/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import ValidateData.Validate;
import View.InterfaceView;
import entity.Student;
import entity.User;
import java.util.List;
import static main.MainControllerUser.check;
import manage.AccountManager_F6;

/**
 *
 * @author BlackBear
 */
public class MainControllerStudent {

    static AccountManager_F6 manageAccount = new AccountManager_F6();
   static Validate val = new Validate();
    public static void studentController(List<Student> listS, List<User> listU) {
        while (true) {
            int option = InterfaceView.menuWorker();
            switch (option) {
                case 1:
                    break;
                case 2:
                    System.out.println("Change Student Password");
                    String oldPass = val.checkPassword("Enter your old password: ");
                    if (val.checkOldPass(listU, oldPass)) {
                        String newPass = check.checkPassword("Enter your new password: ");
                       String confPass = check.checkPassword("Enter confirm password: ");
                        if (manageAccount.changeStudentPass(FileHandler.ReadWrite.readFileUser(), oldPass, newPass, AccountManager_F6.temp,confPass)) {
                            System.out.println("Change pass successfully");
                        }
                        else{
                            System.out.println("Chanege pass error !");
                        }
                    } else {
                        System.out.println("Your old pass incorrect !");
                    }
                    break;
                case 3:
                    System.exit(0);
                    default: return;
            }
        }
    }
}
