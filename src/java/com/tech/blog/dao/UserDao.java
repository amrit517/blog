/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;

/**
 *
 * @author amrit
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        boolean f = false;
        try {
            // inserting data into database

            String query = "insert into user_table(user_name,email,password,gender,description) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getUser_name());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getDescription());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    public User getUserbyemailandpassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user_table where email=? and password=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
//                get data from db
                String name = set.getString("user_name");
//                set to user object
                user.setUser_name(name);
                user.setId(set.getInt("id"));
                user.setPassword(set.getString("password"));
                user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                user.setDescription(set.getString("description"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return user;

    }
    
    public boolean updateuser(User user){
        boolean f = false;
        try{
            String query = "update user_table set user_name=?,email=?,password=?,gender=?,description=?,profile=? where id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getUser_name());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getDescription());  
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            f = true;   
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }

}
