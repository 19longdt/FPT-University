/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import ValidateData.Validate;
import FileHandler.ReadWrite;
import entity.Student;
import entity.User;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Logger;

/**
 *
 * @author USE
 */
public class UserManager {

    Validate check = new Validate();
    Scanner sc = new Scanner(System.in);

    ReadWrite rw = new ReadWrite();

    ArrayList<User> listUser = ReadWrite.readFileUser();

    public void f4Menu() throws FileNotFoundException {
        while (true) {
            switch (View.InterfaceView.menuManageUser()) {
                case 1:
                    display();
                    break;
                case 2:
                    addUser();
                    break;
                case 3:
                    updateUser();
                    break;
                case 4:
                    changePassword();
                    break;
                case 5:
                    removeUser();
                    break;
                default:
                    rw.writeFileUser(listUser);
                    return;
            }
        }
    }

    public void display() throws FileNotFoundException {
        int check = 0;
        for (User e : listUser) {
            if (e.getRole() == 0) {
                check++;
                System.out.println(e);
            }
        }
        if (check == 0) {
            System.err.println("Empty List User");
        }
    }

    void addUser() throws FileNotFoundException {
        List<Student> listStudent = ReadWrite.readFileStudent();

        System.out.println("Add User!!");
        int id;
        int size = listUser.size();
        if (listUser.isEmpty()) {
            id = 1;
        } else {
            id = listUser.get(size - 1).getId() + 1;
        }

        String code = check.checkString("Enter user Code : ");

        Student student = check.getStudent(listStudent, code);

        if (student == null) {
            System.out.println("not match with student code");
            return;
        }
        String name = check.checkUsername("Enter user name: ");
        User user = check.getUser(listUser, name);

        if (user != null) {
            System.out.println("Dubplicate UserName");
        } else {
            String password = check.checkPassword("Enter password: ");
            User u = new User(id, code, name, password, 0);
            listUser.add(u);
            System.out.println("Add new User successfully");
        }
    }

    public void removeUser() {

        System.out.println("Remove User!!");
        int id = check.CheckInt("Enter ID:", 0, Integer.MAX_VALUE);

        for (User user : listUser) {
            if (user.getId() == id) {
                String option = check.checkString("Do you Want Remove this User? (Y or N)");
                if (option.equalsIgnoreCase("y")) {
                    listUser.remove(user);
                    System.out.println("Remove successfully");
                    return;
                } else {
                    System.out.println("Not Remove this User!");
                    return;
                }
            }
        }
        System.out.println("ID does not exist");
    }

    public void updateUser() {
        List<Student> listStudent = rw.readFileStudent();

        System.out.println("Update User!!");
        int id = check.CheckInt("Enter ID:", 0, Integer.MAX_VALUE);
        for (User user : listUser) {
            if (user.getId() == id) {
                String code = check.checkString("Enter Code: ");
                if (check.getStudent(listStudent, code) != null) {
                    System.err.println("Duplicate Code");
                    return;
                }
                int index = check.getIndexStudent(listStudent, user.getCode());
                user.setCode(code);
                listStudent.get(index).setCode(code);
                rw.writeFileStudent(listStudent);
                System.out.println("Update Code successfully");
                return;
            }
        }
        System.out.println("code does not exist");
    }

    public void changePassword() {
        System.out.println("Change Password User!!");

        int id = check.CheckInt("Enter ID:", 0, Integer.MAX_VALUE);

        User user = check.getUserbyID(listUser, id);
        if (user != null) {
            while (true) {
                String password = check.checkPassword("Enter new Password: ");
                String repassword = check.checkPassword("Enter repassword: ");

                if (password.equals(repassword)) {
                    for (int i = 0; i < listUser.size(); i++) {
                        if (listUser.get(i).getId() == (id)) {
                            listUser.get(i).setPassword(repassword);
                            break;
                        }
                    }
                    break;
                } else {
                    System.out.println("rePassword must equal with new Password");
                }
            }
            System.out.println("Change Password Successfull!");
            return;
        }

        System.out.println("code does not exist");

    }

