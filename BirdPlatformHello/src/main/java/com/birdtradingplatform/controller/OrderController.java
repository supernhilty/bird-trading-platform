/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.CustomerDAO;
import com.birdtradingplatform.dao.OrderDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.model.Cart;
import com.birdtradingplatform.model.Customer;
import com.birdtradingplatform.model.Item;
import com.birdtradingplatform.model.MutilShopCart;

import com.birdtradingplatform.model.OrderDetailItem;
import com.birdtradingplatform.model.OrderHistory;
import com.birdtradingplatform.model.Shop;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leyen
 */
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if ("historyorder".equals(action)) {
            HttpSession session = request.getSession();
            String status = request.getParameter("status");
            //get account login in this session with attribute name is LOGIN_ACCOUNT
            Account account = (Account) session.getAttribute("dto");
            if (account == null) {
                request.getRequestDispatcher("Login.jsp").include(request, response);
            }
            CustomerDAO cusDAO = new CustomerDAO();
            Customer customer = cusDAO.getCustomerByAccountID(account.getAccountID());
            if (customer == null) {
                response.sendRedirect("err.html");
            }
            int limit = 10;
            int curPage;
            try {
                curPage = Integer.parseInt(request.getParameter("curPage"));
            } catch (Exception e) {
                curPage = 1;
            }
            OrderDAO odao = new OrderDAO();
            
            List<OrderHistory> orderList = odao.getOrderHistory(customer.getCustomerID(), status, curPage, limit);
            int total = odao.getOrderHistoryCount(customer.getCustomerID(), status).size();
            int totalpage= (int) Math.ceil((double) total / (double) limit);
            request.setAttribute("ORDER_LIST", orderList);
            request.setAttribute("totalpage", totalpage);
            request.setAttribute("currentpage", curPage);
            request.setAttribute("status", status);

            request.getRequestDispatcher("orderhistory.jsp").forward(request, response);

        } else if ("Order".equals(action)) {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("dto");
            int addressID;
            AddressShipment addressShipment;
            if (account == null) {
                request.getRequestDispatcher("Login.jsp").include(request, response);
            }
            CustomerDAO cusDAO = new CustomerDAO();
            Customer customer = cusDAO.getCustomerByAccountID(account.getAccountID());
            if (customer == null) {
                response.sendRedirect("err.html");
            }
            try {
                addressID = Integer.parseInt(request.getParameter("addressShip"));
                addressShipment = cusDAO.getAddressShipmentByID(addressID);

            } catch (Exception e) {
                addressShipment = cusDAO.getAddressShipmentByCusID(customer.getCustomerID()).get(0);
            }

            //deliveryto
            request.setAttribute("addressShipment", addressShipment);
            Customer cus = cusDAO.getCustomerByAccountID(account.getAccountID());//test
            MutilShopCart allShopCart = (MutilShopCart) session.getAttribute("allShopCart");
            MutilShopCart checkoutMap = (MutilShopCart) session.getAttribute("checkoutMap");
            OrderDAO odao = new OrderDAO();
            odao.addOrder(cus.getCustomerID(), checkoutMap, addressShipment.getAddressShipID());//test
            if (cus != null) {
                try {
                    for (Map.Entry<Integer, Cart> en : checkoutMap.getMutilShopCart().entrySet()) {
                        int key = en.getKey();
                        Cart shopcart = en.getValue();
                        if (allShopCart.getMutilShopCart().containsKey(key)) {
                            for (Map.Entry<Integer, Item> entry : shopcart.getCart().entrySet()) {
                                int pid = entry.getKey();
                                Item item = entry.getValue();
                                try {
                                    if (allShopCart.getMutilShopCart().get(key).getCart().containsKey(pid)) {
                                        allShopCart.deleteMutilShop(item.getProduct());
                                    }
                                } catch (Exception e) {
                                }

                            }
                        }

                    }
                } catch (Exception e) {
                }

                String mess = "You ordered succeed. Your order will be processed as soon as possible";
                request.setAttribute("message", mess);
                session.setAttribute("checkoutMap", null);

                if (allShopCart != null) {

                    if (allShopCart.getMutilShopCart().isEmpty()) {
                        allShopCart = null;
                    }
                }

                session.setAttribute("allShopCart", allShopCart);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        } else if ("orderdetail".equals(action)) {
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            OrderDAO odao = new OrderDAO();
            List<OrderDetailItem> orderDetailList = odao.getOrderDetailList(orderID);
            request.setAttribute("orderDetailList", orderDetailList);

            OrderHistory order = odao.getOrderHistory(orderID);
            request.setAttribute("order", order);
            ShopDAO sdao = new ShopDAO();
            Shop shop = sdao.getShop(order.getShopID() + "");
            request.setAttribute("shop", shop);

            request.getRequestDispatcher("orderHistoryDetailCus.jsp").forward(request, response);
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
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
