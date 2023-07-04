/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class OrderDetailItem extends OrderDetail{
    Product product;

    public OrderDetailItem(Product product) {
        this.product = product;
    }

    public OrderDetailItem(Product product, int orderDetailID, int quantity, float price, int productID, float orderID) {
        super(orderDetailID, quantity, price, productID, orderID);
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    
}
