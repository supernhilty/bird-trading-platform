/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.DiscountDTOMore;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author Suong Mai
 */
public class DiscountDAO {

    private ArrayList<DiscountDTOMore> listDiscount;

    public DiscountDAO(ArrayList<DiscountDTOMore> listDiscount) {
        this.listDiscount = listDiscount;
    }

    public ArrayList<DiscountDTOMore> getListDiscount() {
        return listDiscount;
    }

    public DiscountDAO() {
    }
    

    public void GetDiscountDTOListTOJSP()
            throws ClassNotFoundException, SQLException, NamingException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select discountID,img,saleUp,description,Discount.shopID, shopName, DayFrom, DayTo "+
                    "from Discount, Shop " +
                    "where Discount.shopID = Shop.shopID";
                //3. create stm
                stm = con.prepareStatement(sql);
                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                while (rs.next()) {
                    int accountID = rs.getInt("discountID");
                    String img = rs.getString("img");
                    Float saleUp = rs.getFloat("saleUp");
                    String des = rs.getString("description");
                    int shopID = rs.getInt("shopID");
                    String shopname = rs.getString("shopName");
                    Date from = rs.getDate("DayFrom");
                    Date to = rs.getDate("DayTo");
                    DiscountDTOMore dto = new DiscountDTOMore(accountID, img, saleUp, des, shopID, shopname, from, to);
                    if (this.listDiscount == null) {
                        this.listDiscount = new ArrayList<>();
                    }
                    this.listDiscount.add(dto);
                }
            } else {

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
}
