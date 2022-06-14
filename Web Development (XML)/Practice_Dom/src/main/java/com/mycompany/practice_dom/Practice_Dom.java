/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */
package com.mycompany.practice_dom;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author 19longdt
 */
public class Practice_Dom {

    public static void main(String[] args) {
        System.out.println("Hello World!");

        System.out.println(getAllPlanests());
    }

    public static List<Planest> getAllPlanests() {
        List<Planest> planests = new ArrayList<>();

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(new File("C:\\Users\\win\\OneDrive\\Máy tính\\SUM 22\\XML\\Practice_Dom\\src\\main\\java\\planest.xml"));
            System.err.println("root name: " + document.getDocumentElement().getTagName());

            NodeList nodes = document.getElementsByTagName("PLANET");
            for (int i = 0; i < nodes.getLength(); i++) {
                Node node = nodes.item(i);
                Element e = (Element) node;
                Planest p = new Planest();
                Common_Unit c = new Common_Unit();

                p.setColor(e.getAttribute("COLOR"));
                p.setName(e.getElementsByTagName("NAME").item(0).getTextContent());

                Node n1 = e.getElementsByTagName("MASS").item(0);
                Element e1 = (Element) n1;

                c.setUnit(e1.getAttribute("UNITS"));
                c.setValue(Float.parseFloat(e.getElementsByTagName("MASS").item(0).getTextContent()));
                
                p.setMass(c);
                planests.add(p);
            }

        } catch (ParserConfigurationException ex) {
            Logger.getLogger(Practice_Dom.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(Practice_Dom.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Practice_Dom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return planests;
    }
}
