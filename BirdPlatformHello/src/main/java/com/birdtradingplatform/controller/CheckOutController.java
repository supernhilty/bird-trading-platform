/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.AddressShipmentDAO;
import com.birdtradingplatform.dao.CustomerDAO;
import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.model.Cart;
import com.birdtradingplatform.model.Customer;
import com.birdtradingplatform.model.Item;
import com.birdtradingplatform.model.MutilShopCart;
import com.birdtradingplatform.model.Product;
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
@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException, NamingException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String chooseaddress = (String) request.getAttribute("chooseaddress");
        String redirect = (String) request.getAttribute("redirect");
        if ("modifyaddress".equals(redirect)) {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("dto");
            CustomerDAO cusDAO = new CustomerDAO();
            Customer customer = cusDAO.getCustomerByAccountID(account.getAccountID());
            if (customer == null) {
                response.sendRedirect("err.html");
            }
            List<AddressShipment> addressShipmentList = cusDAO.getAddressShipmentByCusID(customer.getCustomerID());//test
            //deliveryto
            request.setAttribute("addressShipment", addressShipmentList.get(0));
            request.setAttribute("addressShipmentList", addressShipmentList);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);

        } else if ("Check-out".equals(action) || "chooseaddress".equals(chooseaddress)) {
            HttpSession session = request.getSession();
            String addressShipID = request.getParameter("addressShipID");
            Account account = (Account) session.getAttribute("dto");
            if (account == null) {
                request.getRequestDispatcher("Login.jsp").include(request, response);
            }
            CustomerDAO cusDAO = new CustomerDAO();
            Customer customer = cusDAO.getCustomerByAccountID(account.getAccountID());
            if (customer == null) {
                response.sendRedirect("err.html");
            }
            List<AddressShipment> addressShipmentList = cusDAO.getAddressShipmentByCusID(customer.getCustomerID());//test
            //deliveryto
            if (addressShipID == null) {
                request.setAttribute("addressShipment", addressShipmentList.get(0));

            } else {
                try {
                    AddressShipmentDAO adao = new AddressShipmentDAO();

                    request.setAttribute("addressShipment", adao.getAddressShipmentByID(Integer.parseInt(addressShipID)));
                } catch (Exception e) {
                    request.setAttribute("addressShipment", addressShipmentList.get(0));

                }

            }
            request.setAttribute("addressShipmentList", addressShipmentList);

            String checkoutList[] = request.getParameterValues("checkoutlist");
            if (checkoutList == null || checkoutList.length == 0) {
                MutilShopCart allShopCart = (MutilShopCart) session.getAttribute("allShopCart");
//                MutilShopCart bet = allShopCart;
//                MutilShopCart checkoutMap = bet;
                MutilShopCart checkoutMap = allShopCart;

                session.setAttribute("checkoutMap", checkoutMap);

                request.getRequestDispatcher("checkout.jsp").forward(request, response);

            } else if (checkoutList != null) {
                MutilShopCart checkoutMap = new MutilShopCart();
                for (String value : checkoutList) {
                    int productID = Integer.parseInt(value);
                    ProductDAO dao = new ProductDAO();
                    Product product = dao.getProduct(productID + "");
                    MutilShopCart allShopCart = (MutilShopCart) session.getAttribute("allShopCart");
                    for (Map.Entry<Integer, Cart> en : allShopCart.getMutilShopCart().entrySet()) {
                        int key = en.getKey();
                        Cart shopcart = en.getValue();
                        for (Map.Entry<Integer, Item> entry : shopcart.getCart().entrySet()) {
                            int key1 = entry.getKey();
                            Item item = entry.getValue();
                            if (item.getProduct().getProductID() == productID) {
                                checkoutMap.addMutilShop(item);
                            }
                        }

                    }

                }

                session.setAttribute("checkoutMap", checkoutMap);
                session.setAttribute("totalpriceCheckout", checkoutMap.getTotalMoneyAllShop());
                session.setAttribute("totalquantityCheckout", checkoutMap.getTotalCountAllShop());

                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                response.sendRedirect("err.html");
            }

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
        } catch (Exception ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CheckOutController.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
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
