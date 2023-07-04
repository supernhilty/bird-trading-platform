/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Minh Quan
 */
public class AddressShipmentDAO {

    public AddressShipment getAddressShipmentByID(int id) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AddressShipment result = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdPlatform].[dbo].[AddressShipment] "
                        + " WHERE addressShipID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();

                if (rs.next()) {
                    int addressShipID = rs.getInt("addressShipID");
                    String phoneShipment = rs.getString("phoneShipment");
                    String detail = rs.getString("detail");
                    String district = rs.getString("district");
                    String province = rs.getString("province");
                    int customerID = rs.getInt("customerID");

                    result = new AddressShipment(addressShipID, phoneShipment, detail, district, province, customerID);

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

    public int addAddressShip(String phone, String detail, String district, String province, int customerID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into [AddressShipment](phoneShipment, detail, district, province, customerID) values (?,?,?,?,?)";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, phone);
                pstm.setString(2, detail);
                pstm.setString(3, district);
                pstm.setString(4, province);
                pstm.setInt(5, customerID);
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

    public int deleteAddressShip(String addressShipID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "delete from [AddressShipment] where addressShipID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, addressShipID);

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
}
