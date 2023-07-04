/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.CustomerDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Customer;
import com.birdtradingplatform.model.UserGoogleDto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
@WebServlet(name = "GetDataForUserProfile", urlPatterns = {"/GetDataForUserProfile"})
public class GetDataForUserProfile extends HttpServlet {

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
        try {
            System.out.println("get Profile here");
            HttpSession session = request.getSession();
            Account userDTO = (Account) session.getAttribute("USERDTOBYUSERNAME");
            AccountDAO dao = new AccountDAO();
            request.setAttribute("SERVLET", true);
            String gmail = null;
            System.out.print("get Data Servlet ne");

            UserGoogleDto ggDTO = (UserGoogleDto) session.getAttribute("GOOGLE_ACC");
            String changeGmail = (String) request.getAttribute("CHANGE_GMAIL"); 
            
            if(changeGmail!= null){
                gmail = changeGmail;
            }else if (ggDTO != null) {
                gmail = ggDTO.getEmail();
            }else if (userDTO != null) {
                gmail = userDTO.getEmail();
            }
            System.out.println("Gmail ở get profile :" +gmail);
            
            Account account = dao.CheckLoginbyGmail(gmail);
            Customer cusDTO = new Customer();
            if (account != null) {
                System.out.println("GEt profiile, account new í fine");
                session.setAttribute("USERDTOBYUSERNAME", account);
                request.setAttribute("ACCOUNT_EXIST_IN_DB", true);

                CustomerDAO CusDAO = new CustomerDAO();
                cusDTO = CusDAO.getCustomerByAccountID(account.getAccountID());
                
                
            }
            session.setAttribute("CUSTOMERDTO", cusDTO);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetDataForUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetDataForUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(GetDataForUserProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher rd = request.getRequestDispatcher("userProfile_1.jsp");
        rd.forward(request, response);

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
            Logger.getLogger(GetDataForUserProfile.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GetDataForUserProfile.class.getName()).log(Level.SEVERE, null, ex);
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
