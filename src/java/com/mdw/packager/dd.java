/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdw.packager;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 *
 * @author matajari
 */
public class dd {

//##############################################################################################################
    public static void main(String[] args) {

        dd obj = new dd();
        obj.Reader();

    }//end main

//##############################################################################################################  
    public void Reader() {

        String csvFile = "TWEETS.csv";
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        String[] heading = {};          //The headings (E.g. ID, Message, Link)
        String[] content = {};
        int counter = 0;                //Num of columns
        boolean isheading = true;       //First line is heading

        try {
            //##############################################################################################################
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            // <add> elements
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("add");
            doc.appendChild(rootElement);
            //##############################################################################################################

            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {

                //The first line is heading
                if (isheading) {
                    //The headings (E.g. ID, Message, Link)
                    heading = line.split(cvsSplitBy);
                    counter = heading.length;       //get number of columns
                    isheading = false;
                    continue;                       //Go to next loop
                } else {  //2nd line onwards
                    content = line.split(cvsSplitBy);
                    System.out.println("SG News "
                            + "[ID= " + content[0]
                            + " , FULL_MESSAGE=" + content[1] + "]");
                }

                //##############################################################################################################
                // <doc> elements
                Element docEle = doc.createElement("doc");
                rootElement.appendChild(docEle);

                //Loop according to number of columns
                for (int i = 0; i < counter; i++) {
                    // <field> elements
                    Element fieldEle = doc.createElement("field");
                    rootElement.appendChild(fieldEle);

                    // set attribute to <field> element
                    Attr attr = doc.createAttribute("name");
                    attr.setValue(heading[i]);
                    fieldEle.setAttributeNode(attr);
                    fieldEle.appendChild(doc.createTextNode(content[i]));
                }
                //##############################################################################################################

            }
            //##############################################################################################################
            // write the content into xml file
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("TWEETs_solr.xml"));

            // Output to console for testing
            transformer.transform(source, result);

            System.out.println("File saved!");
            //##############################################################################################################
        } catch (ParserConfigurationException pce) {
            pce.printStackTrace();
        } catch (TransformerException tfe) {
            tfe.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("Done");

    }//end Reader
    //##############################################################################################################

}//end class

