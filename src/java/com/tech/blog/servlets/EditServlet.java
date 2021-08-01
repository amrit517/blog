/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.Connectionprovider;
import com.tech.blog.helper.DeleteFile;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

/**
 *
 * @author amrit
 */
@MultipartConfig

/**
 *
 * @author amrit
 */
public class EditServlet extends HttpServlet {

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
            String id = request.getParameter("user_id");
            String name = request.getParameter("user_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String description = request.getParameter("description");
            Part part = request.getPart("img");
            String imagename = part.getSubmittedFileName();

//            get the user from the session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("CurrentUser");
            user.setUser_name(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setDescription(description);
            String oldfilename = user.getProfile();
            user.setProfile(imagename);

            UserDao userdao = new UserDao(Connectionprovider.getConnection());
            boolean ans = userdao.updateuser(user);
            if (ans) {
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                String oldpath = request.getRealPath("/") + "pics" + File.separator + oldfilename;
                if (!oldpath.equals("default.png")) {
                    DeleteFile.deletefile(oldpath);

                }
                if (DeleteFile.savefile(part.getInputStream(), path)) {
                    out.print("success");
                } else {
                    out.print("fail");
                }

            } else {
                out.print("fail");
            }
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
