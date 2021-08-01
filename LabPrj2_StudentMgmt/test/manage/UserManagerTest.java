/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import FileHandler.ReadWrite;
import ValidateData.Validate;
import entity.Student;
import entity.User;
import java.io.FileNotFoundException;
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
public class UserManagerTest {

    public Validate check = new Validate();
    public ReadWrite rw = new ReadWrite();
    public static boolean result;
    public List<User> listUser = rw.readFileUser();

    public UserManagerTest() {
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
     * Test of display method, of class UserManager.
     */
    @Test
    public void testDisplay() throws Exception {
        UserManager instance = new UserManager();
        
        // TC1 list empty
        result = instance.display(listUser);
        assertEquals("Test case #1: ", result, true);
    }

    /**
     * Test of addUser method, of class UserManager.
     */
    @Test
    public void testAddUser() throws Exception {
        UserManager instance = new UserManager();
        // TC1 code empty
        result = instance.addUser("", "abcabc", "111111");
        assertEquals("Test case #2: ", result, false);

        // TC2 code invalid
        result = instance.addUser("HE1256", "abcaa", "111111");
        assertEquals("Test case #3: ", result, false);

        // TC3 user invalid
        result = instance.addUser("HE125", "abc", "111111");
        assertEquals("Test case #4: ", result, false);

        // TC4 user duplicate
        result = instance.addUser("HE125", "longdt", "111111");
        assertEquals("Test case #5: ", result, false);

        // TC5 password invalid
        result = instance.addUser("HE125", "abcde", "111");
        assertEquals("Test case #6: ", result, false);

    }

    /**
     * Test of removeUser method, of class UserManager.
     */
    @Test
    public void testRemoveUser() {
        UserManager instance = new UserManager();
        // TC1 check id
        result = instance.removeUser(-1, "y");
        assertEquals("Test case #7: ", result, false);

        // TC1 check id
        result = instance.removeUser(100, "y");
        assertEquals("Test case #8: ", result, false);

        // TC3 check option
        result = instance.removeUser(1, "");
        assertEquals("Test case #9: ", result, false);

        // TC4 check option
        result = instance.removeUser(1, "n");
        assertEquals("Test case #10: ", result, true);
    }

    /**
     * Test of updateUser method, of class UserManager.
     */
    @Test
    public void testUpdateUser() throws FileNotFoundException {
        UserManager instance = new UserManager();
        // TC1 check id
        result = instance.updateUser(-1, "HE");
        assertEquals("Test case #11: ", result, false);

        // TC2 check id
        result = instance.updateUser(100, "HE125");
        assertEquals("Test case #12: ", result, false);

        // TC3 check code 
        result = instance.updateUser(1, "HE124");
        assertEquals("Test case #13: ", result, false);
        
        // TC4 TRUE
        result = instance.updateUser(1, "HE");
        assertEquals("Test case #14: ", result, true);
        
        
    }

    /**
     * Test of changePassword method, of class UserManager.
     */
    @Test
    public void testChangePassword() {
        UserManager instance = new UserManager();
        // TC1 check id
        result = instance.changePassword(-1, "111111", "111111");
        assertEquals("Test case #15: ", result, false);

        // TC2 check id
        result = instance.changePassword(100, "111111", "111111");
        assertEquals("Test case #16: ", result, false);

        // TC3 check newpassword
        result = instance.changePassword(1, "1111", "111111");
        assertEquals("Test case #17: ", result, false);

        // TC4 check Renew password
        result = instance.changePassword(1, "111111", "1111");
        assertEquals("Test case #18: ", result, false);

        // TC5 check newpassword vs Renew password
        result = instance.changePassword(1, "111111", "111222");
        assertEquals("Test case #19: ", result, false);

        // TC6 TRUE
        result = instance.changePassword(1, "111111", "111111");
        assertEquals("Test case #20: ", result, true);
    }

}
