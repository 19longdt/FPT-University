/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.mycompany.practice_sax;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

/**
 *
 * @author 19longdt
 */
public class Practice_SAX {

    
    public static void main(String[] args) {
       SAXParserFactory factory = SAXParserFactory.newInstance();
        List<Contact> contacts;
        try {
            SAXParser parser = factory.newSAXParser();
            
            File f = new File("C:\\Users\\win\\OneDrive\\Máy tính\\SUM 22\\XML\\Practice_SAX\\src\\main\\java\\contacts.xml");
            MyHandlerSax mhs = new MyHandlerSax();
            parser.parse(f, mhs);
            contacts = mhs.getContacts();
            

             List<Contact> contactSearch = new ArrayList<>();
        
             
                contactSearch = contacts.stream()
    .filter(a -> a.getCounty().contains("Los"))
    .collect(Collectors.toList());
                System.out.println(contactSearch);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
