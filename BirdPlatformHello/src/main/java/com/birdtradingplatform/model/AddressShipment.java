/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class AddressShipment {
    private int addressShipID;
    private String phoneShipment;
    private String detail;
    private String district;
    private String province;
    private int customerID;

    public AddressShipment() {
    }

    public AddressShipment(int addressShipID, String phoneShipment, String detail, String district, String province, int customerID) {
        this.addressShipID = addressShipID;
        this.phoneShipment = phoneShipment;
        this.detail = detail;
        this.district = district;
        this.province = province;
        this.customerID = customerID;
    }

    public int getAddressShipID() {
        return addressShipID;
    }

    public void setAddressShipID(int addressShipID) {
        this.addressShipID = addressShipID;
    }

    public String getPhoneShipment() {
        return phoneShipment;
    }

    public void setPhoneShipment(String phoneShipment) {
        this.phoneShipment = phoneShipment;
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

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

   
    
}
