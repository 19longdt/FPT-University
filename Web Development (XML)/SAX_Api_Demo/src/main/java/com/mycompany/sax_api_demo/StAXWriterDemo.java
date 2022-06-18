/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sax_api_demo;

import java.io.FileOutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;

/**
 *
 * @author 19longdt
 */
public class StAXWriterDemo {

    public void writeUsers(List<User> users) {
        System.out.println(users.size());
        XMLOutputFactory factory = XMLOutputFactory.newInstance();
        try {
            XMLStreamWriter writer = factory.createXMLStreamWriter(new FileOutputStream("src\\main\\java\\tmp_user.xml"));

            writer.writeStartDocument("UTF-8", "1.0");
            writer.writeCharacters("\n");
            writer.writeStartElement("users");
            writer.writeCharacters("\n\t");
            for (int i = 0; i < users.size(); i++) {
                writer.writeStartElement("user");

                writer.writeAttribute("uid", users.get(i).getUid());

                writeElement(writer, "\n\t\t", "username", users.get(i).getUsername());
                writeElement(writer, "\n\t\t", "password", users.get(i).getPassword());
                writeElement(writer, "\n\t\t", "role", users.get(i).getRole());
                writeElement(writer, "\n\t\t", "email", users.get(i).getMail());

                writer.writeCharacters("\n\t");
                writer.writeEndElement();
            }
            writer.writeCharacters("\n");
            writer.writeEndDocument();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void writeElement(XMLStreamWriter writer, String character, String tag, String content) {
        try {
            writer.writeCharacters(character);
            writer.writeStartDocument(tag);
            writer.writeCharacters(content);
            writer.writeEndElement();
        } catch (XMLStreamException ex) {
            Logger.getLogger(StAXWriterDemo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
