/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import FileHandler.ReadWrite;
import entity.Student;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author hp
 */
public class MarkGroupByClassTest {

    ReadWrite rw = new ReadWrite();
    public List<Student> listS = rw.readFileStudent();
    public boolean result;

    public MarkGroupByClassTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of showInfoStudent method, of class MarkGroupByClass.
     */
    @Test
    public void testShowInfoStudent() {
        System.out.println("showInfoStudent");

        String classname1 = "";
        String classname2 = "a";
        String classname3 = "SE";

        MarkGroupByClass instance = new MarkGroupByClass();

        //instance.showInfoStudent(listS, classname1);
        int result1 = instance.showInfoStudent(listS, classname1);
        assertEquals("Test case #1: ",result1,1);
        
        //instance.showInfoStudent(listS, classname2);
        int result2 = instance.showInfoStudent(listS, classname2);
        assertEquals("Test case #2: ",result2,2);
        
        //instance.showInfoStudent(listS, classname3);
        int result = instance.showInfoStudent(listS, classname3);
        assertEquals("Test case #3: ",result,0);
        // TODO review the generated test code and remove the default call to fail.
    }

}
