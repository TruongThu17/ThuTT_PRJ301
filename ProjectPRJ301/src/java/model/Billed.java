/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author win
 */
public class Billed {
    private String bid;
    private String cid;
    private float total;
    private float prepayment;
    private float debt;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Billed(String bid, String cid, float total, float prepayment, float debt, Date date) {
        this.bid = bid;
        this.cid = cid;
        this.total = total;
        this.prepayment = prepayment;
        this.debt = debt;
        this.date = date;
    }
    
    public Billed() {
    }

    

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public float getPrepayment() {
        return prepayment;
    }

    public void setPrepayment(float prepayment) {
        this.prepayment = prepayment;
    }

    public float getDebt() {
        return debt;
    }

    public void setDebt(float debt) {
        this.debt = debt;
    }
    
}
