/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.model;

/**
 *
 * @author Admin
 */
public class Customer {
    
    private int customerID;
    private String phonenumber;
    private int point;
    private int accountID;

    public Customer(int customerID, String Phonenumber, int point, int accountID) {
        this.customerID = customerID;
        this.phonenumber = Phonenumber;
        this.point = point;
        this.accountID = accountID;
    }

    public Customer() {
    }

    public int getCustomerID() {
        return customerID;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public int getPoint() {
        return point;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setPhonenumber(String Phonenumber) {
        this.phonenumber = Phonenumber;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }
    
    
    
    
}
