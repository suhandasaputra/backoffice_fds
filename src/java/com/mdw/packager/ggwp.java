/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdw.packager;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import java.io.File;
import javax.xml.transform.OutputKeys;

/**
 *
 * @author matajari
 */
public class ggwp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        try {
            DocumentBuilderFactory dbFactory
                    = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.newDocument();

            // root element
            Element rootElement = doc.createElement("isopackager");
            doc.appendChild(rootElement);

            // isofield element
            Element isofield = doc.createElement("isofield");
            rootElement.appendChild(isofield);

            // setting attribute to element
            Attr attr1 = doc.createAttribute("id");
            attr1.setValue("1");
            isofield.setAttributeNode(attr1);

            Attr attr2 = doc.createAttribute("length");
            attr2.setValue("4");
            isofield.setAttributeNode(attr2);
            
            Attr attr3 = doc.createAttribute("name");
            attr3.setValue("MESSAGE TYPE INDICATOR");
            isofield.setAttributeNode(attr3);

            Attr attr4 = doc.createAttribute("class");
            attr4.setValue("org.jpos.iso.IFA_NUMERIC");
            isofield.setAttributeNode(attr4);
            
            
            // write the content into xml file
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("D:\\iso_bikinan.xml"));
            transformer.transform(source, result);

            // Output to console for testing
            StreamResult consoleResult = new StreamResult(System.out);
            transformer.transform(source, consoleResult);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
