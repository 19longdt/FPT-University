/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practice_stax;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;

/**
 *
 * @author 19longdt
 */
public class StAXReader {

    public List<Personal> getAllPersonals() {
        List<Personal> personals = new ArrayList<>();
        Personal tmpPersonal = null;
        String currentText = "";

        XMLInputFactory factory = XMLInputFactory.newInstance();

        try {
            FileReader file = new FileReader("src\\main\\java\\personal.xml");
            XMLStreamReader reader = factory.createXMLStreamReader(file);
            while (reader.hasNext()) {
                int category = reader.next();

                switch (category) {
                    case XMLStreamConstants.START_ELEMENT:
                        String tag = reader.getLocalName();
                        if ("person".equalsIgnoreCase(tag)) {
                            tmpPersonal = new Personal();
                            tmpPersonal.setId(reader.getAttributeValue(0));
                            tmpPersonal.setPhoto(reader.getAttributeValue(1));
                        }
                        if ("link".equalsIgnoreCase(tag)) {
                            
                            if(reader.getAttributeName(0).toString().equalsIgnoreCase("subordinates")){
                                tmpPersonal.setLink(reader.getAttributeValue(0));
                                tmpPersonal.setLink1("subordinates");
                            }else{
                                tmpPersonal.setLink(reader.getAttributeValue(0));
                                tmpPersonal.setLink1("manager");
                            }
                            
                        }
                        if ("url".equalsIgnoreCase(tag)) {
                            tmpPersonal.setUrl(reader.getAttributeValue(0));
                        }
                        break;
                    case XMLStreamConstants.CHARACTERS:
                        currentText = reader.getText().trim();
                        break;
                    case XMLStreamConstants.END_ELEMENT:
                        String tag_end = reader.getLocalName().toLowerCase();
                        switch (tag_end) {
                            case "given":
                                if (tmpPersonal != null) {
                                    tmpPersonal.setGivenName(currentText);
                                }
                                break;
                            case "family":
                                if (tmpPersonal != null) {
                                    tmpPersonal.setFamilyName(currentText);
                                }
                                break;
                            case "email":
                                if (tmpPersonal != null) {
                                    tmpPersonal.setEmail(currentText);
                                }
                                break;
                            case "person":
                                personals.add(tmpPersonal);
                                break;
                        }
                        break;
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return personals;
    }
}
