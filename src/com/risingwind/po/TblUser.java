package com.risingwind.po;

import java.util.Date;

public class TblUser {
    private Integer uid;

    private String password;

    private String username;

    private String phonenum;

    private Integer qqnum;

    private String email;

    private String sex;

    private String birthday;

    private String address;

    private String headportrait;

    private String qianming;

    private Date registrationtime;

    private String registerip;

    private Integer signinnum;

    private Integer signinpoints;

    private Integer empiricvalue;

    private Integer grade;

    private String positi;

    private String ipaddress;

    private Date logintime;

    private Date oldlogintime;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public Integer getQqnum() {
        return qqnum;
    }

    public void setQqnum(Integer qqnum) {
        this.qqnum = qqnum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getHeadportrait() {
        return headportrait;
    }

    public void setHeadportrait(String headportrait) {
        this.headportrait = headportrait == null ? null : headportrait.trim();
    }

    public String getQianming() {
        return qianming;
    }

    public void setQianming(String qianming) {
        this.qianming = qianming == null ? null : qianming.trim();
    }

    public Date getRegistrationtime() {
        return registrationtime;
    }

    public void setRegistrationtime(Date registrationtime) {
        this.registrationtime = registrationtime;
    }

    public String getRegisterip() {
        return registerip;
    }

    public void setRegisterip(String registerip) {
        this.registerip = registerip == null ? null : registerip.trim();
    }

    public Integer getSigninnum() {
        return signinnum;
    }

    public void setSigninnum(Integer signinnum) {
        this.signinnum = signinnum;
    }

    public Integer getSigninpoints() {
        return signinpoints;
    }

    public void setSigninpoints(Integer signinpoints) {
        this.signinpoints = signinpoints;
    }

    public Integer getEmpiricvalue() {
        return empiricvalue;
    }

    public void setEmpiricvalue(Integer empiricvalue) {
        this.empiricvalue = empiricvalue;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getPositi() {
        return positi;
    }

    public void setPositi(String positi) {
        this.positi = positi == null ? null : positi.trim();
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress == null ? null : ipaddress.trim();
    }

    public Date getLogintime() {
        return logintime;
    }

    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    public Date getOldlogintime() {
        return oldlogintime;
    }

    public void setOldlogintime(Date oldlogintime) {
        this.oldlogintime = oldlogintime;
    }
}