/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class ProductWithRate extends Product{
    private double star;

    public ProductWithRate(double star, int productID, String productName, double priceIn, String type, String category, int quantity, String description, String status, String img, String sku, Shop shop, double priceOut, double pSale, String dateIn) {
        super(productID, productName, priceIn, type, category, quantity, description, status, img, sku, shop, priceOut, pSale, dateIn);
        this.star = star;
    }
    public ProductWithRate(double star, int productID, String productName, double priceIn, String category, int quantity, String description, String status, String img, String sku, Shop shop, double priceOut, double pSale, String dateIn) {
        super(productID, productName, priceIn, category, quantity, description, status, img, sku, shop, priceOut, pSale, dateIn);
        this.star = star;
    }

    public double getStar() {
        return star;
    }

    public void setStar(double star) {
        this.star = star;
    }
    
}
