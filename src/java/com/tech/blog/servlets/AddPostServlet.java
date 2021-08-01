/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Connectionprovider;
import com.tech.blog.helper.DeleteFile;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig


public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int cid = Integer.parseInt(request.getParameter("cid"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String code = request.getParameter("code");         
            Part part = request.getPart("pic");
            String pic = part.getSubmittedFileName();
            
//            getting current user id
                HttpSession session = request.getSession();
                User user =(User)session.getAttribute("CurrentUser");
                int user_id = user.getId();
                
                
                Post p = new Post(title, content, code, pic, null, cid, user_id);
                
                PostDao dao = new PostDao(Connectionprovider.getConnection());
                
                boolean ans = dao.Addpost(p);
                
                if (ans) {
                String path = request.getRealPath("/") + "blogpics" + File.separator + p.getPic();
//              String oldpath = request.getRealPath("/") + "blogpics" + File.separator + oldfilename;
//                if (!oldpath.equals("default.png")) {
//                    DeleteFile.deletefile(oldpath);
//                }
                if (DeleteFile.savefile(part.getInputStream(), path)) {
                    out.print("success");
                } else {
                    out.print("fail");
                }

            } 
                else {
                out.print("fail");
            }
                
               
                        

                
//                            create a user Dao object

               
 

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
