/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import ValidateData.Validate;

/**
 *
 * @author BlackBear
 */
public class InterfaceView {

    static Validate check = new Validate();

    public static int menuAdmin() {
        System.out.println("*********************** Menu For Admin ***********************\n"
                + "--------------------------------------------------------------");
        System.out.println("1. View List, add, update, delete Student");
        System.out.println("2. Add, update, delete, the marks of a specific student");
        System.out.println("3. Query student information, including the marks, group by classes");
        System.out.println("4. View list, add, update, delete user; change user’s password");
        System.out.println("5. Query & print out the percentages of student grading-types (ABCD)");
        System.out.println("6. Change user’s password");
        System.out.println("7. Logout");
        return check.CheckInt("Enter your choice: ", 1, 7);
    }

    public static int menuWorker() {
        System.out.println("*********************** Menu For Student ***********************\n"
                + "------------------------------------------------------------");
        System.out.println("1. Query student information, including the marks, group by classes");
        System.out.println("2. Change user’s password");
        System.out.println("3. Logout");
        return check.CheckInt("Enter your choice: ", 1, 3);
    }

    public static int menuManageStudent() {
        System.out.println("1. View List Student\n"
                + "2. Add Student\n"
                + "3. Update Student\n"
                + "4. Delete Student\n"
                + "5. Save And Return\n"
                + "6. Exit");
        System.out.println("----------------------------------");
        return check.CheckInt("Enter your choose : ", 1, 6);
    }
    public static int menuManageUser(){
        System.out.println("4.1 - View List");
        System.out.println("4.2 - Add");
        System.out.println("4.3 - Update");
        System.out.println("4.4 - Change Password");
        System.out.println("4.5 - Delete user");
        System.out.println("4.6 - Save to File and Back List");
        return check.CheckInt("Enter Choice: ", 1, 6);
    }
}
