/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.model.Customer;
import com.birdtradingplatform.model.OrderDetail;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CustomerDAO implements Serializable{
    
    public Boolean Insert_new_into_Customer(Customer dto )
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        Boolean sucess = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "insert into Customer(phoneNumber,point,accountID) " +
                                "values (?,0,?);";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getPhonenumber());
                stm.setInt(2, dto.getAccountID());
                //4.excute stm
                int row  = stm.executeUpdate();
                //5.process result 
                if (row > 0) {
                    sucess =true;
                }
            } else {

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return sucess;
    }
    
    public Boolean UpdatePhoneNumber(int accountID, String PhoneNumber)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "update Customer set phoneNumber = ? "
                        + " where accountID = ? ";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, PhoneNumber);
                stm.setInt(2, accountID);

                //4.excute stm
                int row = stm.executeUpdate();
                //5.process result 
                if (row != 0) {
                    result = true;
                }
            } else {

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }
    
    
    public Customer getCustomerByAccountID(int accountID)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Customer result = null;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select * from Customer where accountID = ? ";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setInt(1, accountID);

                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                if (rs.next()) {
                    int ID = rs.getInt("customerID");
                    String phone = rs.getString("phoneNumber");
                    int point = rs.getInt("point");
                    int AccID = rs.getInt("accountID");
                    result = new Customer(ID, phone, point, accountID);
                }
            } else {

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }
    
     public AddressShipment getAddressShip(int account) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        AddressShipment shipTo = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [AddressShipment] "
                        + "left join [Customer] "
                        + "on [AddressShipment].customerID=[Customer].customerID "
                        + "left join [Account] "
                        + "on [Customer].accountID = [Account].accountID "
                        + "where Account.accountID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, account);
                rs = pstm.executeQuery();

                if (rs.next()) {
                    String phoneShipment = rs.getString("phoneShipment");
                    int addressShipID = rs.getInt("addressShipID");
                    String detail = rs.getString("detail");
                    String district = rs.getString("district");
                    String province = rs.getString("province");
                    int customerID = rs.getInt("customerID");
                    shipTo = new AddressShipment(addressShipID, phoneShipment, detail, district, province, customerID);
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
        return shipTo;
    }
    
    public List<AddressShipment> getAddressShipmentByCusID(int cusID) throws SQLException{
         Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<AddressShipment> list = new ArrayList<>();
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [AddressShipment] where customerID = ? order by addressShipID desc";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, cusID);
                rs = pstm.executeQuery();

                while (rs.next()) {
                    String phoneShipment = rs.getString("phoneShipment");
                    int addressShipID = rs.getInt("addressShipID");
                    String detail = rs.getString("detail");
                    String district = rs.getString("district");
                    String province = rs.getString("province");
                    int customerID = rs.getInt("customerID");
                    list.add(new AddressShipment(addressShipID, phoneShipment, detail, district, province, customerID)) ;
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
    public AddressShipment getAddressShipmentByID(int ID) throws SQLException{
         Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        AddressShipment shipTo = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [AddressShipment] where addressShipID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, ID);
                rs = pstm.executeQuery();

                if (rs.next()) {
                    String phoneShipment = rs.getString("phoneShipment");
                    int addressShipID = rs.getInt("addressShipID");
                    String detail = rs.getString("detail");
                    String district = rs.getString("district");
                    String province = rs.getString("province");
                    int customerID = rs.getInt("customerID");
                    shipTo = new AddressShipment(addressShipID, phoneShipment, detail, district, province, customerID);
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
        return shipTo;
    }
    public static void main(String[] args) throws SQLException {
        CustomerDAO dao = new CustomerDAO();
      List<AddressShipment> customers = dao.getAddressShipmentByCusID(2);
        System.out.println(customers.size());
    }
       
    
}
