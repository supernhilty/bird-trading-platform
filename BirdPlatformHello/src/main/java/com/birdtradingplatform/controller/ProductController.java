/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.CustomerDAO;
import com.birdtradingplatform.dao.FeedbackDAO;
import com.birdtradingplatform.dao.OrderDAO;
import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.model.FeedbackDetail;
import com.birdtradingplatform.model.Product;
import com.birdtradingplatform.model.ProductWithRate;
import com.birdtradingplatform.model.Shop;
import com.birdtradingplatform.model.ShopAddress;
import com.birdtradingplatform.utils.Utils;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
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
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        System.out.println("Productcontroller");
        if ("".equals(action) || action == null) {
            ProductDAO pdao = new ProductDAO();
            int limit = 3;
            int total = pdao.getProductCount("");
            int curPage;
            try {
                curPage = Integer.parseInt(request.getParameter("curPage"));
            } catch (Exception e) {
                curPage = 1;
            }
            int totalPage = (int) Math.ceil((double) total / (double) limit);
            List<Product> bestSellerList = pdao.getBestSellerList(limit, curPage);
            request.setAttribute("totalpage", totalPage);
            request.setAttribute("currentpage", curPage);
            request.setAttribute("bestSellerList", bestSellerList);
            int curPageNew;
            try {
                curPageNew = Integer.parseInt(request.getParameter("currentpagenew"));
            } catch (Exception e) {
                curPageNew = 1;
            }
            List<Product> newList = pdao.getNewItemsList(limit, curPageNew);
            request.setAttribute("currentpagenew", curPageNew);
            request.setAttribute("newList", newList);
            request.setAttribute("isinclude", 0);
            if ("home".equals(request.getParameter("prev"))) {
                request.getRequestDispatcher("HomePage.jsp").forward(request, response);
            }

        } else if ("detail".equals(action)) {
            String productID = request.getParameter("productID");

            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(productID);
            OrderDAO odao = new OrderDAO();
            int sold = odao.getProductSold(productID);
            request.setAttribute("sold", sold);

            if (product != null) {
                HttpSession session = request.getSession();
                Account account = (Account) session.getAttribute("account");
                if (account != null) {
                    CustomerDAO cusDAO = new CustomerDAO();
                    AddressShipment addressShipment = cusDAO.getAddressShip(account.getAccountID());
                    //deliveryto
                    request.setAttribute("addressShipment", addressShipment);
                }
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                int totalfeedback = feedbackDAO.getFeedbackCount(Integer.parseInt(productID));
                request.setAttribute("totalfeedback", totalfeedback);
                if (totalfeedback != 0) {
                    double staravg = feedbackDAO.getFeedbackStar(Integer.parseInt(productID));
                    request.setAttribute("staravg", staravg);

                }
                ShopDAO shopdao = new ShopDAO();
                //Shop Account
                Account acc = shopdao.getShopAccount(product.getShop().getShopID());
                //address
                ShopAddress address = shopdao.getShopAddress(product.getShop().getShopID());
                //join time
                long join = Utils.countTime(Utils.toDate(acc.getRegisDate()), new java.util.Date());
                if (join > 30) {
                    join = join / 30;
                    request.setAttribute("joinmonth", join);
                } else {
                    request.setAttribute("joinday", join);
                }
                //feedback list
                int limit = 2;
                int curPage;
                try {
                    curPage = Integer.parseInt(request.getParameter("page"));
                } catch (Exception e) {
                    curPage = 1;
                }
                List<FeedbackDetail> list = feedbackDAO.getFeedbackDetailListPaging(Integer.parseInt(productID), curPage, limit);
                String colStar = "star";
                int fivestar = feedbackDAO.getFeedbackCountConditon(Integer.parseInt(productID), colStar, "= 5");
                int fourstar = feedbackDAO.getFeedbackCountConditon(Integer.parseInt(productID), colStar, "= 4");
                int threestar = feedbackDAO.getFeedbackCountConditon(Integer.parseInt(productID), colStar, "= 3");
                int twostar = feedbackDAO.getFeedbackCountConditon(Integer.parseInt(productID), colStar, "= 2");
                int onestar = feedbackDAO.getFeedbackCountConditon(Integer.parseInt(productID), colStar, "=1");
                int comment = feedbackDAO.getFeedbackCountConditon(Integer.parseInt(productID), "datalength(detail)!=0 and img is not null", "");
                int img = feedbackDAO.getFeedbackCountConditon(Integer.parseInt(productID), "datalength(img)!=0 and img is not null", "");

                List<ProductWithRate> favouritedList = dao.getFovouritedProduct(12);

                //
                request.setAttribute("favouritedList", favouritedList);

                request.setAttribute("feedbacklist", list);
                request.setAttribute("totalfeedback", totalfeedback);
                request.setAttribute("comment", comment);
                request.setAttribute("feedback_has_img", comment);
                request.setAttribute("fivestar", fivestar);
                request.setAttribute("fourstar", fourstar);
                request.setAttribute("threestar", threestar);
                request.setAttribute("twostar", twostar);
                request.setAttribute("onestar", onestar);
                request.setAttribute("curPage", curPage);
                request.setAttribute("limit", limit);
                //feedback                 
                request.setAttribute("shopaccount", acc);
                request.setAttribute("shopaddress", address);
                request.setAttribute("ratingofshop", feedbackDAO.getRatingOfShop(product.getShop().getShopID()));
                request.setAttribute("evaluateofshop", feedbackDAO.getFeedbackCountOfShop(product.getShop().getShopID()));
                request.setAttribute("totalproductofshop", dao.getProductCount("", "", "" + product.getShop().getShopID()));
                request.setAttribute("productdetail", product);

                request.getRequestDispatcher("productdetail_ver2.jsp").forward(request, response);
            } else {
                response.sendRedirect("err.html");
            }
            //        } else if ("sugesstion".equals(action)) {
            //            String category = request.getParameter("category");
            //            ProductDAO dao = new ProductDAO();
            //            int suggestionProduct = 15;
            //            int productPerPage = 3;

        } else if ("pagingshopproductlist".equals(action)) {
            ProductDAO dao = new ProductDAO();
            String search = request.getParameter("search");
            String colunm = request.getParameter("colSort");
            String category = request.getParameter("category");
            String shopID = request.getParameter("shopID");
            String colSort;
            String colSortPresent;
            try {
                switch (colunm) {
                    case "new":
                        colSort = "dateIn";
                        colSortPresent = "Newest Product";
                        break;
                    case "priceasc":
                        colSort = "priceOut*pSale asc";
                        colSortPresent = "Price: Low to High";
                        break;
                    case "pricedesc":
                        colSort = "priceOut*pSale desc";
                        colSortPresent = "Price: High to Low";
                        break;
                    default:
                        colSort = "rating";
                        colSortPresent = "Favorite Product";
                        break;
                }
            } catch (Exception e) {
                colSort = "rating";
                colSortPresent = "Favorite Product";
            }

            if (search == null) {
                search = "";
            }
            if (category == null) {
                category = "";
            }

            int totalProduct = dao.getProductCount(search, category, shopID);
            int productPerPage = 3;
            int numPage = (int) Math.ceil((double) totalProduct / (double) productPerPage);
            int curPage;
            try {
                curPage = Integer.parseInt(request.getParameter("curPage"));
            } catch (Exception e) {
                curPage = 1;
            }
            List<Product> shopProductList = dao.getShopProductListByPage(shopID, search,
                    productPerPage, curPage, colSort, category);

            ShopDAO shopdao = new ShopDAO();
            Shop shop = shopdao.getShop(shopID);
            ShopAddress address = shopdao.getShopAddress(shop.getAddressID());

            FeedbackDAO feedbackDAO = new FeedbackDAO();

            request.setAttribute("ratingofshop", feedbackDAO.getRatingOfShop(Integer.parseInt(shopID)));
            request.setAttribute("evaluateofshop", feedbackDAO.getFeedbackCountOfShop(Integer.parseInt(shopID)));
            request.setAttribute("totalproductofshop", dao.getProductCount("", "", "" + shopID));

            Account acc = shopdao.getShopAccount(Integer.parseInt(shopID));
            //join time
            long join = Utils.countTime(Utils.toDate(acc.getRegisDate()), new java.util.Date());
            if (join > 30) {
                join = join / 30;
                request.setAttribute("joinmonth", join);
            } else {
                request.setAttribute("joinday", join);
            }

            request.setAttribute("search", search);
            request.setAttribute("avatar", acc.getAvatar());
            request.setAttribute("colSortPresent", colSortPresent);

            //address
            request.setAttribute("shopaddress", address);
            //Shop
            request.setAttribute("shop", shop);
            //List of suggested product
            request.setAttribute("shopProductList", shopProductList);
            //total page
            request.setAttribute("totalpage", numPage);
            //current page
            request.setAttribute("currentpage", curPage);
            request.getRequestDispatcher("shophomepage.jsp")
                    .forward(request, response);

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
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (ParseException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
