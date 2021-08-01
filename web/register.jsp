<%-- 
    Document   : register
    Created on : 28-Jul-2021, 5:12:13 pm
    Author     : amrit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <style>
        .banner{
            clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 79% 85%, 47% 100%, 26% 86%, 0 100%, 0% 35%, 0 0);

        }

        .has_error{
            display: none;
        }
    </style>
    <body>
        <%@include file="navbar.jsp" %>
        <br>
        <main class='d-flex align-items-center  navbar_bg banner' style="height: 95vh;padding-bottom: 50px">
            <div class='container'>
                <div class='row'>
                    <div class='col-md-4 offset-md-4'>
                        <div class='card'>
                            <div class='card-header navbar_bg text-white text-centre'>
                                <span class='fa fa-user-plus fa-2x'></span>
                                Sign up
                            </div>
                            <div class="card-body">
                                <form id ="register" action="RegisterServlet" method="post">
                                    <div class="form-group">
                                        <label for="user_name">User name:</label>
                                        <input type="text" class="form-control user_name validate" errorMSG="Please your name" id="user_name" placeholder="Enter user_name" name="user_name" >
                                        <small class="name_has_error has_error"> </small>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control validate" id="email" placeholder="Enter email address" errorMSG="Enter Your Name" name="email">
                                    </div>

                                    <div class="form-group">
                                        <label for="pwd">Password:</label>
                                        <input type="password" class="form-control validate" id="pwd" placeholder="Enter password" name="password" errorMSG="Enter password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Select Gender :</label>
                                        <input type="radio" id='male' name="gender" value ="male"  checked>Male
                                        <input type="radio" id='female'  name="gender" value="female" >Female
                                    </div>
                                    <div class="form-group">
                                        <label for="info">Description</label>
                                        <textarea class="form-control validate" rows="1" id="info" errorMSG ="Enter Something about yourself" name="description" ></textarea>
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
                </div
            </div>
        </main>

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
    <script>
        $(document).ready(function () {
            $("#register").on('submit', function (event) {
                event.preventDefault();
                var gen = $('.rem').is(":checked");
                var error = true;
                if (!gen) {
                    swal("Error", "please agree on terms and conditions", "error");
                    error = false;
//                    return false;
                }

                if (error && validation())
                {
                    let formdata = new FormData(this);
                    $.ajax({
                        url: "RegisterServlet",
                        method: 'post',
                        data: formdata,
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            console.log(data);
                            if (data == "condition") {
                                swal("Error", "please agree on terms and conditions", "error");


                            }
                            if (data == "true") {
                                swal({
                                    title: "Good job!",
                                    text: "User Registered Successfully. Redirecting to login page.",
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
                                    window.location = "login.jsp";
                                }
                            }


                            if (data === "false") {
                                swal("Error", "Something went Wrong", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                        }

                    })
                }
            })
        })

    </script>


</html>
