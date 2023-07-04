/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.birdtradingplatform.shop.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.OrderDAO;
import com.birdtradingplatform.dao.OrderDetailDAO;
import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Order;
import com.birdtradingplatform.model.OrderDetail;
import com.birdtradingplatform.model.Product;
import com.birdtradingplatform.model.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
 * @author Minh Quan
 */
@WebServlet(name = "shopDashboardController", urlPatterns = {"/shopDashboardController"})
public class shopDashboardController extends HttpServlet {
    private final String SHOP_PAGE = "shopDashboard.jsp";
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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Account dto = (Account) session.getAttribute("dto");
                AccountDAO accountDAO = new AccountDAO();
                OrderDAO orderDAO = new OrderDAO();
                ShopDAO shopDAO = new ShopDAO();
                ProductDAO productDAO = new ProductDAO();
                OrderDetailDAO detailDAO = new OrderDetailDAO();
                 Map<Integer, String> topProduct = new HashMap<>();
                  List<OrderDetail> productList = new ArrayList<>();
                double total = 0;
                    Shop shop = shopDAO.getShopInforByShopID(dto);
                    List<Product> products =  productDAO.getProductByShopID(shop);
                    List<Order> orders = orderDAO.getOrderByShopID(shop);
                    
                    List<Order> incomeList = orderDAO.getIncomeOfTheShop(shop.getShopID());
                    Map<Double, String> incomeMap = orderDAO.getIncomeOfShopMap();
                    
                    List<Order> saleList = orderDAO.getNumberOfOrderByMonth(shop.getShopID());
                    Map<Integer, String> saleMap = orderDAO.getSaleMap();
                    
                    for (int i = 0; i < orders.size(); i++) {
                    total += orders.get(i).getTotal();
                     productList = detailDAO.getTop5ProductOfShop();
                     topProduct = detailDAO.getTopProductMap();
                    }
                    request.setAttribute("SALEMAP", saleMap);
                    request.setAttribute("INCOMEMAP", incomeMap);
                    request.setAttribute("TOPPRODUCTOFSHOP", topProduct);
                    request.setAttribute("QUANTITY", productList);
                    request.setAttribute("NUMBEROFORDER", orders.size());
                    request.setAttribute("INCOMEOFSHOP", total);
                    request.setAttribute("INCOME", orders);
                    request.setAttribute("NUMBEROFPRODUCT", products.size());
                }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(SHOP_PAGE);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(shopDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(shopDashboardController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(shopDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(shopDashboardController.class.getName()).log(Level.SEVERE, null, ex);
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