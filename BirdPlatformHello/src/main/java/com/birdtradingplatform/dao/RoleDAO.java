/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.birdtradingplatform.dao.AccountDAO;

import com.birdtradingplatform.utils.DBHelper;

/**
 *
 * @author Minh Quan
 */
public class RoleDAO {

    private ArrayList<Role> roles;

    /**
     * @return the roles
     */
    public ArrayList<Role> getRoles() {
        return roles;
    }

    public List<Role> getRoleList(List<Account> accounts) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Role> list = new ArrayList<>();
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM ROLE WHERE role = ?";
                stm = con.prepareStatement(sql);
                for (Account account : accounts) {
                    stm.setInt(1, account.getRole());
                    rs = stm.executeQuery();
                    
                    while (rs.next()) {                        
                    int role = rs.getInt("role");
                    String roleName = rs.getString("roleName");
                    Role result = new Role(role, roleName);
                    roles.add(result);                
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
        return list;
    }

    public int getRole(String name) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int role = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM ROLE WHERE roleName = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                rs = stm.executeQuery();

                while (rs.next()) {
                    role = rs.getInt("role");
                    String roleName = rs.getString("roleName");
                    Role result = new Role(role, roleName);
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
        return role;
    }

    public ArrayList<Role> getAllRoles(List<Account> userList) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM ROLE";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int role = rs.getInt("role");
                    String roleName = rs.getString("roleName");
                    Role result = new Role(role, roleName);
                    if (this.roles == null) {
                        this.roles = new ArrayList<>();
                    }
                    this.roles.add(result);
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
        return this.roles;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        AccountDAO dao = new AccountDAO();
    }
}
