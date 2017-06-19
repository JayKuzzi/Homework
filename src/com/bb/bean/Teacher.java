package com.bb.bean;

import java.io.Serializable;

/**
 * 老师bean
 * Created by bb on 2017/6/16.
 */
public class Teacher implements Serializable{
    private int Id;// 数据库编号
    private String name;// 老师姓名
    private String phone;//老师手机

    public Teacher() {
    }

    public Teacher(int id, String name, String phone) {
        Id = id;
        this.name = name;
        this.phone = phone;
    }

    public Teacher(String name, String phone) {
        this.name = name;
        this.phone = phone;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
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
}
