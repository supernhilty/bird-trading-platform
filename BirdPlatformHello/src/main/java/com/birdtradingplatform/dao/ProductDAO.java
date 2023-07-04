/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.birdtradingplatform.model.OrderDetail;
import com.birdtradingplatform.model.ProductWithRate;
import com.birdtradingplatform.model.Shop;
import com.birdtradingplatform.utils.DBHelper;

/**
 *
 * @author Minh Quan
 */
public class ProductDAO {

    private List<Product> productList;

    public List<Product> getProductList() {
        return productList;
    }

     public List<Product> getNewItemsList(int limit, int curPage) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * "
                        + " from [Product]"
                        + " order by dateIn desc offset " + limit * (curPage - 1) + " rows "
                        + " fetch next ? rows only ";

                pstm = con.prepareStatement(sql);
                pstm.setInt(1, limit);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    double priceIn = rs.getDouble("priceIn");
                    String category = rs.getString("category");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    String img = rs.getString("img");
                    String rating = rs.getString("rating");
                    double priceOut = rs.getDouble("priceOut");
                    double pSale = rs.getDouble("pSale");
                    list.add(new Product(productID, productName, priceIn, category, quantity, description, status, img, rating, null, priceOut, pSale, ""));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
     
     
     
    public List<Product> getBestSellerList(int limit, int curPage) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select [OrderDetail].productID, productName, category, img, rating, priceOut, pSale, count([OrderDetail].productID) as seller"
                        + " from [Product] left join [OrderDetail] "
                        + " on [Product].productID = [OrderDetail].productID "
                        + " group by [OrderDetail].productID, productName, category, img, rating, priceOut, pSale,[OrderDetail].productID"
                        + " order by seller desc"
                        + " offset "+ limit * (curPage - 1)+" rows "
                        + " fetch next ? rows only";

