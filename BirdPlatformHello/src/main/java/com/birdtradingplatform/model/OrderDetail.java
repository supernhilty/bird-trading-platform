/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author Minh Quan
 */
public class OrderDetail {
    private int orderDetailID;
    private int quantity;
    private float price;
    private int productID;
    private float orderID;

    public OrderDetail() {
    }

    
    
    public OrderDetail(int orderDetailID, int quantity, float price, int productID, float orderID) {
        this.orderDetailID = orderDetailID;
        this.quantity = quantity;
        this.price = price;
        this.productID = productID;
        this.orderID = orderID;
    }

    /**
     * @return the orderDetailID
     */
    public int getOrderDetailID() {
        return orderDetailID;
    }

    /**
     * @param orderDetailID the orderDetailID to set
     */
    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the productID
     */
    public int getProductID() {
        return productID;
    }

    /**
     * @param productID the productID to set
     */
    public void setProductID(int productID) {
        this.productID = productID;
    }

    /**
     * @return the orderID
     */
    public float getOrderID() {
        return orderID;
    }

    /**
     * @param orderID the orderID to set
     */
    public void setOrderID(float orderID) {
        this.orderID = orderID;
    }

    
    
    
}
