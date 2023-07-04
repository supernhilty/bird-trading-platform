/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author Minh Quan
 */
public class AccountInsertError {
     private String emailFormatError;
    private String emailIsEmptyError;
    private String usernameIsEmptyError;
    private String addressIsEmptyError;
    private String avatarIsNotCorrect;
    private String passwordLengthError;
    private String passwordNotMatch;
    private String accountIsExisted;
    
    public AccountInsertError() {
    }

    public AccountInsertError(String emailFormatError, String emailIsEmptyError, String usernameIsEmptyError, String addressIsEmptyError, String avatarIsNotCorrect, String passwordLengthError, String passwordNotMatch, String accountIsExisted) {
        this.emailFormatError = emailFormatError;
        this.emailIsEmptyError = emailIsEmptyError;
        this.usernameIsEmptyError = usernameIsEmptyError;
        this.addressIsEmptyError = addressIsEmptyError;
        this.avatarIsNotCorrect = avatarIsNotCorrect;
        this.passwordLengthError = passwordLengthError;
        this.passwordNotMatch = passwordNotMatch;
        this.accountIsExisted = accountIsExisted;
    }

    /**
     * @return the emailFormatError
     */
    public String getEmailFormatError() {
        return emailFormatError;
    }

    /**
     * @param emailFormatError the emailFormatError to set
     */
    public void setEmailFormatError(String emailFormatError) {
        this.emailFormatError = emailFormatError;
    }

    /**
     * @return the emailIsEmptyError
     */
    public String getEmailIsEmptyError() {
        return emailIsEmptyError;
    }

    /**
     * @param emailIsEmptyError the emailIsEmptyError to set
     */
    public void setEmailIsEmptyError(String emailIsEmptyError) {
        this.emailIsEmptyError = emailIsEmptyError;
    }

    /**
     * @return the usernameIsEmptyError
     */
    public String getUsernameIsEmptyError() {
        return usernameIsEmptyError;
    }

    /**
     * @param usernameIsEmptyError the usernameIsEmptyError to set
     */
    public void setUsernameIsEmptyError(String usernameIsEmptyError) {
        this.usernameIsEmptyError = usernameIsEmptyError;
    }

    /**
     * @return the addressIsEmptyError
     */
    public String getAddressIsEmptyError() {
        return addressIsEmptyError;
    }

    /**
     * @param addressIsEmptyError the addressIsEmptyError to set
     */
    public void setAddressIsEmptyError(String addressIsEmptyError) {
        this.addressIsEmptyError = addressIsEmptyError;
    }

    /**
     * @return the avatarIsNotCorrect
     */
    public String getAvatarIsNotCorrect() {
        return avatarIsNotCorrect;
    }

    /**
     * @param avatarIsNotCorrect the avatarIsNotCorrect to set
     */
    public void setAvatarIsNotCorrect(String avatarIsNotCorrect) {
        this.avatarIsNotCorrect = avatarIsNotCorrect;
    }

    /**
     * @return the passwordLengthError
     */
    public String getPasswordLengthError() {
        return passwordLengthError;
    }

    /**
     * @param passwordLengthError the passwordLengthError to set
     */
    public void setPasswordLengthError(String passwordLengthError) {
        this.passwordLengthError = passwordLengthError;
    }

    /**
     * @return the passwordNotMatch
     */
    public String getPasswordNotMatch() {
        return passwordNotMatch;
    }

    /**
     * @param passwordNotMatch the passwordNotMatch to set
     */
    public void setPasswordNotMatch(String passwordNotMatch) {
        this.passwordNotMatch = passwordNotMatch;
    }

    /**
     * @return the accountIsExisted
     */
    public String getAccountIsExisted() {
        return accountIsExisted;
    }

    /**
     * @param accountIsExisted the accountIsExisted to set
     */
    public void setAccountIsExisted(String accountIsExisted) {
        this.accountIsExisted = accountIsExisted;
    }
    
    
}
