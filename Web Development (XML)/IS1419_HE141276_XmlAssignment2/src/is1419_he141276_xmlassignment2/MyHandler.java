/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package is1419_he141276_xmlassignment2;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.XMLStreamWriter;

/**
 *
 * @author 19longdt
 */
public class MyHandler {

    public List<Cars> getAllCars(String pathFile) {
        List<Cars> cars = new ArrayList<>();
        Cars tmpCars = null;
        Car tmpCar = null;
        String currentText = "";

        XMLInputFactory factory = XMLInputFactory.newInstance();

        try {
            FileReader file = new FileReader(pathFile);
            XMLStreamReader reader = factory.createXMLStreamReader(file);
            while (reader.hasNext()) {
                int category = reader.next();

                switch (category) {
                    case XMLStreamConstants.START_ELEMENT:
                        String tag = reader.getLocalName();
                        if ("Car".equalsIgnoreCase(tag)) {
                            tmpCars = new Cars();
                            tmpCars.setCarId(Integer.parseInt(reader.getAttributeValue(0)));
                        }
                        if ("CarInfo".equalsIgnoreCase(tag)) {
                            tmpCar = new Car();
                            tmpCar.setName(reader.getAttributeValue(0));
                            tmpCar.setMake(reader.getAttributeValue(1));
                            tmpCars.setCarInfo(tmpCar);
                        }
                        break;
                    case XMLStreamConstants.CHARACTERS:
                        currentText = reader.getText().trim();
                        break;
                    case XMLStreamConstants.END_ELEMENT:
                        String tag_end = reader.getLocalName().toLowerCase();
//                        System.out.println(tag_end);
                        switch (tag_end) {
                            case "model":
                                if (tmpCar != null) {
                                    tmpCar.setModel(currentText);
                                }
                                break;
                            case "price":
                                tmpCars.setPrice(Double.parseDouble(currentText));
                                break;
                            case "type":
                                if (tmpCars != null) {
                                    tmpCars.setType(currentText);
                                }
                                break;
                            case "car":
                                cars.add(tmpCars);
                                break;
                        }
                        break;
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return cars;
    }

    public void writeFile(String pathFile, List<Cars> listCars) {
        try {
            XMLOutputFactory Factory = XMLOutputFactory.newInstance();
            //Factory.setProperty(name, value);
            XMLStreamWriter xMLStreamWriter = Factory.createXMLStreamWriter(new FileOutputStream(pathFile));
            xMLStreamWriter.writeStartDocument();
            xMLStreamWriter.writeCharacters("\n");
            xMLStreamWriter.writeStartElement("Cars");
            for (Cars c : listCars) {
                xMLStreamWriter.writeCharacters("\n\t");
                xMLStreamWriter.writeStartElement("Car");
                xMLStreamWriter.writeAttribute("CarID", String.valueOf(c.getCarId()));

                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeStartElement("CarInfo");
                xMLStreamWriter.writeAttribute("Name", c.getCarInfo().getName());
                xMLStreamWriter.writeAttribute("Make", c.getCarInfo().getMake());
                xMLStreamWriter.writeCharacters("\n\t\t\t");
                xMLStreamWriter.writeStartElement("Model");
                xMLStreamWriter.writeCharacters(c.getCarInfo().getModel());
                xMLStreamWriter.writeEndElement();
                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeEndElement();
                
                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeStartElement("Price");
                xMLStreamWriter.writeCharacters(String.valueOf(c.getPrice()));
                xMLStreamWriter.writeEndElement();
                
                xMLStreamWriter.writeCharacters("\n\t\t");
                xMLStreamWriter.writeStartElement("Type");
                xMLStreamWriter.writeCharacters(c.getType());
                xMLStreamWriter.writeEndElement();
                xMLStreamWriter.writeCharacters("\n\t");
                
                xMLStreamWriter.writeEndElement();
            }

            xMLStreamWriter.writeCharacters("\n");
            xMLStreamWriter.writeEndElement();
            xMLStreamWriter.writeEndDocument();

            xMLStreamWriter.flush();
            xMLStreamWriter.close();
            
            System.out.println("Write file xml successfully!");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
