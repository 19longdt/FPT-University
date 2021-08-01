/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import FileHandler.ReadWrite;
import entity.User;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import ValidateData.Validate;

/**
 *
 * @author BlackBear
 */
public class AccountManager_F6Test {

    public AccountManager_F6Test() {
    }
    static List<User> list = new ArrayList<>();

    @BeforeClass
    public static void setUpClass() {
        User user = new User(1, "1", "binhtran", "123321", 0);
        User user1 = new User(1, "2", "binhtran11", "444444", 0);
        User user2 = new User(1, "3", "he140633", "aaaaaa", 0);
        list.add(user);
        list.add(user1);
        list.add(user2);
        for (User user3 : list) {
            System.out.println(user3);
        }
    }

    @AfterClass
    public static void tearDownClass() {
        System.out.println("After");
        for (User user3 : list) {
            System.out.println(user3);
        }
    }

    @Before
    public void setUp() {

    }

    @After
    public void tearDown() {
    }

    /**
     * Test of login method, of class AccountManager_F6.
     */
    @Test
    public void testLoginCorrect() {
        System.out.println("login");
        AccountManager_F6 ac = new AccountManager_F6();
        User u = ac.login(list, "444444", "binhtran11");
        boolean resultExpect;
        if (u == null) {
            resultExpect = false;
        } else {
            resultExpect = true;
        }
        assertEquals(true, resultExpect);
    }

    @Test
    public void testLoginPassword() {
        System.out.println("login password incorrect");
        AccountManager_F6 ac = new AccountManager_F6();
        User u = ac.login(list, "123312", "binhtran11");
        boolean resultExpect;
        if (u == null) {
            resultExpect = false;
        } else {
            resultExpect = true;
        }
        assertEquals(false, resultExpect);
    }

    @Test
    public void testLoginUsername() {
        System.out.println("login username incorrect");
        AccountManager_F6 ac = new AccountManager_F6();
        User u = ac.login(list, "444444", "binh123232");
        boolean resultExpect;
        if (u == null) {
            resultExpect = false;
        } else {
            resultExpect = true;
        }
        assertEquals(false, resultExpect);
    }

    @Test
    public void testLoginIncorrect() {
        System.out.println("both username password incorrect");
        AccountManager_F6 ac = new AccountManager_F6();
        User u = ac.login(list, "12324124", "binh123232");
        boolean resultExpect;
        if (u == null) {
            resultExpect = false;
        } else {
            resultExpect = true;
        }
        assertEquals(false, resultExpect);
    }

    /**
     * Test of logout method, of class AccountManager_F6.
     */
    /**
     * Test of changeStudentPass method, of class AccountManager_F6.
     */
    @Test
    public void testChangeStudentPass() {
        System.out.println("changeStudentPass");
        AccountManager_F6 instance = new AccountManager_F6();
        boolean resultExpect = instance.changeStudentPass(list, "123321", "aaaaaa", "binhtran", "aaaaaa");
        boolean status = true;
        for (User user : list) {
            if (user.getName().equals("binhtran") && user.getPassword().equals("aaaaaa")) {
                status = false;
            }
        }
        assertEquals(false, status);
    }

    @Test
    public void testChangeStudentPass1() {
        System.out.println("Confirm password incorrect");
        AccountManager_F6 instance = new AccountManager_F6();
        boolean resultExpect = instance.changeStudentPass(list, "123321", "111111", "binhtran", "123321");
        boolean status = true;
        for (User user : list) {
            if (user.getName().equals("binhtran") && user.getPassword().equals("111111")) {
                status = false;
            }
        }
        assertEquals(true, status);
    }

    @Test
    public void testChangeStudentPass3() {
        System.out.println("Old password incorrect");
        AccountManager_F6 instance = new AccountManager_F6();
        boolean resultExpect = instance.changeStudentPass(list, "111111", "wwwwww", "binhtran11", "wwwwww");
        boolean status = false;
        for (User user : list) {
            if (user.getName().equals("binhtran") && user.getPassword().equals("wwwwww")) {
                status = true;
            }
        }
        assertEquals(false, status);
    }

    @Test
    public void testChangeStudentPass2() {
        System.out.println("Login with old password after change");
        AccountManager_F6 instance = new AccountManager_F6();
        boolean resultExpect = instance.changeStudentPass(list, "123321", "tttttt", "binhtran", "tttttt");
        boolean status = false;
        for (User user : list) {
            if (user.getName().equals("binhtran") && user.getPassword().equals("123321")) {
                status = true;
            }
        }
        assertEquals(false, status);
    }

    /**
     * Test of changUserPass method, of class AccountManager_F6.
     */
    @Test
    public void testUsernameExist() {
        Validate val = new Validate();
        String username = "binhtran11";
        assertTrue(val.checkExistUsername(list, username));
    }

    @Test
    public void testUsernameNotExist() {
        Validate val = new Validate();
        String username = "binhtran21";
        assertTrue(!val.checkExistUsername(list, username));
    }

    @Test
    public void testChangUserPass() {
        System.out.println("changUserPass");
        AccountManager_F6 instance = new AccountManager_F6();
        boolean resultExpect = instance.changUserPass(list, "1", "aaaaaa");
        boolean status = resultExpect;
        for (User user : list) {
            if (user.getCode().equals("1") && user.getPassword().equals("aaaaaa")) {
                status = false;
            }
        }
        assertEquals(false, status);
    }

    @Test
    public void testChangUserPass1() {
        System.out.println("changUserPass Login with old password ");
        AccountManager_F6 instance = new AccountManager_F6();
        boolean resultExpect = instance.changUserPass(list, "1", "aaaaaa");
        boolean status = resultExpect;
        for (User user : list) {
            if (user.getCode().equals("1") && user.getPassword().equals("123321")) {
                status = false;
            }
        }
        assertEquals(true, status);
    }

    public void testChangUser2() {
        System.out.println("changUserPass Login with incorrect CODE ");
        AccountManager_F6 instance = new AccountManager_F6();
        boolean resultExpect = instance.changUserPass(list, "123", "aaaaaa");
        boolean status = resultExpect;
        for (User user : list) {
            if (user.getCode().equals("1") && user.getPassword().equals("aaaaaa")) {
                status = true;
            }
        }
        assertEquals(false, status);
    }
    /**
     * Test of display method, of class AccountManager_F6.
     */
}
