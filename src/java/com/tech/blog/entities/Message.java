package com.tech.blog.entities;
public class Message {
    private String content;
    private String msgtype;
    private String cssmessage;

    public Message(String content, String msgtype, String cssmessage) {
        this.content = content;
        this.msgtype = msgtype;
        this.cssmessage = cssmessage;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMsgtype() {
        return msgtype;
    }

    public void setMsgtype(String msgtype) {
        this.msgtype = msgtype;
    }

    public String getCssmessage() {
        return cssmessage;
    }

    public void setCssmessage(String cssmessage) {
        this.cssmessage = cssmessage;
    }
            
            
    
}
