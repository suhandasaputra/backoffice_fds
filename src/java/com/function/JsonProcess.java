/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.function;

import java.util.HashMap;
import java.util.Iterator;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author matajari
 */
public class JsonProcess {

    private static Logger log = Logger.getLogger(JsonProcess.class);

    public static String generateJson(HashMap data) {
        return new JSONObject(data).toJSONString();
    }

    public static HashMap decodeJson(String msg) {
        HashMap obj = null;
        try {
            JSONParser parser = new JSONParser();
            obj = (HashMap) parser.parse(msg);
            new JsonProcess().printmsg(obj);
        } catch (ParseException ex) {
            log.error(ex.getMessage());
        }
        return obj;
    }

    public void printmsg(HashMap obj) {
        Iterator iterator = obj.keySet().iterator();
        String loginfomsg = "";
        while (iterator.hasNext()) {
            String item = iterator.next().toString();
            if (castjsonobj(obj, item)) {
                HashMap subobj = (HashMap) obj.get(item);
                printmsg(subobj);
            } else {
            }
        }
    }

    private boolean castjsonobj(HashMap obj, String key) {
        try {
            if (obj.get(key) == null) {
                return false;
            }

            obj = (HashMap) obj.get(key);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
