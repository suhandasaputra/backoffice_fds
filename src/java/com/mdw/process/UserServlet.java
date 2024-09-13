/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdw.process;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.mdw.db.DatabaseProcess;
import com.mdw.model.Model_User;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhanda
 */
public class UserServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(UserServlet.class);
    DatabaseProcess dp = new DatabaseProcess();

    public UserServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<Model_User> listUser = new ArrayList<>();
            listUser = dp.getAllUser();
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(listUser);
            response.setContentType("application/json");
            response.getWriter().print(element);
        } catch (ParseException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String forward = "";
//        String action = request.getParameter("action");
//        if (action.equalsIgnoreCase("adduser")) {
//
//            Model_User bn = new Model_User();
//            bn.setUsername(request.getParameter("add_username"));
//            bn.setPassword(request.getParameter("add_password"));
//            bn.setBankcode(request.getParameter("add_bankcode"));
//            bn.setStatususer(request.getParameter("add_status"));
//            String status = dp.addUser(bn);
//            if (status.equalsIgnoreCase("00")) {
//                String activitas = "menambahkan user " + request.getParameter("add_user");
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/usr");
//                response.setContentType("text/html;charset=UTF-8");
//                PrintWriter out = response.getWriter();
//                out.println("<div class=\"alert alert-success status-custom\">\n"
//                        + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                        + "     <i class=\"icon fa fa-check\"></i>" +"success add bank"+ "\n"
//                        + "</div>");
//                rd.include(request, response);
//            } else if (status.equalsIgnoreCase("01")) {
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/usr");
//                PrintWriter out = response.getWriter();
//                out.println("<div class=\"alert alert-danger status-custom\">\n"
//                        + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                        + "     <i class=\"icon fa fa-warning\"></i>" + "failed add bank" + "\n"
//                        + "</div>");
//                rd.include(request, response);
//            } else {
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/usr");
//                PrintWriter out = response.getWriter();
//                out.println("<div class=\"alert alert-danger status-custom\">\n"
//                        + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                        + "     <i class=\"icon fa fa-warning\"></i>" + "failed" + "\n"
//                        + "</div>");
//                rd.include(request, response);
//            }
//        }
    }
}
