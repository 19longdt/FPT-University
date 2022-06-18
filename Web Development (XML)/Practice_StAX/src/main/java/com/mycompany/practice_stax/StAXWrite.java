/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practice_stax;

import java.io.FileOutputStream;
import java.io.StringWriter;
import java.util.List;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamWriter;

/**
 *
 * @author 19longdt
 */
public class StAXWrite {

    public void writeFile(List<Personal> personals) {
        try {
            StringWriter stringWriter = new StringWriter();

            XMLOutputFactory Factory = XMLOutputFactory.newInstance();
            //Factory.setProperty(name, value);
            XMLStreamWriter xMLStreamWriter = Factory.createXMLStreamWriter(new FileOutputStream("src\\main\\java\\tmpPersonal.xml"));
            xMLStreamWriter.writeStartDocument();
            xMLStreamWriter.writeCharacters("\n");
            xMLStreamWriter.writeStartElement("personnel");
            for (Personal p : personals) {
                xMLStreamWriter.writeCharacters("\n\t");
                xMLStreamWriter.writeStartElement("person");
                xMLStreamWriter.writeAttribute("id", p.getId());
                xMLStreamWriter.writeAttribute("photo", p.getPhoto());

                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeStartElement("name");
                xMLStreamWriter.writeCharacters("\n\t\t\t");
                xMLStreamWriter.writeStartElement("given");
                xMLStreamWriter.writeCharacters(p.getGivenName());
                xMLStreamWriter.writeEndElement();
                xMLStreamWriter.writeCharacters("\n\t\t\t");
                xMLStreamWriter.writeStartElement("family");
                xMLStreamWriter.writeCharacters(p.getFamilyName());
                xMLStreamWriter.writeEndElement();
                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeEndElement();

                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeStartElement("email");
                xMLStreamWriter.writeCharacters(p.getEmail());
                xMLStreamWriter.writeEndElement();

                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeStartElement("link");
                if(p.getLink1().equalsIgnoreCase("manager")){
                    xMLStreamWriter.writeAttribute("manager", p.getLink());
                }else{
                    xMLStreamWriter.writeAttribute("subordinates", p.getLink());
                }
                xMLStreamWriter.writeEndElement();

                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeStartElement("url");
                xMLStreamWriter.writeAttribute("href", p.getUrl());
                xMLStreamWriter.writeEndElement();

                xMLStreamWriter.writeCharacters("\n\t");
                xMLStreamWriter.writeEndElement();
            }

            xMLStreamWriter.writeCharacters("\n");
            xMLStreamWriter.writeEndElement();
            xMLStreamWriter.writeEndDocument();

            xMLStreamWriter.flush();
            xMLStreamWriter.close();

        } catch (Exception e) {
            // TODO: handle exception
        }
    }
}
