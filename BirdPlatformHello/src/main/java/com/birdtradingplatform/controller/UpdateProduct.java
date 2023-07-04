/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.model.Product;
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
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

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
        Boolean err = false;
        String url = "updateProduct.jsp";
        try {

            // đoạn này test id = 1 nhe
            String id = request.getParameter("ID");

            String img = request.getParameter("imageInput");
            String productName = request.getParameter("productname");

            String type = request.getParameter("type");
            String category = request.getParameter("category");
            int quantity;
            Float price_in = 0.0f;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                price_in = Float.parseFloat(request.getParameter("price"));
            } catch (NumberFormatException e) {
                quantity = -1;
            }
            String description = request.getParameter("description");
            String status = request.getParameter("status");

            // select product by id
            ProductDAO dao = new ProductDAO();
            Product dto = dao.getProduct(id);

            if (dto != null) {
                if (img != null && dto.getImg() != img) {
                    dto.setImg(img);
                }
                if (productName != null && dto.getProductName() != productName) {
                    dto.setProductName(productName);
                }
                if (price_in != 0.0f && dto.getPriceIn() != price_in) {
                    dto.setPriceIn(price_in);
                }
                if (type != null && dto.getType() != type) {
                    dto.setType(type);
                }
                if (category != null && dto.getCategory() != category) {
                    dto.setCategory(category);
                }
                if (quantity != -1 && dto.getQuantity() != quantity) {
                    dto.setQuantity(quantity);
                }
                if (description != null && dto.getDescription() != description) {
                    dto.setDescription(description);
                }
                if (status != null && dto.getStatus() != status) {
                    dto.setStatus(status);

                }
                HttpSession sesion = request.getSession();
                Shop shop = (Shop) sesion.getAttribute("SHOPEDITPRODUCT");
                Boolean update = dao.UpdateProduct(dto, shop.getShopID());
                
                if (update) {
                    url = "shopProductController";
                }

            } else {
                log("Updateproduct controller can not get id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
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
