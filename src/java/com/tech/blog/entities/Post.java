/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {

    private int pid;
    private String title;
    private String content;
    private String code;
    private String pic;
    private Timestamp pdate;
    private int cid;
    private int user_id;

    public Post(int pid, String title, String content, String code, String pic, Timestamp pdate, int cid,int user_id) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.pdate = pdate;
        this.cid = cid;
        this.user_id =user_id;

    }

    public Post() {
    }

    public Post(String title, String content, String code, String pic, Timestamp pdate, int cid,int user_id) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.pdate = pdate;
        this.cid = cid;
        this.user_id=user_id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    

}
