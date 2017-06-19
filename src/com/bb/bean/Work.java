package com.bb.bean;

import java.io.Serializable;

/**
 * 作业bean
 * Created by bb on 2017/6/6.
 */
public class Work implements Serializable {
    private int Id;// 作业数据库编号
    private int userId;// 用户数据库编号
    private int teacherId;//老师数据库编号
    private String workName;//作业名称
    private String file; //作业文件
    private String workGrade; //作业评分
    private String workDate; //作业上传时间
    private String workPhone;// 作业联系方式
    private String workInfo;// 作业备注


    public Work() {
    }

    public Work(int id) {
        Id = id;
    }

    public Work(int userId, int teacherId, String workName, String file, String workGrade, String workDate, String workPhone, String workInfo) {
        this.userId = userId;
        this.teacherId = teacherId;
        this.workName = workName;
        this.file = file;
        this.workGrade = workGrade;
        this.workDate = workDate;
        this.workPhone = workPhone;
        this.workInfo = workInfo;
    }

    public Work(int Id, int teacherId, String workName, String file, String workDate, String workPhone, String workInfo) {
        this.Id = Id;
        this.teacherId = teacherId;
        this.workName = workName;
        this.file = file;
        this.workDate = workDate;
        this.workPhone = workPhone;
        this.workInfo = workInfo;
    }

    public Work(int Id, int teacherId, String workName, String workDate, String workPhone, String workInfo) {
        this.Id = Id;
        this.teacherId = teacherId;
        this.workName = workName;
        this.workDate = workDate;
        this.workPhone = workPhone;
        this.workInfo = workInfo;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getWorkName() {
        return workName;
    }

    public void setWorkName(String workName) {
        this.workName = workName;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getWorkGrade() {
        return workGrade;
    }

    public void setWorkGrade(String workGrade) {
        this.workGrade = workGrade;
    }

    public String getWorkDate() {
        return workDate;
    }

    public void setWorkDate(String workDate) {
        this.workDate = workDate;
    }

    public String getWorkPhone() {
        return workPhone;
    }

    public void setWorkPhone(String workPhone) {
        this.workPhone = workPhone;
    }

    public String getWorkInfo() {
        return workInfo;
    }

    public void setWorkInfo(String workInfo) {
        this.workInfo = workInfo;
    }
}