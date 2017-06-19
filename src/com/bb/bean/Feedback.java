package com.bb.bean;

import java.io.Serializable;

/*
 * 反馈bean
 * Created by bb on 2017/6/13.
 */
public class Feedback implements Serializable {
    private int id;// 反馈数据库编号
    private int userId; //用户id
    private String tittle; //反馈标题
    private String content; //反馈内容


    public Feedback() {
    }

    public Feedback(int id, int userId, String tittle, String content) {
        this.id = id;
        this.userId = userId;
        this.tittle = tittle;
        this.content = content;
    }

    public Feedback(int userId, String tittle, String content) {
        this.userId = userId;
        this.tittle = tittle;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
