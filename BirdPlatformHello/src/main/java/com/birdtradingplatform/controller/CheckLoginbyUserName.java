/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckLoginbyUserName", urlPatterns = {"/CheckLoginbyUserName"})
public class CheckLoginbyUserName extends HttpServlet {

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
            throws ServletException, IOException, NamingException {
        String url = "Login.jsp";
        AccountDAO dao = new AccountDAO();
        PrintWriter out = response.getWriter();
        try {

            String username = request.getParameter("username");
            String password = request.getParameter("pass");
             Account result = dao.CheckLoginbyUserName(username, password);
            //login by username and 
           Account dto = dao.CheckLoginbyUserName(username, password);

            HttpSession session = request.getSession();


                if (dto != null) {

                url = "GetDataForHomepage";
                // System.out.println("Check by Username IMg ne" + dto.getImg());

                if (dto.getRole()==2) {
//                    set constant
                    url = "AdminDashboardController";
                    // HomePage controller for system admin nhe
                }else  if (dto.getRole()== 3) {
                    url = "shopOrdersController";
                    
                    ShopDAO shopDao= new ShopDAO();
                    Shop shop = shopDao.getShopInforByShopID(dto);           
                    session.setAttribute("SHOPEDITPRODUCT", shop);
                }else{
                    session.setAttribute("USER_ROLE", true);
                }            
            } else {
                url = "Login.jsp";
                request.setAttribute("validAcc", "false");
            }
             session.setAttribute("username", username);
             request.setAttribute("account", result);
             session.setAttribute("dto", dto);
        } catch (ClassNotFoundException ex) {
            log("LoginServlet " + ex.getMessage());
        } catch (SQLException ex) {
            log("LoginServlet " + ex.getMessage());
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
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(CheckLoginbyUserName.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(CheckLoginbyUserName.class.getName()).log(Level.SEVERE, null, ex);
        }
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
