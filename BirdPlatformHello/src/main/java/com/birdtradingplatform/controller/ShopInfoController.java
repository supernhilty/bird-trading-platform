/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.AddressDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Address;
import com.birdtradingplatform.model.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShopInfoController", urlPatterns = {"/ShopInfoController"})
public class ShopInfoController extends HttpServlet {

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
        String url = "ShopInfo.jsp";
        Boolean err = false;
        System.out.println("sing up controkker");
        try  {
           String name = request.getParameter("name");
           String contact = request.getParameter("contact");
           String province = request.getParameter("province");
           String district = request.getParameter("District");
           String detail = request.getParameter("detail");
           int roleSave = 1;
           
           if(name.trim().isEmpty()){
               err= true;
               request.setAttribute("NameERR", true);
           }
           
           if(contact.trim().isEmpty()){
               err= true;
               request.setAttribute("EmailERR", true);
           }
           
           if(province.trim().isEmpty()){
               err= true;
               request.setAttribute("PassERR", true);
           }
           
           if(district.trim().isEmpty()){
               err= true;
               request.setAttribute("ConfirmERR", true);
           }
           
           if(detail.trim().isEmpty()){
               err= true;
               request.setAttribute("DetailERR", true);
           }
           
           
           if (err==false){
               AddressDAO dao = new AddressDAO();
               Address dto = new Address(0, detail,district , province);
               int ID = dao.InertAddressReturnID(dto);
               System.out.println("ID ne " + ID);
               
               String email = request.getParameter("email");
               ShopDAO shopDAO = new ShopDAO();
               Boolean out = shopDAO.AddNewShop(new Shop(1, name, 0, contact, 0, ID), email);
               
               if(out){
                   url = "Login.jsp";
               }else{
                   url = "ShopInfo.jsp";
               }
               
               
           }
           
           
           
        } catch (SQLException ex) {
            Logger.getLogger(ShopInfoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShopInfoController.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            request.setAttribute("ERR", err);
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
