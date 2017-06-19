package com.bb.bean;

import java.io.Serializable;

/*
 * 作业展示bean
 * Created by bb on 2017/6/13.
 */
public class WorkShow implements Serializable {
    private int Id;// 展示数据库编号
    private int workId;// 作业数据库编号
    private String preview; //作业截图
    private String state;//通过状态


    public WorkShow() {
    }

    public WorkShow(int id, int workId, String preview, String state) {
        Id = id;
        this.workId = workId;
        this.preview = preview;
        this.state = state;
    }

    public WorkShow(int workId, String preview, String state) {
        this.workId = workId;
        this.preview = preview;
        this.state = state;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getWorkId() {
        return workId;
    }

    public void setWorkId(int workId) {
        this.workId = workId;
    }

    public String getPreview() {
        return preview;
    }

    public void setPreview(String preview) {
        this.preview = preview;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
