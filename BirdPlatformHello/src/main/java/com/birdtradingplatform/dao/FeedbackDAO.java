/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Feedback;
import com.birdtradingplatform.model.FeedbackDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.birdtradingplatform.utils.DBHelper;

/**
 *
 * @author leyen
 */
public class FeedbackDAO {

    public int getFeedbackCountOfShop(int shopID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(feedbackID) as total "
                        + "from [Feedback] left join [Product] "
                        + "on [Feedback].productID = [Product].productID "
                        + "left join [Shop] "
                        + "on [Product].shopID=[Shop].shopID "
                        + "where [Shop].shopID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("total");
                }
            }
        } catch (Exception e) {
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
        return count;
    }

    public int getFeedbackCountConditon(int productID, String colCondition, String valueCondition) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(feedbackID) as total from [Feedback] where productID = ? and " + colCondition + " " + valueCondition;
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("total");
                }
            }
        } catch (Exception e) {
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
        return count;
    }

    public int getFeedbackCount(int productID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(feedbackID) as total from [Feedback] where productID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("total");
                }
            }
        } catch (Exception e) {
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
        return count;
    }

    public double getFeedbackStar(int productID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        double star = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select avg(star) as staravg from [Feedback] where productID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    star = rs.getDouble("staravg");
                }
            }
        } catch (Exception e) {
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
        return star;
    }

    public double getRatingOfShop(int shopID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        double star = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select avg(star) as rating "
                        + "from [Feedback] "
                        + "left join [Product] "
                        + "on [Feedback].productID = [Product].productID "
                        + "left join [Shop] "
                        + "on [Product].shopID=[Shop].shopID "
                        + "where [Shop].shopID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    star = rs.getDouble("rating");
                }
            }
        } catch (Exception e) {
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
        return star;
    }

    public List<FeedbackDetail> getFeedbackDetailListPaging(int productID, int curPag, int limit) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<FeedbackDetail> list = new ArrayList<>();
        int offset = (curPag - 1) * limit;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [Feedback] "
                        + " left join [Account] "
                        + " on [Feedback].accID=[Account].accountID"
                        + " where productID = ? order by publishedDate "
                        + " offset ? rows"
                        + " fetch next ? rows only";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                pstm.setInt(2, offset);
                pstm.setInt(3, limit);
                rs = pstm.executeQuery();

                while (rs.next()) {
                    list.add(new FeedbackDetail(new Account(rs.getInt("accountID"),
                            rs.getString("username"),
                            rs.getString("email"),
                            "", 0, false, rs.getString("regisDate"),
                            rs.getString("avatar")),
                            rs.getInt("feedbackID"),
                            rs.getString("img"),
                            rs.getInt("star"),
                            rs.getString("detail"),
                            rs.getInt("productID"),
                            rs.getInt("accID"),
                            rs.getString("publishedDate")));
                }
            }
        } catch (Exception e) {
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

    public int createFeedback(String img, int star, String detail, String productID, int accountID, String orderDetailID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into [Feedback](img, star, detail, productID, accID, orderDetailID) values (?,?,?,?,?,?)";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, img);
                pstm.setInt(2, star);
                pstm.setString(3, detail);
                pstm.setString(4, productID);
                pstm.setInt(5, accountID);
                pstm.setString(6, orderDetailID);
                row = pstm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {

            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return row;
    }

    public boolean hasFeedbacked(int accountID, int productID, int orderDetailID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [Feedback] where orderDetailID= ? and ([productID] = ? and [accID] = ?)";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, orderDetailID);
                pstm.setInt(2, productID);
                pstm.setInt(3, accountID);
               rs = pstm.executeQuery();
                if(rs.next()){
                    check = true;
                }
            }
        } catch (Exception e) {
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
        return check;
    }

}
