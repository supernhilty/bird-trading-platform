/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class FeedbackDetail extends Feedback{
    private Account account;

    public FeedbackDetail(Account account, int feedbackID, String img, int star, String detail, int productID, int accID, String publishedDate) {
        super(feedbackID, img, star, detail, productID, accID, publishedDate);
        this.account = account;
    }

    public FeedbackDetail() {
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    

   
    
    
   
    
}