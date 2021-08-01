/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import FileHandler.ReadWrite;
import ValidateData.Validate;
import View.InterfaceView;
import entity.Student;
import entity.User;
import java.io.FileNotFoundException;
import java.util.List;
import manage.AccountManager_F6;
import manage.GradingMarkManager;
import manage.MarkGroupByClass;
import manage.MarkManager;
import manage.StudentManager;
import manage.UserManager;

/**
 *
 * @author BlackBear
 */
public class MainControllerUser {

    static Validate check = new Validate();
    static StudentManager studetManage = new StudentManager();
    static MarkManager manageMark = new MarkManager();
    static MarkGroupByClass groupMark = new MarkGroupByClass();
    static GradingMarkManager gradingType = new GradingMarkManager();
    static AccountManager_F6 manageAccount = new AccountManager_F6();
    static UserManager userManager = new UserManager();

    public static void AdminConttroller(List<Student> listS, List<User> listU) throws FileNotFoundException {
        while (true) {
            int option = InterfaceView.menuAdmin();
            switch (option) {
                case 1:
                    studetManage.manager(listS);
                    break;
                case 2:
                    manageMark.menu();
                    break;
                case 3:
                    groupMark.showInfoStudent(listS);
                    break;
                case 4:
                    userManager.f4Menu();
                    break;
                case 5:
                    gradingType.calPercent(listS);
                    break;
                case 6:
                    System.out.println("Change User Password");
                    String code = check.checkString("Enter Code:");
                    if (check.checkExistCode(FileHandler.ReadWrite.readFileUser(), code)) {
                        String newPass = check.checkPassword("Enter your new password: ");
                        if (manageAccount.changUserPass(FileHandler.ReadWrite.readFileUser(), code, newPass)) {
                            System.out.println("Change pass successfully");
                        } else {
                            System.err.println("Change pass fail !");
                        }
                    } else {
                        System.out.println("Code does not exist");
                    }
                    break;
                case 7:
                    ReadWrite.writeFileStudent(listS);
//                    ReadWrite.writeFileUser(listU);
                    System.exit(0);
                default:
                    return;
            }
        }
    }
}
