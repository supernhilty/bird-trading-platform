/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Address;
import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class AddressDAO {
 
    public int InertAddressReturnID(Address dto) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into [Address] values(? ,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getDetail());
                stm.setString(2, dto.getDistrict());
                stm.setString(3, dto.getProvice());
                
                int row = stm.executeUpdate();
                
                
                if (row>0) {
                    String sqlMore = "select max(AddressID) as ID from [Address]";
                    stm = con.prepareStatement(sqlMore);
                    rs = stm.executeQuery();
                    if(rs.next()){
                        result = rs.getInt("ID");
                    }
                    
                    
                }
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
        return result;
    }
    
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        AddressDAO dao = new AddressDAO();
        System.out.println(dao.InertAddressReturnID(new Address()) );
    }
}
    
    

