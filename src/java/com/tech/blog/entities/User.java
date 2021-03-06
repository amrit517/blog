package com.tech.blog.entities;
import java.sql.*;


public class User {

    private int id;
    private String user_name;
    private String email;
    private String password;
    private String gender;
    private String description;
    private Timestamp dateTime;
    private String profile;

    public User(int id, String user_name, String email, String password, String gender, String description, Timestamp dateTime) {
        this.id = id;
        this.user_name = user_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.description = description;
        this.dateTime = dateTime;
    }

    public User() {
    }

    public User(String user_name, String email, String password, String gender, String description) {
        this.user_name = user_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.description = description;
//        this.dateTime = dateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    

}
