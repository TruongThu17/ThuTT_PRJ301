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
public class Detail {
    private String pid;
    private String pname;
    private int quantity;
    private float unitprice;

    public Detail() {
    }

    public Detail(String pid, String pname, int quantity, float unitprice) {
        this.pid = pid;
        this.pname = pname;
        this.quantity = quantity;
        this.unitprice = unitprice;
    }
    
    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(float unitprice) {
        this.unitprice = unitprice;
    }

    
    
}
