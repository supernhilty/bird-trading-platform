/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.model;

import java.sql.Date;


/**
 *
 * @author Suong Mai
 */
public class DiscountDTOMore {
    private int discountID;
    private String img;
    private float saleUP;
    private String description;
    private int shopID;
    private String shopName;
    private Date from;
    private Date to;

    public DiscountDTOMore(int discountID, String img, float saleUP, String description,
            int shopID,String shopName,Date from,Date to) {
        this.discountID = discountID;
        this.img = img;
        this.saleUP = saleUP;
        this.description = description;
        this.shopID = shopID;
        this.shopName = shopName;
        this.from = from;
        this.to = to;
    }

    public DiscountDTOMore() {
    }

    public int getDiscountID() {
        return discountID;
    }

    public String getImg() {
        return img;
    }

    public float getSaleUP() {
        return saleUP;
    }

    public String getDescription() {
        return description;
    }

    public int getShopID() {
        return shopID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setSaleUP(float saleUP) {
        this.saleUP = saleUP;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Date getFrom() {
        return from;
    }

    public Date getTo() {
        return to;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public void setTo(Date to) {
        this.to = to;
    }
    
    
    
}
