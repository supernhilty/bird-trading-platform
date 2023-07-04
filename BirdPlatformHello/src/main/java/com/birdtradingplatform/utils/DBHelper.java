/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Minh Quan
 */
public class DBHelper {
     public static Connection makeConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=BirdPlatform;encrypt=true;trustServerCertificate=true";
        Connection connection = DriverManager.getConnection(url, "sa", "12345");
        return connection;
    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        System.out.println(DBHelper.makeConnection());
    }
}
