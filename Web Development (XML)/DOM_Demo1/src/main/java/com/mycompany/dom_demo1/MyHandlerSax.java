/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dom_demo1;

import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author 19longdt
 */
public class MyHandlerSax extends DefaultHandler{
    
    List<Book> books ;
    String currentText;
    Book tmpBook;
    
    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        super.characters(ch, start, length); 
        
        currentText = String.copyValueOf(ch, start, length);
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        super.endElement(uri, localName, qName); 
        
        qName = qName.toLowerCase();
        switch(qName){
            case "name": 
                tmpBook.setName(currentText);
                break;
            case "author": 
                tmpBook.setAuthor(currentText);
                break; 
                case "price": 
                tmpBook.setPrice(Float.parseFloat(currentText));
                break;
            case "book": 
                books.add(tmpBook);
                break; 
        }
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        super.startElement(uri, localName, qName, attributes);
        
        if(qName.equalsIgnoreCase("book")){
            tmpBook = new Book();
            tmpBook.setId(attributes.getValue("id"));
            tmpBook.setCategory(attributes.getValue("category"));
        }
    }

    @Override
    public void endDocument() throws SAXException {
        super.endDocument();
    }

    @Override
    public void startDocument() throws SAXException {
        super.startDocument();
        books = new ArrayList<>();
    }

    public List<Book> getBooks() {
        return books;
    }
    
}
