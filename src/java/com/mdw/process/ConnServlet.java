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
import com.mdw.model.Model_Bank;
import com.mdw.model.Model_Conn;
import com.mdw.model.Model_User;
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
public class ConnServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(ConnServlet.class);
    DatabaseProcess dp = new DatabaseProcess();

    public ConnServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<Model_Conn> listConn = new ArrayList<>();
            listConn = dp.getAllConn();
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(listConn);
            JsonArray jsonArray = element.getAsJsonArray();

            response.setContentType("application/json");
            response.getWriter().print(jsonArray);
        } catch (ParseException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("addconn")) {
            Model_Conn mc = new Model_Conn();
//            mc.setSeq(request.getParameter("seq"));
            mc.setTodirect(request.getParameter("todirect"));
            mc.setHost(request.getParameter("host"));
            mc.setPort(request.getParameter("port"));
            mc.setBankcode(request.getParameter("bankcode"));
            mc.setConname(request.getParameter("conname"));
            mc.setPackagename(request.getParameter("packagename"));
            mc.setTypeapp(request.getParameter("typeapp"));
            mc.setHeadertype(request.getParameter("headertype"));
            mc.setLengthincl(request.getParameter("lengthincl"));
            mc.setPackagerpath(request.getParameter("packagerpath"));
            mc.setStatusopen(request.getParameter("statusopen"));
            mc.setAutosignon(request.getParameter("autosignon"));
            mc.setNeedsignon(request.getParameter("needsignon"));
            mc.setLoadbalancing(request.getParameter("loadbalancing"));
            mc.setLbgroup(request.getParameter("lbgroup"));
            
            String status = dp.addConn(mc);
            if (status.equalsIgnoreCase("00")) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/con");
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<div class=\"alert alert-success status-custom\">\n"
                        + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
                        + "     <i class=\"icon fa fa-check\"></i>" + "success add connection" + "\n"
                        + "</div>");
                rd.include(request, response);
            } else if (status.equalsIgnoreCase("01")) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/con");
                PrintWriter out = response.getWriter();
                out.println("<div class=\"alert alert-danger status-custom\">\n"
                        + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
                        + "     <i class=\"icon fa fa-warning\"></i>" + "failed add connection" + "\n"
                        + "</div>");
                rd.include(request, response);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/usr");
                PrintWriter out = response.getWriter();
                out.println("<div class=\"alert alert-danger status-custom\">\n"
                        + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
                        + "     <i class=\"icon fa fa-warning\"></i>" + "failed" + "\n"
                        + "</div>");
                rd.include(request, response);
            }
        }
    }
}
