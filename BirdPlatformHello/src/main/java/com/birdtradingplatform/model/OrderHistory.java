/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class OrderHistory extends Order {

    private AddressShipment address;

    public OrderHistory(AddressShipment address, int orderID, String orderDate, double total, int paymentID, int customerID, int addressShipID, String shipDate, String status) {
        super(orderID, orderDate, total, paymentID, customerID, addressShipID, shipDate, status);
        this.address = address;
    }

    public OrderHistory(AddressShipment address, int orderID, String orderDate, double total, int addressShipID, String shipDate, String status, int shopID) {
        super(orderID, orderDate, total, addressShipID, shipDate, status, shopID);
        this.address = address;
    }
    public OrderHistory(AddressShipment address, int orderID, String orderDate, double total, int addressShipID, String shipDate, String status) {
        super(orderID, orderDate, total, addressShipID, shipDate, status);
        this.address = address;
    }

    public AddressShipment getAddress() {
        return address;
    }

    public void setAddress(AddressShipment address) {
        this.address = address;
    }
    
    

}
