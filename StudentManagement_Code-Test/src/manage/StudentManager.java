/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;
import entity.Student;
import FileHandler.ReadWrite;
import ValidateData.Validate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author USE
 */
public class StudentManager {

    Validate check = new Validate();
    Scanner sc = new Scanner(System.in);

    public void manager(List<Student> list) {
        while (true) {
            switch (View.InterfaceView.menuManageStudent()) {
                case 1:
                    display(list);
                    break;
                case 2:
                    addStudent(list);
                    break;
                case 3:
                    updateStudent(list);
                    break;
                case 4:
                    deleteStudent(list);
                    break;
                case 5:
                    saveStudent(list);
                    return;
                case 6:
                    System.exit(0);
            }
        }
    }

    public void display(List<Student> list) {
        int size = list.size();
        if (size > 0) {
            for (Student e : list) {
                System.out.println(e);
            }
        } else {
            System.out.println("Number student : 0 student ");
        }
    }

    public void addStudent(List<Student> list) {
        int id;
        if (list.isEmpty()) {
            id = 1;
        } else {
            id = list.get(list.size() - 1).getId() + 1;
        }
        System.out.println("Add Student!!");
        String code = check.checkString("Enter code: ");
        String name = check.checkString("Enter Name: ");
        String className = check.checkString("Enter className: ");
        double mark = check.CheckDouble("Enter mark", 0, 10);
        list.add(new Student(id, code, name, className, mark));
        System.out.println("Add new student successfully");
    }

    public void deleteStudent(List<Student> list) {
        int size = list.size();
        if (size > 0) {
            System.out.println("Remove Student!!");
            int id = check.CheckInt("Enter ID:", 1, size);
            System.out.println(list.get(id - 1));
            String comf = check.checkString("Press y to delete - another character to return");
            if (comf.equalsIgnoreCase("y")) {
                for (Student e : list) {
                    if (e.getId() == id) {
                        list.remove(id - 1);
                        System.out.println("Remove successfully");
                        return;
                    }
                }
            }
        } else {
            System.out.println("0 student - Can't remove student!");
        }
    }

    public void updateStudent(List<Student> list) {

        int size = list.size();
        if (size > 0) {
            System.out.println("Update Student");
            int id = check.CheckInt("Enter ID:", 1, size);
            for (Student e : list) {
                if (e.getId() == id) {
                    String code = check.checkString("Enter new code: ");
                    String name = check.checkString("Enter new Name: ");
                    String className = check.checkString("Enter new ClassName: ");
                    double mark = check.CheckDouble("Enter new mark: ", 0, 10);

                    e.setCode(code);
                    e.setMark(mark);
                    e.setClassName(className);
                    e.setName(name);
                    System.out.println("Update student successfully");
                    return;
                }
            }
        } else {
            System.out.println("0 student - Can't update student!");
        }
    }

    public void saveStudent(List<Student> list) {
        ReadWrite.writeFileStudent(list);
    }

    /*-----------------------------------------------------------------*/
    public boolean displayTest(List<Student> listTest) {
        int size = listTest.size();
        if (size == 0) {
            System.out.println("DisplayTest 1: Number student : 0 student ");
            return false;
        }
        System.out.println("DisplayTest 2: Number student : " + size + " students");
        return true;
    }

    public boolean addStudentTest(List<Student> listTest, String code, String name, String className, String mark) {
        int id;
        if (listTest.isEmpty()) {
            id = 1;
        } else {
            id = listTest.get(listTest.size() - 1).getId() + 1;
        }
        if (!check.checkStringTest(code)) {
            System.out.println("AddStudentTest 1 : Invalid format type code - Please re-enter :");
            return false;
        }
        if (!check.checkStringTest(name)) {
            System.out.println("AddStudentTest 2 : Invalid format type name - Please re-enter :");
            return false;
        }
        if (!check.checkStringTest(className)) {
            System.out.println("AddStudentTest 3 : Invalid format type className - Please re-enter :");
            return false;
        }
        if (!check.checkDoubleTest(mark)) {
            System.out.println("AddStudentTest 4 : Invalid format type Mark - Please re-enter :");
            return false;
        }
        listTest.add(new Student(id, code, name, className, Double.parseDouble(mark)));
        System.out.println("AddStudentTest 5 : Add new student successfully");
        return true;
    }

    public boolean deleteStudentTest(List<Student> listTest, String id, String accept) {
        int size = listTest.size();
        int idT;
        if (size == 0) {
            System.out.println("DeleteStudentTest 1 : 0 student - Can't remove student!");
            return false;
        }
        if (size > 0) {
            if (!check.checkIntTest(id)) {
                System.out.println("DeleteStudentTest 2 : Enter correct ID! ");
                return false;
            }
            if (!check.checkIDExits(listTest, id)) {
                System.out.println("DeleteStudentTest 3 : Student does not exist - Try again!");
                return false;
            }
            if (check.checkIntTest(id) && "".equals(accept)) {
                idT = Integer.parseInt(id);
                System.out.println("DeleteStudentTest 4 : " + listTest.get(idT - 1));
                System.out.println("DeleteStudentTest 4 : Press y to delete - n to return");
                return false;
            }
            idT = Integer.parseInt(id);
            if (accept.equalsIgnoreCase("y")) {
                for (Student e : listTest) {
                    if (e.getId() == idT) {
                        listTest.remove(idT - 1);
                        System.out.println("DeleteStudentTest 6 : Remove successfully");
                        return true;
                    }
                }
            }
            if (accept.equalsIgnoreCase("n")) {
                System.out.println("DeleteStudentTest 5 : Do not delete!");
                return false;
            }
        }
        return true;
    }

    public boolean updateStudentTest(List<Student> listTest, String id, String code, String name, String className, String mark) {

        int size = listTest.size();
        int idT;
        if (size == 0) {
            System.out.println("UpdateStudentTest 1 : 0 student - Can't uppdate student!");
            return false;
        }
        if (size > 0) {
            if (!check.checkIntTest(id)) {
                System.out.println("UpdateStudentTest 2 : Enter correct ID! ");
                return false;
            }
            if (!check.checkIDExits(listTest, id)) {
                System.out.println("UpdateStudentTest 3 : Student does not exist - Try again!");
                return false;
            }
            idT = Integer.parseInt(id);
            for (Student e : listTest) {
                if (e.getId() == idT) {
                    if (!check.checkStringTest(code)) {
                        System.out.println("UpdateStudentTest 4 : Invalid format type code - Please re-enter :");
                        return false;
                    }
                    if (!check.checkStringTest(name)) {
                        System.out.println("UpdateStudentTest 5 : Invalid format type name - Please re-enter :");
                        return false;
                    }
                    if (!check.checkStringTest(className)) {
                        System.out.println("UpdateStudentTest 6 : Invalid format type className - Please re-enter :");
                        return false;
                    }
                    if (!check.checkDoubleTest(mark)) {
                        System.out.println("UpdateStudentTest 7 : Invalid format type Mark - Please re-enter :");
                        return false;
                    }
                    e.setCode(code);
                    e.setMark(Double.parseDouble(mark));
                    e.setClassName(className);
                    e.setName(name);
                    System.out.println("UpdateStudentTest 8: Update student successfully");
                    return true;
                }
            }
        }
        return true;
    }
}
