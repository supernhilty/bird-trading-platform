/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DispatcherServlet", urlPatterns = {"/DispatcherServlet"})
public class DispatcherServlet extends HttpServlet {

    private String HOMECOMTROLLER = "GetDataForHomepage";
    private String LOGINCONTROLLER = "CheckLoginbyUserName";
    private String REGISTERCONTROLLER = "SignUP";
    private String ResetPassccontroller = "ResetPass";
    private String GETKEYTORESETPASSCONTROLLER = "GetKeyToResetPass";
    private String UPDATECONTROLLER = "UpdateProfile";
    private String GETDATATOUSERPROFILECONTROLLE = "GetDataForUserProfile";
    private String UPDATEPASSCONTROLLER = "UpdateNewPass";
    private String CHECKMAILCONTROLLER = "CreateCodeController";
    private String CHANGEPASSCONTROLLER = "ChangePassController";
    private String UPDATEPRODUCTCONTROLLER = "UpdateProduct";
    private String ADDPRODUCTCONTROLLER = "AddProductController";
    private String SHOPDELETEPRODUCTCONTROLLER = "ShopDeleteProductController";
    private String USERPROFILECONTROLLER = "GetDataForUserProfile";
    private String SEARCHCONTROLLER = "SearchController";
     private String SHOPINFOCONTROLLER = "ShopInfoController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "Err.html";
        try {
            String submit = request.getParameter("MAIN");
            if (submit.isEmpty()) {

            } else if (submit.equalsIgnoreCase("UserProfile")) {
                url = USERPROFILECONTROLLER;
            } else if (submit.equalsIgnoreCase("Home")) {
                url = HOMECOMTROLLER;
            } else if (submit.equalsIgnoreCase("Login")) {
                url = LOGINCONTROLLER;
            } else if (submit.equalsIgnoreCase("Register")) {
                url = REGISTERCONTROLLER;
            } else if (submit.equalsIgnoreCase("ResetPass")) {
                url = UPDATEPASSCONTROLLER;
            } else if (submit.equalsIgnoreCase("Please check your Gmail")) {
                url = ResetPassccontroller;
            } else if (submit.equalsIgnoreCase("Please check your Gmail")) {
                url = GETKEYTORESETPASSCONTROLLER;
            } else if (submit.equalsIgnoreCase("Save Profile")) {
                url = UPDATECONTROLLER;
            } else if (submit.equalsIgnoreCase("CheckMail")) {
                url = CHECKMAILCONTROLLER;
            } else if (submit.equalsIgnoreCase("Update Pass")) {
                url = CHANGEPASSCONTROLLER;
            } else if (submit.equalsIgnoreCase("Update product")) {
                url = UPDATEPRODUCTCONTROLLER;
            } else if (submit.equalsIgnoreCase("Add product")) {
                url = ADDPRODUCTCONTROLLER;
            } else if (submit.equalsIgnoreCase("Delete")) {
                System.out.println("doooooo");
                url = SHOPDELETEPRODUCTCONTROLLER;
            }else if(submit.equalsIgnoreCase("Search")){
                url = SEARCHCONTROLLER;
            }else if(submit.equalsIgnoreCase("Continue")){
                url = SHOPINFOCONTROLLER;
            }

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
