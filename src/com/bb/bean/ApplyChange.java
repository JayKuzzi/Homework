package com.bb.bean;

import java.io.Serializable;

/*
 * 申请修改bean
 * Created by bb on 2017/6/13.
 */
public class ApplyChange implements Serializable {
    private int id;// 申请修改数据库编号
    private int userId; //用户id
    private String tittle; //申请修改项
    private String content; //申请修改内容
    private String stste;   //申请修改状态

    public ApplyChange() {
    }


    public ApplyChange(int userId, String tittle, String content, String stste) {
        this.userId = userId;
        this.tittle = tittle;
        this.content = content;
        this.stste = stste;
    }

    public ApplyChange(int id, int userId, String tittle, String content, String stste) {
        this.id = id;
        this.userId = userId;
        this.tittle = tittle;
        this.content = content;
        this.stste = stste;
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

    public String getStste() {
        return stste;
    }

    public void setStste(String stste) {
        this.stste = stste;
    }
}
