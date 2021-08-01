<%-- 
    Document   : profile
    Created on : 29-Jul-2021, 1:16:27 am
    Author     : amrit
--%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.0/jquery.toast.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.0/jquery.toast.css">        
        <title>Profile</title>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top navbar_bg">
            <a class="navbar-brand" href="index.jsp"> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Learn with us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Reach us</a>
                    </li>
                    <!-- Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            Categories
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Java</a>
                            <a class="dropdown-item" href="#">Python 2</a>
                            <a class="dropdown-item" href="#">Artificial Intelligence</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#post_model_page">Do post</a>
                    </li> 

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#myModal"><span class="fa fa-user-plus span"></span><%=user.getUser_name()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link logout"><span class="fa fa-user-circle-o span"></span>Logout</a>
                    </li>            
                </ul>        
            </div>  
        </nav>       

        <!--end of navbar-->

        <!--main body-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a onclick="allPosts(0)" class="list-group-item list-group-item-action navbar_bg text-white">All Posts</a>
                            <%
                                PostDao d = new PostDao(Connectionprovider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategorys();
                               for(Category c:list1){
                                   %>
                                   <a onclick="allPosts(<%=c.getCid()%>)" class="list-group-item list-group-item-action"><%=c.getCname()%></a>
                                           <%                                                                                       
                            }                                                                                                
                            %>                       
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="conatiner text-centre" id="loader">
                            <i class="fa fa-refresh fa-2x fa-spin"></i>
                            <h4 class="mt-2">Loading....</h4>                     
                        </div>
                        
                        <div class="conatiner-fluid" id='post-container'>
                            
                        </div>
                        
                        <!--post-->
                    </div>
                </div>
            </div>

        </div>
    </main>
    <!--end of main body-->

    <!--model page-->

    <div class="container">


        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-sm-mt-3">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header text-white navbar_bg">
                        <h4 class="modal-title">TechBlog</h4>

                        <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="container">
                            <img src="pics/<%=user.getProfile()%>"style="width: 200px;height:120px; margin-left: 127px"><br>
                            <h4 class="modal-title mt-3 text-centre"><%=user.getUser_name()%></h4><br>
                            <!--user details-->
                            <div class="profile-details">
                                <table class="table table-striped">

                                    <tbody>
                                        <tr>
                                            <th>Id:</th>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th>Email:</th>
                                            <td><%=user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th>Gender:</th>
                                            <td><%=user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th>Status:</th>
                                            <td><%=user.getDescription()%></td>
                                        </tr>
                                        <tr>
                                            <th>User Registered on:</th>
                                            <td><%=user.getDateTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>                 
                            </div>
                            <!--edit-profile details-->
                            <div class="edit-profile-details" style="display: none">
                                <h3 class="text-centre">Edit Your Details carefully</h3>
                                <form id ="edit_user_profile" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="id">User ID:</label>
                                        <input type="text" class="form-control user_id" id="user_id" placeholder="Enter user_name" name="user_id" readonly value=<%=user.getId()%> >
                                        <small class="name_has_error has_error"> </small>
                                    </div>
                                    <div class="form-group">
                                        <label for="user_name">User name:</label>
                                        <input type="text" class="form-control user_name validate1" errorMSG="Please your name" id="user_name" placeholder="Enter user_name" name="user_name" value=<%=user.getUser_name()%> >
                                        <small class="name_has_error has_error"> </small>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control validate1" id="email" placeholder="Enter email address" errorMSG="Enter Your Name" name="email" value=<%=user.getEmail()%>>
                                    </div>

                                    <div class="form-group">
                                        <label for="pwd">Password:</label>
                                        <input type="password" class="form-control validate1" id="pwd" placeholder="Enter password" name="password" errorMSG="Enter password" value=<%=user.getPassword()%>>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd">Gender</label>
                                        <input type="text" class="form-control" id="gender" readonly  name="gender" errorMSG="Enter password" value=<%=user.getGender()%>>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd">upload profile Image</label>
                                        <input type="file" class="form-control" id="img"  name="img">
                                    </div>
                                    <div class="form-group">
                                        <label for="info">Description</label>
                                        <textarea class="form-control validate1" rows="4" id="info" errorMSG ="Enter Something about yourself" name="description"><%=user.getDescription()%></textarea>
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input rem" type="checkbox" name="remember" errorMSG="check the term and conditions">Agree on Terms and Conditions
                                        </label>
                                    </div>
                                    <button type="submit" class="btn navbar_bg text-white">Submit</button>
                                </form>
                            </div>


                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary navbar_bg text-white" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="edit-details">Edit</button>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <!--end of model-->

    <!--model for post-->
    <div class="container">
        <!-- The Modal -->
        <div class="modal fade" id="post_model_page">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Enter the post deatils</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form id ="add_post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="category">Select Category (select one):</label>
                                <select class="form-control" id="cid" name="cid">
                                    <option selected disabled>----Select one----</option>
                                    <%
                                        PostDao pdao = new PostDao(Connectionprovider.getConnection());
                                        ArrayList<Category> list = pdao.getAllCategorys();
                                        for (Category c : list) {


                                    %>
                                    <<option value=<%=c.getCid()%>><%=c.getCname()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="title">Post Title</label>
                                <input type="text" class="form-control title validate" errorMSG="Please your post title" id="title" placeholder="Enter post title" name="title">

                            </div>
                            <div class="form-group">
                                <label for="content">Content</label>
                                <textarea class="form-control validate" rows="6" id="content" errorMSG ="Enter content for post" placeholder="Type your Content here" name="content"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="code">Enter code for post(if any)</label>
                                <textarea class="form-control" rows="6" id="code"  placeholder="Type your Code here (if any)"  name="code"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="pwd">upload Image</label>
                                <input type="file" class="form-control" id="pic"  name= "pic">
                            </div>


                            <button type="submit" class="btn navbar_bg text-white">Submit</button>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <!--end of post model page-->

</body>
<script>
    function validation() {
        var vali = false;
        $('.validate').each(function () {
            var data = $(this).val();
            var msg = $(this).attr('errorMSG');
            if (data.trim() == "") {
                $(this).css({
                    "border": "1px solid red"
                });
                $.toast({
                    text: '<span class="toast-message">' + msg + '</span>',
                    showHideTransition: 'slide',
                    allowToastClose: true,
                    // icon: 'success', 
                    hideAfter: 3000,
                    stack: 5,
                    position: {left: '15px', right: 'auto', top: '60px', bottom: 'auto'},
                    bgColor: '#971111',
                    textColor: '#ffffff',
                    textAlign: 'left',
                    loader: true,
                    loaderBg: '#FF5C5C',
                });
                vali = false;
            } else {
                $(this).css({
                    "border": "1px solid #CED4DA"
                });
                vali = true;
            }
        });
        return vali;
    }
</script>
<!--===================================================================================-->
<script>
    function validation1() {
        var vali = false;
        $('.validate1').each(function () {
            var data = $(this).val();
            var msg = $(this).attr('errorMSG');
            if (data.trim() == "") {
                $(this).css({
                    "border": "1px solid red"
                });
                $.toast({
                    text: '<span class="toast-message">' + msg + '</span>',
                    showHideTransition: 'slide',
                    allowToastClose: true,
                    // icon: 'success', 
                    hideAfter: 3000,
                    stack: 5,
                    position: {left: '15px', right: 'auto', top: '60px', bottom: 'auto'},
                    bgColor: '#971111',
                    textColor: '#ffffff',
                    textAlign: 'left',
                    loader: true,
                    loaderBg: '#FF5C5C',
                });
                vali = false;
            } else {
                $(this).css({
                    "border": "1px solid #CED4DA"
                });
                vali = true;
            }
        });
        return vali;
    }
</script>
<script>
    $(document).ready(function () {
        $('.logout').click(function () {
            $.ajax({
                url: 'LogoutServlet',
                type: 'post',
                data: {action: 'logout'},
                success: function (data) {
                    if (data == "success") {
                        swal("Success", "Logout Successfully", "success");
                        setTimeout(delay, 3000);
                        function delay() {
                            window.location = "register.jsp";
                        }
                    } else {
                        {
                            swal("error", "Something went Wrong", "error");
//                                setTimeout(delay, 3000);
//                                function delay() {
//                                    window.location = "register.jsp";
//                                }
                        }

                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);



//                            if (data == "success") {
//                                swal({
//                                    title: "Good job!",
//                                    text: "Login Successfully. Redirecting to your Profile.",
//                                    type: "success",
//                                    showCancelButton: false,
//                                    confirmButtonColor: "#DD6B55",
//                                    confirmButtonText: "Ok",
//                                    cancelButtonText: false,
//                                    closeOnConfirm: false,
//                                    closeOnCancel: false,
//                                });
//                                setTimeout(delay, 3000);
//                                function delay() {
//                                    window.location = "profile.jsp";
//                                }
//                            }



                }
            });
        });
        let editStatus = false;
        $("#edit-details").click(function () {
            if (editStatus == false) {
                $(".profile-details").hide();
                $(".edit-profile-details").show();
                editStatus = true;
                $(this).text("Back");
            } else {
                $(".profile-details").show();
                $(".edit-profile-details").hide();
                editStatus = false;
                $(this).text("Edit");

            }

        });

        $("#edit_user_profile").on('submit', function (event) {
            event.preventDefault();
            var gen = $('.rem').is(":checked");
            var error = true;
            if (!gen) {
                swal("Error", "please agree on terms and conditions", "error");
                error = false;
//                    return false;
            }

            if (error && validation1())
            {
                let formdata = new FormData(this);
                $.ajax({
                    url: "EditServlet",
                    method: 'post',
                    data: formdata,
                    processData: false,
                    contentType: false,
                    success: function (data) {

                        if (data == "fail") {
                            swal("Error", "Something Went Wrong !! try again later", "error");


                        }
                        if (data == "success") {
                            swal({
                                title: "Good job!",
                                text: "profile updated Successfully.",
                                type: "success",
                                showCancelButton: false,
                                confirmButtonColor: "#DD6B55",
                                confirmButtonText: "Ok",
                                cancelButtonText: false,
                                closeOnConfirm: false,
                                closeOnCancel: false,
                            });
                            setTimeout(delay, 3000);
                            function delay() {
                                window.location = "profile.jsp";
                            }
                        }


                    }
                    ,
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                    }

                });
            }
        });


//            ajax for post submit
        $("#add_post").on('submit', function (event) {
            event.preventDefault();
            var gen = $('#cid').val();
            console.log(gen)
            var error = true;
            if (gen == null) {
                swal("Error", "please select the Category for post", "error");
                error = false;
//                    return false;
            }

            if (error && validation())
            {
                let formdata = new FormData(this);
                $.ajax({
                    url: "AddPostServlet",
                    method: 'post',
                    data: formdata,
                    processData: false,
                    contentType: false,
                    success: function (data) {



                        if (data == "fail") {
                            swal("Error", "Something Went Wrong !! try again later", "error");


                        }
                        if (data == "success") {
                            swal({
                                title: "Good job!",
                                text: "Post updated Successfully.",
                                type: "success",
                                showCancelButton: false,
                                confirmButtonColor: "#DD6B55",
                                confirmButtonText: "Ok",
                                cancelButtonText: false,
                                closeOnConfirm: false,
                                closeOnCancel: false,
                            });
                            setTimeout(delay, 3000);
                            function delay() {
                                window.location = "profile.jsp";
                            }
                        }


                    }
                    ,
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                    }

                });
            }
        });


    });

</script>

<script>
    
    function allPosts(cid){
        $("#loader").show();
        $("#post-container").hide();
        $.ajax({
            url:"Allposts.jsp",
            data:{cid:cid},
            success: function (data, textStatus, jqXHR) {
                $("#loader").hide();
                $("#post-container").show();               
                $("#post-container").html(data);                        
                    }
        });
        
    }
    $(document).ready(function(e){
        allPosts(0);
        
        
    });
</script>



</html>
