/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ValidateData;

import entity.Student;
import entity.User;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;
import manage.AccountManager_F6;

/**
 *
 * @author USE
 */
public class Validate {

    Scanner sc = new Scanner(System.in);

    public Student getStudent(List<Student> list, String code) {
        for (Student student : list) {
            if (code.equalsIgnoreCase(student.getCode())) {
                return student;
            }
        }
        return null;
    }

    public User getUser(List<User> list, String userName) {
        for (User user : list) {
            if (userName.equalsIgnoreCase(user.getName())) {
                return user;
            }
        }
        return null;
    }

    public User getUserbyID(List<User> list, int ID) {
        for (User user : list) {
            if (ID == user.getId()) {
                return user;
            }
        }
        return null;
    }

    public int CheckInt(String smg, int min, int max) {
        while (true) {
            System.out.print(smg);
            try {
                int input = Integer.parseInt(sc.nextLine().trim());
                if (input >= min && input <= max) {
                    return input;
                } else {
                    System.out.println("Out of range " + "{ " + min + ", " + max + "}");
                    continue;
                }
            } catch (NumberFormatException e) {
                System.out.println("You must try again");
            }
        }
    }

    public double CheckDouble(String mess, double min, double max) {
        while (true) {
            System.out.print(mess);
            try {
                double input = Double.parseDouble(sc.nextLine().trim());
                if (input >= min && input <= max) {
                    return input;
                } else {
                    System.err.println("Out range " + "{ " + min + ", " + max + "}");
                }
            } catch (NumberFormatException e) {
                System.err.println("You must try again");
            }
        }
    }

    public String checkString(String mess) {
        while (true) {
            System.out.print(mess);
            String str = sc.nextLine().trim();
            if (str.isEmpty()) {
                System.err.println("Can not empty!");
            } else {
                return str;
            }
        }
    }

    public String checkPassword(String message) {
        while (true) {
            System.out.print(message);
            String password = sc.nextLine().trim();

            Pattern pattern = Pattern.compile("[a-zA-Z0-9]{6,}");
            if (password.isEmpty()) {
                System.err.println("Password can not empty");
                continue;
            } else if (!pattern.matcher(password).find()) {
                System.err.println("Password must include >=6 chars, including only letters or numbers");
                continue;
            } else {
                return password;
            }
        }
    }

    public boolean checkUsername(String mess, String userName) {
        while (true) {
            System.out.print(mess);
            if (userName.isEmpty()) {
                System.err.println("Username can not empty");
                return false;
            } else if (!userName.matches("^[a-zA-Z](.){4,}")) {
                System.err.println("userName has >=5 chars, unique & must start with a letter character");
                return false;
            } else {
                return true;
            }
        }
    }

    public String checkUsername(String mess) {
        while (true) {
            System.out.print(mess);
            String userName = sc.nextLine().trim();
            if (userName.isEmpty()) {
                System.err.println("Username can not empty");
                continue;
            } else if (!userName.matches("^[a-zA-Z](.){4,}")) {
                System.err.println("userName has >=5 chars, unique & must start with a letter character");
                continue;
            } else {
                return userName;
            }
        }
    }

    public String checkAddUsername(String mess, List<User> list) {
        while (true) {
            boolean check = true;
            System.out.print(mess);
            String userName = sc.nextLine().trim();
            for (User user : list) {
                if (userName.equalsIgnoreCase(user.getName())) {
                    System.err.println("Username has exist !");
                    check = false;
                    break;
                }
            }
            if (check != false) {
                if (userName.isEmpty()) {
                    System.err.println("Username can not empty");
                    continue;
                } else if (!userName.matches("^[a-zA-Z](.){4,}")) {
                    System.err.println("userName has >=5 chars, unique & must start with a letter character");
                    continue;
                } else {
                    return userName;
                }
            }
        }
    }

    public boolean checkYesNo(String mess) {
        while (true) {
            System.out.print(mess);
            String choice = sc.nextLine().trim();
            if (choice.isEmpty()) {
                System.err.println("Option can't be empty");
                continue;
            } else if (choice.equalsIgnoreCase("yes")) {
                return true;
            } else if (choice.equalsIgnoreCase("no")) {
                return false;
            } else {
                System.err.println("Please input Yes or No!");
            }
        }
    }

    public boolean CheckInt(int input, int min, int max) {
        while (true) {
            try {
                if (input >= min && input <= max) {
                    return true;
                } else {
                    System.err.println("Out of range " + "{ " + min + ", " + max + "}");
                    return false;
                }
            } catch (NumberFormatException e) {
                System.err.println("You must try again");
                return false;
            }
        }
    }

    public boolean checkString(String mess, String str) {
        while (true) {
            System.out.print(mess);
            if (str.isEmpty()) {
                System.err.println("Can not empty!");
                return false;
            } else {
                return true;
            }
        }
    }

    public boolean checkPassword(String message, String password) {
        while (true) {
            System.out.print(message);
            Pattern pattern = Pattern.compile("[a-zA-Z0-9]{6,}");
            if (password.isEmpty()) {
                System.err.println("Password can not empty");
                return false;
            } else if (!pattern.matcher(password).find()) {
                System.err.println("Password must include >=6 chars, including only letters or numbers");
                return false;
            } else {
                return true;
            }
        }
    }

    public int getIndexStudent(List<Student> listStudent, String code) {
        for (int i = 0; i < listStudent.size(); i++) {
            if (listStudent.get(i).getCode().equals(code)) {
                return i;
            }
        }
        return -1;
    }

    public boolean checkIntTest(String number) {
        try {
            int input = Integer.parseInt(number);
            return true;
        } catch (NumberFormatException e) {
        }
        return false;
    }

    public boolean checkDoubleTest(String number) {
        try {
            double input = Double.parseDouble(number);
            if (0 <= input && input <= 10) {
                return true;
            }
        } catch (NumberFormatException e) {
        }
        return false;
    }

    public boolean checkStringTest(String in) {
        if (in.isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean checkIDExits(List<Student> list, String id) {
        int a = Integer.parseInt(id);
        for (Student student : list) {
            if (student.getId() == a) {
                return true;
            }
        }
        return false;
    }

    public boolean checkExistCode(List<User> list, String code) {
        for (User user : list) {
            if (user.getCode().equals(code)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkOldPass(List<User> list, String oldPass) {
        for (User user : list) {
            if (user.getName().equals(AccountManager_F6.temp) && user.getPassword().equals(oldPass)) {
                return true;
            }
        }
        return false;
    }

    public String checkUsernameLogin(String mess, List<User> list) {
        while (true) {
            System.out.print(mess);
            String userName = sc.nextLine().trim();
            if (userName.isEmpty()) {
                System.err.println("Username can not empty");
            } else if (!userName.matches("^[a-zA-Z](.){4,}")) {
                System.err.println("UserName has >=5 chars, must start with a letter character");
            } else if (!checkExistUsername(list, userName)) {
                System.err.println("Username not exist !");
            } else {
                return userName;
            }
        }
    }
        public boolean checkExistUsername(List<User> list, String userName) {
        while (true) {

            if (userName.isEmpty()) {
                System.err.println("Username can not empty");
            } else {
                for (User user : list) {
                    if (user.getName().equalsIgnoreCase(userName)) {
                        return true;
                    }
                }
                return false;
            }
        }
    }
}
