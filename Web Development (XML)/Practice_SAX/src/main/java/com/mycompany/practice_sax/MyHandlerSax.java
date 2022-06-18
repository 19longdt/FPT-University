/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practice_sax;

import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author 19longdt
 */
public class MyHandlerSax extends DefaultHandler {

    List<Contact> contacts;
    List<String> searchBy;
    String currentText;
    Contact tmpContact;

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        super.characters(ch, start, length);

        currentText = String.copyValueOf(ch, start, length);
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        super.endElement(uri, localName, qName);

        qName = qName.toLowerCase();
        switch (qName) {
            case "first_name":
                tmpContact.setFirst_name(currentText);
                break;
            case "last_name":
                tmpContact.setLast_name(currentText);
                break;
            case "company_name":
                tmpContact.setCompany_name(currentText);
                break;
            case "city":
                tmpContact.setCity(currentText);
                break;
            case "county":
                tmpContact.setCounty(currentText);
                break;
            case "state":
                tmpContact.setState(currentText);
                break;
            case "phone1":
                tmpContact.setPhone1(currentText);
                break;
            case "phone":
                tmpContact.setPhone(currentText);
                break;
            case "email":
                tmpContact.setEmail(currentText);
                break;
            case "contact":
                contacts.add(tmpContact);
                break;
        }
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        super.startElement(uri, localName, qName, attributes);

        if (qName.equalsIgnoreCase("contact")) {
            tmpContact = new Contact();
            tmpContact.setId(attributes.getValue("id"));
        }
    }

    @Override
    public void endDocument() throws SAXException {
        super.endDocument();
    }

    @Override
    public void startDocument() throws SAXException {
        super.startDocument();
        contacts = new ArrayList<>();
    }

    public List<Contact> getContacts() {
        return contacts;
    }
    
}
