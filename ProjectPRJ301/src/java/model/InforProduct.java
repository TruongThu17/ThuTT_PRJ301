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
public class InforProduct {

    private String id;
    private String pid;
    private float importprice;
    private float saleprice;
    private Date dateexp;
    private int quantity;
    private String unit;
    private boolean status;
    private String sid;
    private String note;

    public InforProduct(String id, String pid, float importprice, float saleprice, Date dateexp, int quantity, String unit, boolean status, String sid, String note) {
        this.id = id;
        this.pid = pid;
        this.importprice = importprice;
        this.saleprice = saleprice;
        this.dateexp = dateexp;
        this.quantity = quantity;
        this.unit = unit;
        this.status = status;
        this.sid = sid;
        this.note = note;
    }



    
    public InforProduct() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
    

    public float getImportprice() {
        return importprice;
    }

    public void setImportprice(float importprice) {
        this.importprice = importprice;
    }

    public Date getDateexp() {
        return dateexp;
    }

    public void setDateexp(Date dateexp) {
        this.dateexp = dateexp;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }


    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public float getSaleprice() {
        return saleprice;
    }

    public void setSaleprice(float saleprice) {
        this.saleprice = saleprice;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
