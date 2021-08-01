/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import entity.Student;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author win
 */
public class MarkManagerTest {

    MarkManager mm;
    List<Student> listTest = new ArrayList<>();

    public MarkManagerTest() {
        mm = new MarkManager();
    }

    @Test
    public void testAddMark() {
        boolean result1 = mm.addMarkTest(listTest, "", "");
        assertEquals("TC 1: ", false, result1);
        listTest.add(new Student(1, "He140768", "Toan", "SE1431", 7));
        boolean result2 = mm.addMarkTest(listTest, "h", "7");
        assertEquals("TC 2: ", false, result2);
        boolean result3 = mm.addMarkTest(listTest, "2", "8");
        assertEquals("TC 3: ", false, result3);
        boolean result4 = mm.addMarkTest(listTest, "1", "ad");
        assertEquals("TC 4: ", false, result4);
        boolean result5 = mm.addMarkTest(listTest, "1", "7");
        assertEquals("TC 5: ", true, result5);

    }

    /**
     * Test of updateMark method, of class MarkManager.
     */
    @Test
    public void testUpdateMark() {
        boolean result6 = mm.updateMarkTest(listTest, "", "");
        assertEquals("TC 6: ", false, result6);
        listTest.add(new Student(1, "He140768", "Toan", "SE1431", 7));
        boolean result7 = mm.updateMarkTest(listTest, "h", "h");
        assertEquals("TC 7: ", false, result7);
        boolean result8 = mm.updateMarkTest(listTest, "2", "8");
        assertEquals("TC 8: ", false, result8);
        boolean result9 = mm.updateMarkTest(listTest, "1", "ad");
        assertEquals("TC 9: ", false, result9);
        boolean result10 = mm.updateMarkTest(listTest, "1", "7");
        assertEquals("TC 10: ", true, result10);
    }

    /**
     * Test of deleteMark method, of class MarkManager.
     */
    @Test
    public void testDeleteMark() {
        boolean result6 = mm.deleteMarkTest(listTest, "", "");
        assertEquals("TC 11: ", false, result6);
        listTest.add(new Student(1, "He140768", "Toan", "SE1431", 7));
        boolean result7 = mm.deleteMarkTest(listTest, "h", "h");
        assertEquals("TC 12: ", false, result7);
        boolean result8 = mm.deleteMarkTest(listTest, "2", "8");
        assertEquals("TC 13: ", false, result8);
        boolean result9 = mm.deleteMarkTest(listTest, "1", "ad");
        assertEquals("TC 14: ", false, result9);
        boolean result15 = mm.deleteMarkTest(listTest, "1", "7");
        assertEquals("TC 15: ", true, result15);
    }

    @Test
    public void testDisplay() {
        boolean result3 = mm.displayTest(listTest);
        assertEquals("TC 3: ", false, result3);
        listTest.add(new Student(5, "1", "h", "g", 8));
        boolean result4 = mm.displayTest(listTest);
        assertEquals("TC 4: ", true, result4);
    }

}
