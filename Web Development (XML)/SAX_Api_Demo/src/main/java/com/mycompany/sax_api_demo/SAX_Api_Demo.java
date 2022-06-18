/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.mycompany.sax_api_demo;

import java.util.List;

/**
 *
 * @author 19longdt
 */
public class SAX_Api_Demo {

    public static void main(String[] args) {
        StAXReaderDemo stAXReaderDemo = new StAXReaderDemo();
        List<User> users = stAXReaderDemo.getAllUser();
        System.out.println(users);
        
        StAXWriterDemo stAXWriterDemo = new StAXWriterDemo();
        stAXWriterDemo.writeUsers(users);
        
    }
}
