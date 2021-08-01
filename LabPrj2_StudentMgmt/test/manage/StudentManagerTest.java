/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import FileHandler.ReadWrite;
import entity.Student;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Hùng
 */
public class StudentManagerTest {

    StudentManager sm = new StudentManager();
    List<Student> listTest = new ArrayList<>();

    @Test
    public void testDisplay() {
        boolean result1 = sm.displayTest(listTest);
        assertEquals("TC 1: ", false, result1);
        listTest.add(new Student(1, "1", "h", "g", 8));
        boolean result2 = sm.displayTest(listTest);
        assertEquals("TC 2: ", true, result2);
    }

    @Test
    public void testAddStudent() {
        boolean result3 = sm.addStudentTest(listTest, "", "Hung", "Se1431", "7");
        assertEquals("TC 3: ", false, result3);
        boolean result4 = sm.addStudentTest(listTest, "HE14000", "", "Se1431", "7");
        assertEquals("TC 4: ", false, result4);
        boolean result5 = sm.addStudentTest(listTest, "HE14000", "Hung", "", "7");
        assertEquals("TC 5: ", false, result5);
        boolean result6 = sm.addStudentTest(listTest, "HE14000", "Hung", "Se1431", "f");
        assertEquals("TC 6: ", false, result6);
        boolean result7 = sm.addStudentTest(listTest, "HE14000", "Hung", "Se1431", "7");
        assertEquals("TC 7: ", true, result7);
    }

    @Test
    public void testDeleteStudent() {
        boolean result8 = sm.deleteStudentTest(listTest, "", "");
        assertEquals("TC 8: ", false, result8);
        listTest.add(new Student(1, "HE14000", "Hung", "Se1431", 7));
        boolean result9 = sm.deleteStudentTest(listTest, "j", "");
        assertEquals("TC 9: ", false, result9);
        boolean result10 = sm.deleteStudentTest(listTest, "2", "");
        assertEquals("TC 10: ", false, result10);
        boolean result11 = sm.deleteStudentTest(listTest, "1", "");
        assertEquals("TC 11: ", false, result11);
        boolean result12 = sm.deleteStudentTest(listTest, "1", "n");
        assertEquals("TC 12: ", false, result12);
        boolean result13 = sm.deleteStudentTest(listTest, "1", "y");
        assertEquals("TC 13: ", true, result13);

    }

    @Test
    public void testUpdateStudent() {
        boolean result14 = sm.updateStudentTest(listTest, "", "HE14000", "Hung", "Se1431", "6");
        assertEquals("TC 14: ", false, result14);

        listTest.add(new Student(1, "HE14000", "Hung", "Se1431", 7));
        boolean result15 = sm.updateStudentTest(listTest, "f", "HE14000", "Hung", "Se1431", "6");
        assertEquals("TC 15: ", false, result15);

        boolean result16 = sm.updateStudentTest(listTest, "5", "HE14000", "Hung", "Se1431", "6");
        assertEquals("TC 16: ", false, result16);

        boolean result17 = sm.updateStudentTest(listTest, "1", "", "Hung", "Se1431", "6");
        assertEquals("TC 17: ", false, result17);

        boolean result18 = sm.updateStudentTest(listTest, "1", "HE14000", "", "Se1431", "6");
        assertEquals("TC 18: ", false, result18);

        boolean result19 = sm.updateStudentTest(listTest, "1", "HE14000", "Hung", "", "6");
        assertEquals("TC 19: ", false, result19);

        boolean result20 = sm.updateStudentTest(listTest, "1", "HE14000", "Hung", "Se1431", "f");
        assertEquals("TC 20: ", false, result20);

        boolean result21 = sm.updateStudentTest(listTest, "1", "HE14000", "Hung", "Se1431", "6");
        assertEquals("TC 21: ", true, result21);
    }

}
