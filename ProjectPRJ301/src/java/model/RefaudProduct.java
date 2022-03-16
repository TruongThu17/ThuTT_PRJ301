/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author win
 */
public class RefaudProduct {
    private String rpid;
    private Date daterefaud;
    private float total;
    private String sid;
    
    private ArrayList<InfRefaudProduct> inf;

    public RefaudProduct() {
    }

    public RefaudProduct(String rpid, Date daterefaud, float total, String sid, ArrayList<InfRefaudProduct> inf) {
        this.rpid = rpid;
        this.daterefaud = daterefaud;
        this.total = total;
        this.sid = sid;
        this.inf = inf;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }



    public String getRpid() {
        return rpid;
    }

    public void setRpid(String rpid) {
        this.rpid = rpid;
    }

    public Date getDaterefaud() {
        return daterefaud;
    }

    public void setDaterefaud(Date daterefaud) {
        this.daterefaud = daterefaud;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public ArrayList<InfRefaudProduct> getInf() {
        return inf;
    }

    public void setInf(ArrayList<InfRefaudProduct> inf) {
        this.inf = inf;
    }
    
   
}
