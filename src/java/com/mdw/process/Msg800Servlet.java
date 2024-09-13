/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdw.process;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.mdw.db.DatabaseProcess;
import com.mdw.model.Model_800;
import com.mdw.model.Model_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhanda
 */
public class Msg800Servlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(Msg800Servlet.class);
    DatabaseProcess dp = new DatabaseProcess();

    public Msg800Servlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bankcode = request.getParameter("bankcode");
        try {
            ArrayList<Model_800> list800 = new ArrayList<>();
//            String bankcode = "bca";
            list800 = dp.getAll800(bankcode);
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(list800);
            JsonArray jsonArray = element.getAsJsonArray();

            response.setContentType("application/json");
            response.getWriter().print(jsonArray);
        } catch (ParseException ex) {
            Logger.getLogger(Msg800Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
    }
}
