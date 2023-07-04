/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class Order {
    private int orderID;
    private String orderDate;
    private double total;    
    private int paymentID;
    private int customerID;
    private int addressShipID;
    private String shipDate;
    private String status;
    private int shopID;
    public Order() {
    }

    public Order(int orderID, String orderDate, double total, int paymentID, int customerID, int addressShipID, String shipDate, String status) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.total = total;
        this.paymentID = paymentID;
        this.customerID = customerID;
        this.addressShipID = addressShipID;
        this.shipDate = shipDate;
        this.status = status;
    }

    public Order(int orderID, String orderDate, double total, int addressShipID, String shipDate, String status, int shopID) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.total = total;
        this.addressShipID = addressShipID;
        this.shipDate = shipDate;
        this.status = status;
        this.shopID = shopID;
    }
    public Order(int orderID, String orderDate, double total, int addressShipID, String shipDate, String status) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.total = total;
        this.addressShipID = addressShipID;
        this.shipDate = shipDate;
        this.status = status;
    }

    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
    }
    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getAddressShipID() {
        return addressShipID;
    }

    public void setAddressShipID(int addressShipID) {
        this.addressShipID = addressShipID;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
}
