/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author win
 */
public class Inventory {

    private String id;
    private String name;
    private float price;
    private int sl;
    private String nsx;
    private String unit;
    private boolean status;
    private String ptname;

    public Inventory() {
    }

    public Inventory(String id, String name, float price, int sl, String nsx, String unit, boolean status, String ptname) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.sl = sl;
        this.nsx = nsx;
        this.unit = unit;
        this.status = status;
        this.ptname = ptname;
    }

    public String getPtname() {
        return ptname;
    }

    public void setPtname(String ptname) {
        this.ptname = ptname;
    }



    public String getNsx() {
        return nsx;
    }

    public void setNsx(String nsx) {
        this.nsx = nsx;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSl() {
        return sl;
    }

    public void setSl(int sl) {
        this.sl = sl;
    }

}
