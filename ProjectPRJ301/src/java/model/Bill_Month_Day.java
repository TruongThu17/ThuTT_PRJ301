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
public class Bill_Month_Day {
    private String bid ;
    private String cname;
    private float total;
    private Date date;

    public Bill_Month_Day() {
    }

    public Bill_Month_Day(String bid, String cname, float total, Date date) {
        this.bid = bid;
        this.cname = cname;
        this.total = total;
        this.date = date;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
