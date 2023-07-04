/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author leyen
 */
public class MutilShopCart {

    private Map<Integer, Cart> mutilShopCart;

    public MutilShopCart() {
    }

    public MutilShopCart(Map<Integer, Cart> multicShopCart) {
        this.mutilShopCart = multicShopCart;
    }

//    public static List<Item> getItemlist(Cart cart) {
//        Collection<Map<Integer, Item>> item = cart.getCart().values();
//        return new ArrayList<>(Map<Integer, Item>);
//    }
//   
    public Map<Integer, Cart> getMutilShopCart() {
        return mutilShopCart;
    }

    public void setMutilShopCart(Map<Integer, Cart> mutilShopCart) {
        this.mutilShopCart = mutilShopCart;
    }

    public List<Cart> getAllCartList(MutilShopCart multicShopCart) {
        Collection<Cart> cart = multicShopCart.getMutilShopCart().values();
        return new ArrayList<>(cart);
    }

    public void addMutilShop(Item item) {
        if (this.mutilShopCart == null) {
            this.mutilShopCart = new HashMap<>();
        }
        if (this.mutilShopCart.containsKey(item.getProduct().getShop().getShopID())) {

            this.mutilShopCart.get(item.getProduct().getShop().getShopID()).add(item);

        } else {
            Cart cartput = new Cart();
            cartput.add(item);
            this.mutilShopCart.put(item.getProduct().getShop().getShopID(), cartput);
        }
    }

    public void deleteMutilShop(Product product) {
        if (this.mutilShopCart == null) {
            return;
        }
        if (this.mutilShopCart.containsKey(product.getShop().getShopID())) {
            this.mutilShopCart.get(product.getShop().getShopID()).delete(product.getProductID());
        }
        for (Map.Entry<Integer, Cart> entry : this.mutilShopCart.entrySet()) {
            Integer key = entry.getKey();
            Cart cart = entry.getValue();
            if (cart.getCart().isEmpty()) {
                mutilShopCart.remove(key);
            }
        }
    }

    public void updateMutilShop(Product product, Item newItem) {
        if (this.mutilShopCart == null) {
            return;
        }
        if (this.mutilShopCart.containsKey(product.getShop().getShopID())) {
            this.mutilShopCart.get(product.getShop().getShopID()).update(product.getProductID(), newItem);

        }
    }

    //private Item getItembyID() -> getQuantityByID
    public double getTotalMoneyAllShop() {
        double total = 0;
        for (Map.Entry<Integer, Cart> entry : mutilShopCart.entrySet()) {
            Integer key = entry.getKey();
            Cart cart = entry.getValue();
            total += cart.getTotalMoney();

        }
        return total;
    }

    public double getTotalCountAllShop() {
        int total = 0;
        for (Map.Entry<Integer, Cart> entry : mutilShopCart.entrySet()) {
            Integer key = entry.getKey();
            Cart cart = entry.getValue();
            total += cart.getTotalCount();
        }
        return total;
    }

}
