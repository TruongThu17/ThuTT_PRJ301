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
public class Refaud {
    private String rid;
    private String bid;
    private String cid;
    private float total;
    private Date daterefaud;

    public Refaud() {
    }

    public Refaud(String rid, String bid, String cid, float total, Date daterefaud) {
        this.rid = rid;
        this.bid = bid;
        this.cid = cid;
        this.total = total;
        this.daterefaud = daterefaud;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
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

    public Date getDaterefaud() {
        return daterefaud;
    }

    public void setDaterefaud(Date daterefaud) {
        this.daterefaud = daterefaud;
    }
    
}
