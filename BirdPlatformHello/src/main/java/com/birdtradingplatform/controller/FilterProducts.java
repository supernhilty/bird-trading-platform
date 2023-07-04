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

/**
 *
 * @author Admin
 */
@WebServlet(name = "FilterProducts", urlPatterns = {"/FilterProducts"})
public class FilterProducts extends HttpServlet {

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
        try {
            // key search value
            String search = request.getParameter("searchValue");

            // shop search 
            ShopDAO shopDAO = new ShopDAO();
            Shop shopDTO = shopDAO.getShopInforByShopName(search);
            if (shopDTO != null) {
                int total = shopDAO.getTotalProduct(shopDTO.getShopID());
                String address = shopDAO.getShopAddressSearch(shopDTO.getShopID());
                request.setAttribute("Address", address);
                request.setAttribute("SHOP", shopDTO);
                request.setAttribute("TOTALP", total);
            }

            // product search
            String field = "  productname  ";
            String order = "";
            String sortPrice = request.getParameter("SortPrice");
            if (sortPrice == null) {
                order = "";

            } else if (sortPrice.equalsIgnoreCase("low to high")) {
                order = " order by priceOut ASC ";
            } else if (sortPrice.equalsIgnoreCase("high to low")) {
                order = " order by priceOut DESC ";
            }
            System.out.println("sort price" + sortPrice);

            String address = request.getParameter("address");
            System.out.println("address" + address);
            if (address != null) {
                field = " province like '%" + address + "%' and " + field;
            }

            String category = request.getParameter("category");
            System.out.println("category" + category);
            if (category != null) {
                field = " category like '%" + category + "%' and " + field;
            }

            try {
                int star = Integer.parseInt(request.getParameter("rating"));
                if (star > 0) {
                   
                    field = " rating  >= " + star + " and " + field;
                }

                Float pricelow = Float.parseFloat(request.getParameter("priceLow"));
                Float pricehigh = Float.parseFloat(request.getParameter("priceHigh"));
                System.out.println("price come from " + pricelow + " to " + pricehigh);
                if (pricelow == null) {
                    pricelow = Float.MIN_VALUE;
                }
                if (pricehigh == null) {
                    pricehigh = Float.MAX_VALUE;
                }
                if (pricehigh > 0 && pricelow > 0 && pricehigh > pricelow) {
                    field = " priceOut >= " + pricelow + " and priceOut <= " + pricehigh + " and " + field;
                } else {
                    request.setAttribute("PriceErr", true);
                }

            } catch (NumberFormatException ex) {

            }
            ProductDAO productDAO = new ProductDAO();
            ArrayList list = productDAO.getProductBySearchFunction(search, field, order);

            request.setAttribute("SEARCHLIST", list);
            request.setAttribute("SEARCHVALUE", search);
        } catch (ClassNotFoundException ex) {
            log("FilterProduct controller " + ex.getMessage());
        } catch (SQLException ex) {
            log("FilterProduct controller " + ex.getMessage());
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
