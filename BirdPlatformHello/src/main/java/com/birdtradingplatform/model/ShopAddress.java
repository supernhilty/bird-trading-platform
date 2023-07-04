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
public class ShopAddress {
    private int addressID;
    private String detail;
    private String district;
    private String provice;

    public ShopAddress() {
    }

    public ShopAddress(int addressID, String detail, String district, String provice) {
        this.addressID = addressID;
        this.detail = detail;
        this.district = district;
        this.provice = provice;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvice() {
        return provice;
    }

    public void setProvice(String provice) {
        this.provice = provice;
    }

    @Override
    public String toString() {
        return "ShopAddress{" + "addressID=" + addressID + ", detail=" + detail + ", district=" + district + ", provice=" + provice + '}';
    }
    
    
}
