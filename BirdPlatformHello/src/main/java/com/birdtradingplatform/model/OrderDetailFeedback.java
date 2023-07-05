/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class OrderDetailFeedback extends OrderDetailItem{
    private boolean hasFeedbacked;

    public OrderDetailFeedback(boolean hasFeedbacked, Product product) {
        super(product);
        this.hasFeedbacked = hasFeedbacked;
    }
    

    public OrderDetailFeedback(boolean hasFeedbacked, Product product, int orderDetailID, int quantity, float price, int productID, float orderID) {
        super(product, orderDetailID, quantity, price, productID, orderID);
        this.hasFeedbacked = hasFeedbacked;
    }
    
     
    public boolean isHasFeedbacked() {
        return hasFeedbacked;
    }

    public void setHasFeedbacked(boolean hasFeedbacked) {
        this.hasFeedbacked = hasFeedbacked;
    }
     
    
}