                pstm = con.prepareStatement(sql);
                pstm.setInt(1, limit);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String category = rs.getString("category");
                    String img = rs.getString("img");
                    String rating = rs.getString("rating");
                    double priceOut = rs.getDouble("priceOut");
                    double pSale = rs.getDouble("pSale");
                    list.add(new Product(productID, productName, 0, category, 0, "", "", img, rating, null, priceOut, pSale, ""));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    
    public List<Product> getProductByName(String name) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;
        ArrayList<Product> products = new ArrayList<>();
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * From Product WHERE productName like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                    while (rs.next()) {
                        int productID = rs.getInt("productID");
                        String productName = rs.getString("productName");
                        float priceIn = rs.getFloat("priceIn");
                        String type = rs.getString("type");
                        String category = rs.getString("category");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        String status = rs.getString("status");
                        String img = rs.getString("img");
                        String sku = rs.getString("sku");
                        int shopID = rs.getInt("shopID");
                        float priceOut = rs.getFloat("priceOut");
                        float pSale = rs.getFloat("pSale");

                        result = new Product(productID, productName, priceIn, type, category, quantity, description, status, img, sku, null, priceOut, pSale, "");
                        products.add(result);
                }
            }
        } catch (Exception e) {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return products;
    }
    
     public ArrayList<Product> getProductByShopID(Shop shop) throws ClassNotFoundException, SQLException{
        ArrayList<Product> products = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;
        
        con = DBHelper.makeConnection();
        if (con != null) {
            try {
                String  sql = "SELECT [productID],[productName],[priceIn],[category],[quantity],[description],[status],[img],[rating],[priceOut],[pSale]"
                             + "FROM [BirdPlatform].[dbo].[Product]"
                            + " WHERE shopID = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, shop.getShopID());
                rs = stm.executeQuery();
                while (rs.next()) {                    
                  int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    float priceIn = rs.getFloat("priceIn");
                    String type = "";
                    String category = rs.getString("category");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    String img = rs.getString("img");
                    String rating = rs.getString("rating");
                    float priceOut = rs.getFloat("priceOut");
                    float pSale = rs.getFloat("pSale");
                    result = new Product(productID, productName, priceIn, type, category, quantity, description, status, img, rating, shop, priceOut, pSale, status);
                    products.add(result);
                }
            } finally {
               if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            } 
            }
        }
        return products;        
    }
     
      public ArrayList<Product> getProductBySearchFunction(String searchValue, String field, String order) throws ClassNotFoundException, SQLException{
        ArrayList<Product> products = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;
        
          System.out.println("feil nè" + field);
        con = DBHelper.makeConnection();
        if (con != null) {
            try {
                String  sql = "select * from product,Shop,account,[address] "
                        + " where Shop.shopID = Product.shopID and "
                        + " shop.addressID = [address].addressID "
                        + " and account.accountID =shop.accountID and " + field + " like  ?  " + order;
                System.out.println("sql:" +sql);
                stm = con.prepareStatement(sql);
                 stm.setString(1,"%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    products.add(new Product(rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            "",
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            new Shop(rs.getInt("shopID"),
                                    rs.getString("shopName"),
                                    rs.getDouble("rate"),
                                    rs.getString("rate"),
                                    rs.getInt("accountID"),
                                    rs.getInt("addressID")),
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), ""));
                    
                    }
            } finally {
               if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            } 
            }
        }
        return products;        
    }
     
     
    public ArrayList<Product> printProductList() throws ClassNotFoundException, SQLException {
        ArrayList suggestedList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = " select * from product,Shop,account "
                        + "where Shop.shopID = Product.shopID "
                        + "and account.accountID =shop.accountID";
                pstm = con.prepareStatement(sql);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    suggestedList.add(new Product(rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            "",
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            new Shop(rs.getInt("shopID"),
                                    rs.getString("shopName"),
                                    rs.getDouble("rate"),
                                    rs.getString("contact"),
                                    rs.getInt("accountID"),
                                    rs.getInt("addressID")),
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), ""));
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return suggestedList;
    }

    public void searchProduct(List<OrderDetail> orderDetailsList) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * From Product WHERE productID = ?";
                stm = con.prepareStatement(sql);
                for (OrderDetail orderDetail : orderDetailsList) {
                    stm.setInt(1, orderDetail.getProductID());
                    rs = stm.executeQuery();

                    while (rs.next()) {

                        int productID = rs.getInt("productID");
                        String productName = rs.getString("productName");
                        float priceIn = rs.getFloat("priceIn");
                        String type = "";
                        String category = rs.getString("category");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        String status = rs.getString("status");
                        String img = rs.getString("img");
                        String rating = rs.getString("rating");
                        int shopID = rs.getInt("shopID");
                        float priceOut = rs.getFloat("priceOut");
                        float pSale = rs.getFloat("pSale");

                        result = new Product(productID, productName, priceIn, type, category, quantity, description, status, img, rating, null, priceOut, pSale, "");
                        if (this.productList == null) {
                            productList = new ArrayList<>();
                        }
                        this.productList.add(result);
                    }
                }
            }
        } catch (Exception e) {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public Product getProduct(String id) throws SQLException {
        Product product = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "select *"
                        + " from [Product] left join [Shop] on "
                        + "product.shopID = shop.shopID where productID = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, id);

                rs = pstm.executeQuery();
                if (rs.next()) {

                    product = new Product(rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            "",
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            new Shop(rs.getInt("shopID"),
                                    rs.getString("shopName"),
                                    //rs.getString("avatar"),
                                    //"",
                                    rs.getDouble("rate"),
                                    rs.getString("contact"),
                                    rs.getInt("accountID"),
                                    rs.getInt("addressID")),
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), "");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }

    public List<Product> getSuggestion(String relation, int limit, int page) throws SQLException {
        List<Product> suggestedList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select *"
                        + " from [Product] left join [Shop] on "
                        + " product.shopID = shop.shopID where category = ?"
                        + " order by rate " + " offset " + (page - 1) * limit + " rows "
                        + " fetch next ? rows only";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, relation);
                pstm.setInt(2, limit);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    suggestedList.add(new Product(rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            "",
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            new Shop(rs.getInt("shopID"),
                                    rs.getString("shopName"),
                                    rs.getDouble("rate"),
                                    rs.getString("contact"),
                                    rs.getInt("accountID"),
                                    rs.getInt("addressID")),
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), ""));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return suggestedList;
    }

    public ArrayList getSaleList() throws SQLException {
        ArrayList suggestedList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = " select * from product,Shop,account "
                        + "where pSale< 1 and Shop.shopID = Product.shopID "
                        + "and account.accountID =shop.accountID";
                pstm = con.prepareStatement(sql);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    suggestedList.add(new Product(rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            "",
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            new Shop(rs.getInt("shopID"),
                                    rs.getString("shopName"),
                                    rs.getDouble("rate"),
                                    rs.getString("contact"),
                                    rs.getInt("accountID"),
                                    rs.getInt("addressID")),
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), ""));
                    
                    System.out.println(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return suggestedList;
    }

    public int getProductCount(String search) throws SQLException {

        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "select count(*) as total "
                        + " from [Product] where (productName like ? or description like ? ) or category = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, "%" + search + "%");
                pstm.setString(2, "%" + search + "%");
                pstm.setString(3, search);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public List<ProductWithRate> getShopProductListByPage(String search, int productPerPage, int curPage, String colSort, String category, String sortType) throws SQLException {
        List<ProductWithRate> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "select *, pRate.star"
                        + " from [Product] left join ProductRate() as pRate "
                        + " on Product.productID = pRate.productID"
                        + " where (category = ? and (productName like ? or description like ?)"
                        + " order by " + colSort + " " + sortType
                        + " offset " + (curPage - 1) * productPerPage + " rows "
                        + " fetch next ? rows only; ";

                pstm = conn.prepareStatement(sql);
                pstm.setString(1, "%" + search + "%");
                pstm.setString(2, "%" + search + "%");
                pstm.setString(3, search);
                pstm.setInt(4, productPerPage);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    productList.add(new ProductWithRate(rs.getInt("star"), rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            "",
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            null,
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), ""));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return productList;
    }

    public boolean deleteProduct(Product product) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE Product "
                        + "SET status = 'NOT AVAILABLE' "
                        + "WHERE productID like ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, product.getProductID());
                row = stm.executeUpdate();
                if (row > 1) {
                    return true;
                }
            }
        } finally {
             if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    
    public boolean deleteProductByID(int ID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "delete from product where productID like ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, ID);
                row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
             if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    
    public int getProductCount(String search, String category, String shopID) throws SQLException {

        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int total = 0;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql;
                if (category == null || category.isEmpty()) {
                    sql = "select count(*) as total "
                            + " from [Product] where (productName like ? or description like ? ) and shopID = ?";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, "%" + search + "%");
                    pstm.setString(2, "%" + search + "%");
                    pstm.setString(3, shopID);
                } else {
                    sql = "select count(*) as total "
                            + " from [Product] where (productName like ? or description like ? ) and category = ? and shopID = ?";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, "%" + search + "%");
                    pstm.setString(2, "%" + search + "%");
                    pstm.setString(3, category);
                    pstm.setString(4, shopID);
                }

                rs = pstm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return total;
    }
    
    
    
    public boolean addProduct(Product product, int ShopID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, product.getProductName());
                stm.setDouble(2,  product.getPriceIn());
                stm.setString(3,  product.getType());
                stm.setString(4,  product.getCategory());
                stm.setInt(5,  product.getQuantity());
                stm.setString(6,  product.getDescription());
                stm.setString(7,  product.getStatus());
                stm.setString(8,  product.getImg());
                System.out.println("Product dao " +product.getImg());
                stm.setString(9,  product.getRating());
                stm.setInt(10,  ShopID);
                stm.setDouble(11,  product.getPriceOut());
                stm.setDouble(12,  product.getpSale());
                stm.setString(13,  product.getDateIn());
                
                row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
             if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    
    
    public boolean UpdateProduct(Product product, int shopID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update product  set productname = ?, pricein = ?,  "
                        + " quantity = ?,category = ?, description = ?, [status] = ?,img = ?, shopID = ?,priceout = ?,pSale = ? "
                        + "where productid =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, product.getProductName());
                stm.setDouble(2,  product.getPriceIn());//
              //  stm.setString(3,  product.getType());//
                stm.setInt(3,  product.getQuantity());//
                stm.setString(4,  product.getCategory());
                
                stm.setString(5,  product.getDescription());
                stm.setString(6,  product.getStatus());
                stm.setString(7,  product.getImg());
                stm.setInt(8,shopID);
                stm.setDouble(9,  product.getPriceOut());
                stm.setDouble(10,  product.getpSale());
                stm.setDouble(11,  product.getProductID());
                
                row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
             if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    
    
    
    
    
    
    public List<ProductWithRate> getShopProductListByPage(String shopID, String search, int productPerPage, int curPage, String colSort, String category, String sortType) throws SQLException {
        List<ProductWithRate> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql;
                if (category == null || category.isEmpty()) {
                    sql = "select *, pRate.star"
                            + " from [Product] left join ProductRate() as pRate "
                            + " on Product.productID = pRate.productID"
                            + " where (productName like ? or description like ?)"
                            + " order by " + colSort + " " + sortType
                            + " offset " + (curPage - 1) * productPerPage + " rows "
                            + " fetch next ? rows only; ";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, "%" + search + "%");
                    pstm.setString(2, "%" + search + "%");

                    pstm.setInt(3, productPerPage);
                } else {
                    sql = "select *, pRate.star"
                            + " from [Product] left join ProductRate() as pRate "
                            + " on Product.productID = pRate.productID"
                            + " where (category = ? and (productName like ? or description like ?)"
                            + " order by " + colSort + " " + sortType
                            + " offset " + (curPage - 1) * productPerPage + " rows "
                            + " fetch next ? rows only; ";

                    pstm.setString(1, search);
                    pstm.setString(2, "%" + search + "%");
                    pstm.setString(3, "%" + search + "%");
                    pstm.setInt(4, productPerPage);
                }

                rs = pstm.executeQuery();
                while (rs.next()) {
                    productList.add(new ProductWithRate(rs.getInt("star"), rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            "",
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            null,
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), ""));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return productList;
    }

    
    
    //suggestion top favourited product
    public List<ProductWithRate> getFovouritedProduct(int nummberOfProduct) throws SQLException {
        List<ProductWithRate> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select top 12 * "
                        + " from [Product] left join ProductRate() as pRate"
                        + " on Product.productID = pRate.productID"
                        + " order by pRate.star desc";
              
                pstm = con.prepareStatement(sql);
//                pstm.setInt(1, nummberOfProduct);
               // pstm.setInt(1, shopID);

                rs = pstm.executeQuery();
               while (rs.next()) {
                    int star = rs.getInt("star");
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    double priceIn = rs.getDouble("priceIn");
                    String category = rs.getString("category");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    String img = rs.getString("img");
                    String rating = rs.getString("rating");
                    double priceOut = rs.getDouble("priceOut");
                    double pSale = rs.getDouble("pSale");
                     list.add(new ProductWithRate(star, productID, productName, priceIn, category, quantity, description, status, img, rating, null, priceOut, pSale, ""));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        ProductDAO aO = new ProductDAO();
        Shop shop = new Shop(1, null, 0, null, 0, 0);
        List<Product> products = aO.getProductByShopID(shop);
        System.out.println(products.size());
    }

  public List<Product> getShopProductListByPage(String shopID, String search, int productPerPage, int curPage, String colSort, String category) throws SQLException {
        List<Product> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql;
                if (category.isEmpty()) {
                    sql = "select * from Product "
                            + " where shopID =? and (productName  like ? or description like ?) "
                            + " order by  " + colSort
                            + " offset " + (curPage - 1) * productPerPage + "  rows  "
                            + " fetch next ? rows only";

                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, shopID);
                    pstm.setString(2, "%" + search + "%");
                    pstm.setString(3, "%" + search + "%");
                    pstm.setInt(4, productPerPage);
                } else {
                    sql = "select * from Product "
                            + " where shopID =? and category = ? and (productName  like ? or description like ?) "
                            + " order by  " + colSort
                            + " offset " + (curPage - 1) * productPerPage + "  rows  "
                            + " fetch next ? rows only";

                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, shopID);
                    pstm.setString(2, category);
                    pstm.setString(3, "%" + search + "%");
                    pstm.setString(4, "%" + search + "%");
                    pstm.setInt(5, productPerPage);
                }

                rs = pstm.executeQuery();
                while (rs.next()) {
                    productList.add(new Product(rs.getInt("productID"),
                            rs.getString("productName"),
                            rs.getDouble("priceIn"),
                            rs.getString("type"),
                            rs.getString("category"),
                            rs.getInt("quantity"),
                            rs.getString("description"),
                            rs.getString("status"),
                            rs.getString("img"),
                            rs.getString("rating"),
                            null,
                            rs.getDouble("priceOut"),
                            rs.getDouble("pSale"), ""));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return productList;
    }
}



