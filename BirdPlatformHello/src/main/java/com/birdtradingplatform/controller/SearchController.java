
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.birdtradingplatform.model.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        try {
            String searchvalue = request.getParameter("searchValue");
            System.out.println("Search controller nefeeeeeeeeee" + searchvalue);

            ShopDAO shopDAO = new ShopDAO();
            Shop shopDTO = shopDAO.getShopInforByShopName(searchvalue);
            if (shopDTO != null) {
                int total = shopDAO.getTotalProduct(shopDTO.getShopID());
                String address = shopDAO.getShopAddressSearch(shopDTO.getShopID());
                request.setAttribute("Address", address);
                request.setAttribute("SHOP", shopDTO);
                request.setAttribute("TOTALP", total);
            }

            ProductDAO productDAO = new ProductDAO();

        //    String field = " product.quantity < 5 and productname  ";
        String field = " productname  ";
            ArrayList list = productDAO.getProductBySearchFunction(searchvalue, field,"");

            
            request.setAttribute("SEARCHLIST", list);
            session.setAttribute("SEARCHVALUE", searchvalue);
        } catch (ClassNotFoundException ex) {
            System.out.println("class " + ex.getMessage());
            log("SearchController " + ex.getMessage());
       } catch (SQLException ex) {
            System.out.println("slq " + ex.getMessage());
            log("SearchController " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
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
        } catch (SQLException ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
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
