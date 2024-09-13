/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdw.model;

/**
 *
 * @author syukur
 */
public class Model_User {

    private String user_id;
    private String user_name;
    private String bankcode;
    private String statususer;
    private String password;
    private String fee_account;
    private String nik;
    private String name;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getBankcode() {
        return bankcode;
    }

    public void setBankcode(String bankcode) {
        this.bankcode = bankcode;
    }

    public String getStatususer() {
        return statususer;
    }

    public void setStatususer(String statususer) {
        this.statususer = statususer;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFee_account() {
        return fee_account;
    }

    public void setFee_account(String fee_account) {
        this.fee_account = fee_account;
    }

    public String getNik() {
        return nik;
    }

    public void setNik(String nik) {
        this.nik = nik;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
