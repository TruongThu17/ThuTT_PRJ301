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
public class Customer {
    private String id;
    private String name;
    private String phone;
    private String address;
    private String note;

    public Customer(String id, String name, String phone, String address, String note) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
    }

    public Customer() {
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    
}
