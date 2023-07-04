package com.birdtradingplatform.shop.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.AddressShipmentDAO;
import com.birdtradingplatform.dao.CustomerDAO;
import com.birdtradingplatform.dao.OrderDAO;
import com.birdtradingplatform.dao.OrderDetailDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.model.Customer;
import com.birdtradingplatform.model.Order;
import com.birdtradingplatform.model.OrderDetail;
import java.io.IOException;
import java.sql.SQLException;
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

@WebServlet(name = "shopOrderDetailsController", urlPatterns = {"/shopOrderDetailsController"})
public class shopOrderDetailsController extends HttpServlet {
    private final String SHOP_ORDERDETAILS = "shopOrderDetails.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SHOP_ORDERDETAILS;
        
        try {
            String orderID = request.getParameter("orderID");
            String total = request.getParameter("total");
            String status = request.getParameter("status");
            
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            OrderDAO orderDAO = new OrderDAO();
            AccountDAO accountDAO = new AccountDAO();
            AddressShipmentDAO shipmentDAO = new AddressShipmentDAO();
            
            Order order = orderDAO.getOrdersByID(orderID);
            Customer customer = orderDAO.getCustomerByOrderID(orderID);
            Account account = accountDAO.getAccountByCustomerID(customer.getAccountID());
            AddressShipment addressShipment = shipmentDAO.getAddressShipmentByID(order.getAddressShipID());
            
            String customerName = account.getUsername();
            String phoneNumber = customer.getPhonenumber();
            String address = addressShipment.getDetail() + " " + addressShipment.getDistrict() + " " + addressShipment.getProvince();

            List<OrderDetail> details = orderDetailDAO.getImgByOrderID(order.getOrderID());
            Map<Integer, String> imgMap = orderDetailDAO.getMapImg();
            Map<Integer, String> productType = orderDetailDAO.getTypeOfProduct();
                    
            request.setAttribute("details", details);
            request.setAttribute("imgMap", imgMap);
            request.setAttribute("address", address);
            request.setAttribute("customerName", customerName);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("status", status);
            request.setAttribute("total", total);
            request.setAttribute("productType", productType);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(shopOrderDetailsController.class.getName()).log(Level.SEVERE, null, ex);
            // Optionally, you can redirect to an error page here
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
