/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class Shop {
    private int shopID;
    private String shopName;
    private double rate;
    private String contact;
    private int accountID;
    private int addressID;

    public Shop() {
    }

    public Shop(int shopID, String shopName, double rate, String contact, int accountID, int addressID) {
        this.shopID = shopID;
        this.shopName = shopName;
        this.rate = rate;
        this.contact = contact;
        this.accountID = accountID;
        this.addressID = addressID;
    }

    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

  

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    @Override
    public String toString() {
        return "Shop{" + "shopID=" + shopID + ", shopName=" + shopName + ", avatar="  + ", rate=" + rate + ", contact=" + contact + ", accountID=" + accountID + ", addressID=" + addressID + '}';
    }

    
}
