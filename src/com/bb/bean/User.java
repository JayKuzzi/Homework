package com.bb.bean;


import java.io.Serializable;

/*
* 用户bean
* Create by woo-bo
*/
public class User implements Serializable {

    private int Id;// 用户数据库编号
    private String userId;// 用户学号
    private String userChinaName; //用户姓名
    private String userName;// 用户名(登录名)
    private String userPass;// 密码
    private String classinfo;// 班级
    private String profession; //专业
    private String eMail;//用户邮箱

    public User() {

    }

    public User(String userName) {
        super();
        this.userName = userName;
    }

    public User(String userName, String userPass) {
        super();
        this.userName = userName;
        this.userPass = userPass;
    }

    public User(int id, String userId, String userChinaName, String userName, String userPass, String classinfo, String profession, String eMail) {
        Id = id;
        this.userId = userId;
        this.userChinaName = userChinaName;
        this.userName = userName;
        this.userPass = userPass;
        this.classinfo = classinfo;
        this.profession = profession;
        this.eMail = eMail;
    }

    public User(String userId, String userChinaName, String userName, String userPass, String classinfo, String profession, String eMail) {
        this.userId = userId;
        this.userChinaName = userChinaName;
        this.userName = userName;
        this.userPass = userPass;
        this.classinfo = classinfo;
        this.profession = profession;
        this.eMail = eMail;
    }

    public User(int id, String userId, String userChinaName, String userPass, String classinfo, String profession, String eMail) {
        Id = id;
        this.userId = userId;
        this.userChinaName = userChinaName;
        this.userPass = userPass;
        this.classinfo = classinfo;
        this.profession = profession;
        this.eMail = eMail;
    }

    public String getUserChinaName() {
        return userChinaName;
    }

    public void setUserChinaName(String userChinaName) {
        this.userChinaName = userChinaName;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getClassinfo() {
        return classinfo;
    }

    public void setClassinfo(String classinfo) {
        this.classinfo = classinfo;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    @Override
    public boolean equals(Object obj) {
        User another = (User) obj;
        return userName.equals(another.userName) && userPass.equals(another.userPass);
    }


}
