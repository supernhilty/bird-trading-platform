    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.birdtradingplatform.admin.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.OrderDAO;
import com.birdtradingplatform.dao.OrderDetailDAO;
import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Order;
import com.birdtradingplatform.model.OrderDetail;
import com.birdtradingplatform.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Quan
 */
public class AdminDashboardController extends HttpServlet {
    private final  String DASHBOARD_PAGE  = "dashboard.jsp";
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
        String url = "dashboard.jsp";
        try {
            double income = 0;
            String button = request.getParameter("txtAction");
//            get Session
            HttpSession session = request.getSession();
            Account currentUser = null;
//            if (session == null) {
            currentUser = (Account) session.getAttribute("USER");

//                get the number of User
            AccountDAO userDAO = new AccountDAO();
            ArrayList<Account> userList = userDAO.getUserList();
            int numberOfUser = userList.size();
//                get the number of Orders
            OrderDAO ordersDAO = new OrderDAO();
            ordersDAO.getOrders();
            List<Order> orderList = ordersDAO.getOrderList();
            int numberOfOrders = orderList.size();
//                get the top 5 product
            ProductDAO productDAO = new ProductDAO();
            OrderDetailDAO dao = new OrderDetailDAO();
            dao.getTop5Product();
//            top 5 quantity
            List<OrderDetail> orderDetailList = dao.getOrderItemList();
            productDAO.searchProduct(orderDetailList);
//            top 5 product's name
            List<Product> list = productDAO.getProductList();
//            get the platform income
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.getOrders();
            List<Order> orders = orderDAO.getOrderList();
            for (int i = 0; i < orders.size(); i++) {
                 income = orders.get(i).getTotal();
            }
           double incomeOfPlatform = income * 0.5;
           
            request.setAttribute("INCOME", incomeOfPlatform);
            request.setAttribute("ORDERS", numberOfOrders);
            request.setAttribute("DATA", numberOfUser);
            request.setAttribute("TOPQUANTITY", orderDetailList);
            request.setAttribute("TOPPRODUCT", list);

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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
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