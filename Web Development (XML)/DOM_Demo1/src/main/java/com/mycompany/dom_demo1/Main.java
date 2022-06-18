/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dom_demo1;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.SAXException;

/**
 *
 * @author 19longdt
 */
public class Main {
    public static void main(String[] args) {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        
        try {
            SAXParser parser = factory.newSAXParser();
            
            File f = new File("src\\main\\java\\book.xml");
            MyHandlerSax mhs = new MyHandlerSax();
            parser.parse(f, mhs);
            
            for(Book b : mhs.getBooks()){
                System.out.println(b.toString());
            }
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
