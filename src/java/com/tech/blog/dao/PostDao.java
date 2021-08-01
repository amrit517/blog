package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategorys(){
        ArrayList<Category> list=new ArrayList<>();
        try {
            String query = "select * from categories_table";
            Statement st = this.con.createStatement();
            ResultSet s = st.executeQuery(query);
            while(s.next()){
                int cid = s.getInt("cid");
                String cname = s.getString("cname");
                String description = s.getString("description");
                Category c = new Category(cid,cname,description);
                list.add(c);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    public boolean Addpost(Post p) {
        boolean f = false;
        try {
            // inserting data into database

            String query = "insert into post_table(title,content,code,pic,cid,user_id) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,p.getTitle());            
            pstmt.setString(2,p.getContent());
            pstmt.setString(3,p.getCode());
            pstmt.setString(4,p.getPic());
            pstmt.setInt(5,p.getCid());
            pstmt.setInt(6,p.getUser_id());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
    
    public List<Post> Allposts(){
        List<Post> list = new ArrayList<>();
        try {
            String query = "Select * from post_table";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            ResultSet s = pstmt.executeQuery(query);
            while(s.next()){
                int pid = s.getInt("pid");
                String title = s.getString("title");
                String content = s.getString("content");
                String code = s.getString("code");
                String pic = s.getString("pic");
                Timestamp pdate = s.getTimestamp("pdate");
                int cid = s.getInt("cid");                
                int user_id = s.getInt("user_id");                
                Post p = new Post(pid, title, content, code, pic, pdate, cid, user_id);
                list.add(p);                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> Postbycid(int cid){
        List<Post> list = new ArrayList<>();
        System.out.println(cid);
        try {
            String query = "SELECT * FROM POST_TABLE WHERE cid=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,String.valueOf(cid));
            ResultSet s=pstmt.executeQuery();
            while(s.next()){
                int pid = s.getInt("pid");
                String title = s.getString("title");
                String content = s.getString("content");
                String code = s.getString("code");
                String pic = s.getString("pic");
                Timestamp pdate = s.getTimestamp("pdate");
//                int cid = s.getInt("cid");
                int user_id = s.getInt("user_id");                
                Post p = new Post(pid, title, content, code, pic, pdate, cid, user_id);
                list.add(p);                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    

    
        
    
} 