package com.risingwind.po;

public class TblForums {
    private Integer forumid;

    private String forumtitle;

    private String foruminfo;

    private String forumpic;

    public Integer getForumid() {
        return forumid;
    }

    public void setForumid(Integer forumid) {
        this.forumid = forumid;
    }

    public String getForumtitle() {
        return forumtitle;
    }

    public void setForumtitle(String forumtitle) {
        this.forumtitle = forumtitle == null ? null : forumtitle.trim();
    }

    public String getForuminfo() {
        return foruminfo;
    }

    public void setForuminfo(String foruminfo) {
        this.foruminfo = foruminfo == null ? null : foruminfo.trim();
    }

    public String getForumpic() {
        return forumpic;
    }

    public void setForumpic(String forumpic) {
        this.forumpic = forumpic == null ? null : forumpic.trim();
    }
}