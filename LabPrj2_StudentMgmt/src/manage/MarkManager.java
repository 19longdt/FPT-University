/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import FileHandler.ReadWrite;
import ValidateData.Validate;
import entity.Student;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class MarkManager {

    Validate check = new Validate();
    Scanner sc = new Scanner(System.in);

    public boolean addMarkTest(List<Student> listTest, String id, String mark) {
        int size = listTest.size();
        if (size == 0) {
            System.out.println("addMarkTest 1: number student = 0");
            return false;
        }
        if (!check.checkIntTest(id)) {
            System.out.println("addMarkTest 2: wrong format id");
            return false;
        }
        if (!check.checkIDExits(listTest, id)) {
            System.out.println("addMarkTest 3: id not exits");
            return false;
        }
        int idT = Integer.parseInt(id);
        for (Student student : listTest) {
            if (student.getId() == (idT)) {
                if (!check.checkDoubleTest(mark)) {
                    System.out.println("addMarTest 4: wrong format ");
                    return false;
                }
                student.setMark(Double.parseDouble(mark));
            }
        }
        System.out.println("addMarkTest 5 Successfully");
        return true;
    }

    public boolean updateMarkTest(List<Student> listTest, String id, String mark) {
        int size = listTest.size();
        if (size == 0) {
            System.out.println("updateMarkTest 1: ID does not exist");
            return false;
        }
        if (!check.checkIntTest(id)) {
            System.out.println("updateMarkTest 2: wrong format id");
            return false;
        }
        if (!check.checkIDExits(listTest, id)) {
            System.out.println("updateMarkTest 3: id not exits");
            return false;
        }
        int idT = Integer.parseInt(id);
        for (Student student : listTest) {
            if (student.getId() == (idT)) {
                if (!check.checkDoubleTest(mark)) {
                    System.out.println("updateMarTest 4: wrong format ");
                    return false;
                }
                student.setMark(Double.parseDouble(mark));
            }
        }
        System.out.println("updateMarkTest 5 Successfully");
        return true;
    }

    public boolean deleteMarkTest(List<Student> listTest, String id, String mark) {
        int size = listTest.size();
        if (size == 0) {
            System.out.println("deleteMarkTest 1: ID does not exist");
            return false;
        }
        if (!check.checkIntTest(id)) {
            System.out.println("deleteMarkTest 2: Try again");
            return false;
        }
        if (!check.checkIDExits(listTest, id)) {
            System.out.println("deleteMarkTest 3: id not exits");
            return false;
        }
        int idT = Integer.parseInt(id);
        for (Student student : listTest) {
            if (student.getId() == (idT)) {
                if (!check.checkDoubleTest(mark)) {
                    System.out.println("deleteMarTest 4: wrong format ");
                    return false;
                }
                student.setMark(Double.parseDouble(mark));
            }
        }
        System.out.println("deteleMarkTest 5 Successfully");
        return true;
    }

    public void menu() {
        List<Student> lstS = ReadWrite.readFileStudent();
        while (true) {
            System.out.println("1. Add Mark\n"
                    + "2. Update Mark\n"
                    + "3. Delete Student\n"
                    + "4. Save and Return\n"
                    + "5. Exit");
            int option = check.CheckInt("Enter your choice: ", 1, 5);
            switch (option) {
                case 1:
                    addMark(lstS);
                    break;
                case 2:
                    updateMark(lstS);
                    break;
                case 3:
                    deleteMark(lstS);
                    break;
                case 4:
                    return;
                default:
                    System.exit(0);
            }
        }
    }

    public void addMark(List<Student> list) {
        for (Student student : list) {
            System.out.println(student);
        }
        System.out.println("Add Mark");
        String code = check.checkString("Enter code: ");
        for (Student student : list) {
            if (student.getCode().equals(code)) {
                double mark = check.CheckDouble("Enter mark:", 0, 10);
                student.setMark(mark);
                return;
            }
        }
        System.out.println("Student not exist!");
    }

    public void updateMark(List<Student> list) {

        System.out.println("Update Mark");
        while (true) {
            int ID = check.CheckInt("Enter ID:", 1, Integer.MAX_VALUE);
            for (Student student : list) {
                if (student.getId() == ID) {
                    student.setMark(check.CheckDouble("Enter new mark: ", 0, 10));
                    System.out.println("Update mark successfully");
                    return;
                }
            }
            System.out.println("ID does not exist");
        }
    }

    public void deleteMark(List<Student> list) {
        System.out.println("Delete Mark");
        while (true) {
            int ID = check.CheckInt("Enter ID:", 1, Integer.MAX_VALUE);
            for (int i = 0; i < list.size(); i++) {
                Student e = list.get(i);
                if (e.getId() == ID) {
                    e.setMark(0);
                    System.out.println("Mark has been setted to 0");
                    return;
                }
            }
            System.out.println("ID does not exist");
        }

    }

    public boolean displayTest(List<Student> listTest1) {
        int size = listTest1.size();
        if (size == 0) {
            System.out.println("DisplayTest 2: Number student : 0 student ");
            return false;

        }
        System.out.println("DisplayTest 1: Number student : " + size + " students ");
        return true;
    }
}
