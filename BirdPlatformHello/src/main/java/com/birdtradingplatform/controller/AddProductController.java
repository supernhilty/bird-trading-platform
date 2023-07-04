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
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

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

        Boolean err = false;
        String url = "AddProduct.jsp";
        try {
            String id = request.getParameter("productID");

            String img = request.getParameter("imageInput");
            System.out.println("Image in add controoler" + img);
            String productName = request.getParameter("productname");

            String type = request.getParameter("type");
            String category = request.getParameter("category");
            int quantity;
            Float price_in = 0.0f;
            Double sale = null ;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                price_in = Float.parseFloat(request.getParameter("price"));
                 sale = Double.parseDouble(request.getParameter("sale"));
            } catch (NumberFormatException e) {
                quantity = -1;
            }
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            HttpSession sesion = request.getSession();
            Shop shop = (Shop) sesion.getAttribute("SHOPEDITPRODUCT");
            if(shop!=null){
                System.out.println(shop.getShopID());
            }else{
                System.out.println("sao nos null ne :< ");
            }
            // select product by id
            ProductDAO dao = new ProductDAO();
            
              Product  dto = new Product(Integer.parseInt(id), productName, price_in, type, category, quantity, description, status, img, "", shop, price_in,sale , null);
            
             Boolean  add =    dao.addProduct(dto,shop.getShopID());
            if(add){
                url = "shopDashboardController";
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
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
