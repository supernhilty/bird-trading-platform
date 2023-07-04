/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;
import com.birdtradingplatform.model.Role;
/**
 *
 * @author leyen
 */
public class Account {
    private int accountID;
    private String username;
    private String email;
    private String password;
    private int role;
    private boolean isDeleted;
    private String regisDate;
    private String avatar;
    public Account() {
    }
    
    public Account(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Account(int accountID, String username, String email, String password, int role, boolean isDeleted, String regisDate, String avatar) {
        this.accountID = accountID;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.isDeleted = isDeleted;
        this.regisDate = regisDate;
        this.avatar = avatar;
    }

    public Account(int accountID, String username, String email, String password, int role, boolean isDeleted, String regisDate) {
        this.accountID = accountID;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.isDeleted = isDeleted;
        this.regisDate = regisDate;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

 

    public boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getrRegisDate() {
        return getRegisDate();
    }

    public void setRegisDate(String registerDate) {
        this.regisDate = registerDate;
    }

    /**
     * @return the role
     */
    public int getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(int role) {
        this.role = role;
    }

    /**
     * @return the regisDate
     */
    public String getRegisDate() {
        return regisDate;
    }

    /**
     * @return the avatar
     */
    public String getAvatar() {
        return avatar;
    }

    /**
     * @param avatar the avatar to set
     */
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
}
