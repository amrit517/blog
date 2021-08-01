<%-- 
    Document   : index
    Created on : 28-Jul-2021, 3:52:09 am
    Author     : amrit
--%>

<%@page import="com.tech.blog.helper.Connectionprovider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%--<%@ include file="com.tech.blog.helper.Connectionprovider.java" %>--%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Blog</title>
    </head>
    <style>
        .banner{
            clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 79% 85%, 47% 100%, 26% 86%, 0 100%, 0% 35%, 0 0);

        }
    </style>
    <body>
        <%@include file="navbar.jsp" %>
        <br>
        <div class="conatiner-fluid p-0 m-0">
            <div class="jumbotron text-white navbar_bg banner">
                <div class="container">
                    <h3 class="display-3">Welcome my friends !!</h3>                                
                    <p>High-level programming language includes Python, Java, JavaScript, PHP, C#, C++, Objective C, Cobol, Perl, Pascal, LISP, FORTRAN, and Swift programming language. Procedural Oriented Programming (POP) language is derived from structured programming and based upon the procedure call concept.</p>
                    <button class='btn btn-outline-light btn-lg'><span class='fa fa-user-circle-o banner-btn'></span>Start your Journey</button>
                    <a href="login.jsp" class='btn btn-outline-light btn-lg'><span class='fa fa-user-plus banner-btn '></span>Login</a>
                </div>
            </div>

                               <div class="container">
                <div class="row mb-5">
                                               <div class="col-md-4">
                        <div class="card" style="width:18rem;">
                            <img class="card-img-top" src="img/download.png" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">Java programming</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                <a href="#" class="btn navbar_bg text-white">Read More...</a>
                            </div>
                                               </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card" style="width:18rem;">
                            <img class="card-img-top" src="img/download.png" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">Java programming</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                <a href="#" class="btn navbar_bg text-white">Read More...</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card" style="width:18rem;">
                            <img class="card-img-top" src="img/download.png" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">Java programming</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                <a href="#" class="btn navbar_bg text-white">Read More...</a>
                            </div>
                        </div>
                    </div>


                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="card" style="width:18rem;">
                            <img class="card-img-top" src="img/download.png" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">Java programming</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                <a href="#" class="btn navbar_bg text-white">Read More...</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card" style="width:18rem;">
                            <img class="card-img-top" src="img/download.png" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">Java programming</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                <a href="#" class="btn navbar_bg text-white">Read More...</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card" style="width:18rem;">
                            <img class="card-img-top" src="img/download.png" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">Java programming</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                <a href="#" class="btn navbar_bg text-white">Read More...</a>
                            </div>
                        </div>
                    </div>


                </div>
            </div>




    </body>
</html>
