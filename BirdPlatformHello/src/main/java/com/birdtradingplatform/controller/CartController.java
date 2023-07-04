/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.model.Cart;
import com.birdtradingplatform.model.Item;
import com.birdtradingplatform.model.MutilShopCart;
import com.birdtradingplatform.model.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String productID = request.getParameter("productID");

        if ("removeitem".equals(action)) {
//            int pID;
//            try {
//                pID = Integer.parseInt(request.getParameter("productID"));
//            } catch (Exception e) {
//                pID = -1;
//            }
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(productID);

            HttpSession session = request.getSession();
            MutilShopCart allShopCart = (MutilShopCart) session.getAttribute("allShopCart");

            if (allShopCart != null) {
                allShopCart.deleteMutilShop(product);
                try {
                    for (Map.Entry<Integer, Cart> entry : allShopCart.getMutilShopCart().entrySet()) {
                        Integer key = entry.getKey();
                        Cart cart = entry.getValue();
                        if (cart.getCart().isEmpty()) {
                            allShopCart.getMutilShopCart().remove(key);
                        }
                    }
                } catch (Exception e) {
                }

                //session.setAttribute("cartlist", Cart.getItemlist(cart));
                session.setAttribute("totalprice", allShopCart.getTotalMoneyAllShop());
                session.setAttribute("totalquantity", allShopCart.getTotalCountAllShop());
                if (allShopCart.getMutilShopCart().isEmpty()) {
                    allShopCart = null;
                }
                session.setAttribute("allShopCart", allShopCart);
                request.getRequestDispatcher("cartview.jsp").forward(request, response);
            }
        } else if ("buyone".equals(action)) {

        } else if ("addtocart".equals(action)) {
            int quantity;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (Exception e) {
                quantity = 1;
            }
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(productID);
            Item item = new Item(product, quantity);
            HttpSession session = request.getSession();
            MutilShopCart allShopCart = (MutilShopCart) session.getAttribute("allShopCart");
            if (allShopCart == null) {
                allShopCart = new MutilShopCart();
            }
            allShopCart.addMutilShop(item);
//          Integer i = (Integer) (allShopCart.getMutilShopCart().values().toArray())[0];
            session.setAttribute("allShopCart", allShopCart);
            //session.setAttribute("cartlist", Cart.getItemlist(cart));

            String message = "Add " + quantity + " " + product.getProductName() + " successfully!";
            session.setAttribute("totalprice", allShopCart.getTotalMoneyAllShop());
            session.setAttribute("totalquantity", allShopCart.getTotalCountAllShop());
            request.setAttribute("addmessage", message);
            request.getRequestDispatcher("product?action=detail&productID=" + productID).forward(request, response);

        } else if ("buyall".equals(action)) {
            request.getRequestDispatcher("buy.jsp").forward(request, response);
        } else if ("update".equals(action)) {
//            int pID;
//            try {
//                pID = Integer.parseInt(request.getParameter("productID"));
//            } catch (Exception e) {
//                pID = -1;
//            }
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(productID);
            int quantity;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (Exception e) {
                quantity = 1;
            }
            HttpSession session = request.getSession();
            MutilShopCart allShopCart = (MutilShopCart) session.getAttribute("allShopCart");
//            for (Item item : cart.getCart().values()) {
//                if (item.getProduct().getProductID() == (pID)) {
//                    item.setQuantity(quantity);
//                }
//            }
            allShopCart.updateMutilShop(product, new Item(product, quantity));

            session.setAttribute("allShopCart", allShopCart);
            session.setAttribute("totalprice", allShopCart.getTotalMoneyAllShop());
            session.setAttribute("totalquantity", allShopCart.getTotalCountAllShop());
            //session.setAttribute("cartlist", Cart.getItemlist(cart));
            request.getRequestDispatcher("cartview.jsp").forward(request, response);
        }else if ("Check-out".equals(action)){
            request.getRequestDispatcher("checkout").forward(request, response);
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
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
