/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sax_api_demo;

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
public class StAXReaderDemo {

    public List<User> getAllUser() {
        List<User> users = new ArrayList<>();
        User tmpUser = null;
        String currentText = "";

        XMLInputFactory factory = XMLInputFactory.newInstance();

        try {
            FileReader file = new FileReader("src\\main\\java\\user.xml");
            XMLStreamReader reader = factory.createXMLStreamReader(file);
            while (reader.hasNext()) {
                int category = reader.next();

                switch (category) {
                    case XMLStreamConstants.START_ELEMENT:
                        String tag = reader.getLocalName();
                        if ("user".equalsIgnoreCase(tag)) {
                            tmpUser = new User();
                            tmpUser.setUid(reader.getAttributeValue(0));
                        }
                        break;
                    case XMLStreamConstants.CHARACTERS:
                        currentText = reader.getText().trim();
                        break;
                    case XMLStreamConstants.END_ELEMENT:
                        String tag_end = reader.getLocalName().toLowerCase();
                        switch (tag_end) {
                            case "username":
                                if (tmpUser != null) {
                                    tmpUser.setUsername(currentText);
                                }
                                break;
                            case "password":
                                if (tmpUser != null) {
                                    tmpUser.setPassword(currentText);
                                }
                                break;
                            case "role":
                                if (tmpUser != null) {
                                    tmpUser.setRole(currentText);
                                }
                                break;
                            case "email":
                                if (tmpUser != null) {
                                    tmpUser.setMail(currentText);
                                }
                                break;
                            case "user":
                                users.add(tmpUser);
                                break;
                        }
                        break;
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return users;
    }

}
