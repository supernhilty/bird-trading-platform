/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.dao;

/**
 *
 * @author Admin
 */

import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import java.util.Random;
/**
 *
 * @author Admin
 */
public class CodeDAO {
    
    public static int generateRandomInt(int min, int max) {
        Random random = new Random();
        return random.nextInt(max - min + 1) + min;
    }
    
    public int Create_New_Code(String gmail)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        int sucess = 0;
        try {
            sucess= generateRandomInt(1000, 9999);
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "insert into ResetPass values(?,?)";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, gmail);
                stm.setInt(2,sucess);
                //4.excute stm
                int row  = stm.executeUpdate();
                //5.process result 
                if (row > 0) {
                   
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
    
    public int SelectCodeByEmail(String gmail)
            throws ClassNotFoundException, SQLException, NamingException {
        int code = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select code from ResetPass  where gmail = ?";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, gmail);
                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                if (rs.next()) {
                    code = rs.getInt("code");
                    System.out.print(code);
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
        return code;
    }
    
    public String CheckCodeAndGmail(String gmail, int code)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select code, gmail from ResetPass  "
                        + "where gmail = ?and code = ? ";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, gmail);
                stm.setInt(2, code);
                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                if (rs.next()) {
                    gmail = rs.getString("gmail");
                    System.out.print(gmail);
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
        return gmail;
    }
    
    
    
    
    public Boolean DeleteCodeByEmail(String gmail)
            throws ClassNotFoundException, SQLException, NamingException {
        int code = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Boolean ok = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "delete from ResetPass  where gmail = ?";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, gmail);
                //4.excute stm
                int row = stm.executeUpdate();
                //5.process result 
                if (row >0) {
                    ok = true;
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
        return ok;
    }
    
    
}
