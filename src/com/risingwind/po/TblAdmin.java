package com.risingwind.po;

import java.util.Date;

public class TblAdmin {
    private Integer adminnum;

    private String adminstrator;

    private String supervisorpassword;

    private Integer logincount;

    private String ipaddress;

    private Date logintime;

    private Date oldlogintime;

    public Integer getAdminnum() {
        return adminnum;
    }

    public void setAdminnum(Integer adminnum) {
        this.adminnum = adminnum;
    }

    public String getAdminstrator() {
        return adminstrator;
    }

    public void setAdminstrator(String adminstrator) {
        this.adminstrator = adminstrator == null ? null : adminstrator.trim();
    }

    public String getSupervisorpassword() {
        return supervisorpassword;
    }

    public void setSupervisorpassword(String supervisorpassword) {
        this.supervisorpassword = supervisorpassword == null ? null : supervisorpassword.trim();
    }

    public Integer getLogincount() {
        return logincount;
    }

    public void setLogincount(Integer logincount) {
        this.logincount = logincount;
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