    /*.
    .
    . //////////////////////////////////////////////////////////////////////////
    .
    .*/
    boolean display(List<User> listUser) throws FileNotFoundException {
        int check = 0;
        for (User e : listUser) {
            if (e.getRole() == 0) {
                check++;
                System.out.println(e);
            }
        }
        if (check == 0) {
            System.err.println("Empty List User");
            return false;
        }
        return true;
    }

    boolean addUser(String code, String name, String password) throws FileNotFoundException {
        List<Student> listStudent = ReadWrite.readFileStudent();

        System.out.println("Add User!!");
        int id;
        int size = listUser.size();
        if (listUser.isEmpty()) {
            id = 1;
        } else {
            id = listUser.get(size - 1).getId() + 1;
        }

        if (!check.checkString("Enter Code: ", code)) {
            return false;
        }
        Student student = check.getStudent(listStudent, code);

        if (student == null) {
            System.err.println("not match with student code");
            return false;
        }
//        String name = check.checkUsername("Enter user name: ");
        if (!check.checkUsername("Enter user name: ", name)) {
            return false;
        }
        User user = check.getUser(listUser, name);

        if (user != null) {
            System.err.println("Dubplicate UserName");
            return false;
        } else {
            if (!check.checkPassword("Enter password: ", password)) {
                return false;
            }
            User u = new User(id, code, name, password, 0);
            listUser.add(u);
            System.out.println("Add new User successfully");
        }
        return true;
    }

    StudentManager stm = new StudentManager();
    
    public boolean updateUser(int id, String code) throws FileNotFoundException {
        List<Student> listStudent = rw.readFileStudent();

        System.out.println("Update User!!");
        if (!check.CheckInt(id, 0, Integer.MAX_VALUE)) {
            return false;
        }

        for (User user : listUser) {
            if (user.getId() == id) {
                if (!check.checkString("Enter Code: ", code)) {
                    return false;
                }
                if (check.getStudent(listStudent, code) != null) {
                    System.err.println("Duplicate Code");
                    return false;
                }
                int index = check.getIndexStudent(listStudent, user.getCode());
                listStudent.get(index).setCode(code);
                user.setCode(code);
//                rw.writeFileStudent(listStudent);
                System.out.println("Update Code successfully");
                display();
                stm.display(listStudent);
                return true;
            }
        }
        System.err.println("id does not exist");
        return false;
    }

    public boolean changePassword(int id, String password, String repassword) {
        System.out.println("Change Password User!!");

        if (!check.CheckInt(id, 0, Integer.MAX_VALUE)) {
            return false;
        }

        User user = check.getUserbyID(listUser, id);
        if (user != null) {
            while (true) {
                if (!check.checkPassword("Enter new Password: ", password)) {
                    return false;
                }
                if (!check.checkPassword("Enter renew Password: ", repassword)) {
                    return false;
                }

                if (password.equals(repassword)) {
                    for (int i = 0; i < listUser.size(); i++) {
                        if (listUser.get(i).getId() == (id)) {
                            listUser.get(i).setPassword(repassword);
                            break;
                        }
                    }
                    break;
                } else {
                    System.err.println("rePassword must equal with new Password");
                    return false;
                }
            }
            System.out.println("Change Password Successfull!");
            return true;
        }

        System.err.println("id does not exist");
        return false;
    }

    public boolean removeUser(int id, String option) {

        System.out.println("Remove User!!");
        if (!check.CheckInt(id, 0, Integer.MAX_VALUE)) {
            return false;
        }

        for (User user : listUser) {
            if (user.getId() == id) {
                if (!check.checkString("Do you Want Remove this User? (Y or N)", option)) {
                    return false;
                }
                if (option.equalsIgnoreCase("y")) {
                    listUser.remove(user);
                    System.out.println("Remove successfully");
                    return true;
                } else {
                    System.err.println("Not Remove this User!");
                    return true;
                }
            }
        }
        System.err.println("ID does not exist");
        return false;
    }

}
