<%-- 
    Document   : login
    Created on : 28-Jul-2021, 4:34:17 pm
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
    </style>
    <body>
        <%@include file="navbar.jsp" %>
        <br>
        <main class='d-flex align-items-center  navbar_bg banner' style="height: 70vh">
            <div class='container'>
                <div class='row'>
                    <div class='col-md-4 offset-md-4'>
                        <div class='card'>
                            <div class='card-header navbar_bg text-white text-centre'>
                                <span class='fa fa-user-circle-o fa-2x'></span>
                                Login here
                            </div>
                            <div class="card-body">
                                <form id="login" method="post">
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control validate" errorMSG="Please enter email address" id="email" placeholder="Enter email" name="email">
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd">Password:</label>
                                        <input type="password" class="form-control validate" errorMSG="Please your password" id="pwd" placeholder="Enter password" name="password">
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input validate rem" errorMSG="Please check remember me" type="checkbox" name="remember"> Remember me
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
            $("#login").on('submit', function (event) {
                event.preventDefault();
//                console.log("amrit");
                var gen = $('.rem').is(":checked");
                var error = true;
                if (!gen) {
                    swal("Error", "please check the remember", "error");
                    error = false;
//                    return false;
                }

                if (error && validation())
                {
                    let formdata = new FormData(this);
                    $.ajax({
                        url: "LoginServlet",
                        method: 'post',
                        data: formdata,
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            console.log(data);
                            if (data == "fail") {
                                swal("Error", "Wrong Email Id or Password !! Try Again", "error");
                                setTimeout(delay, 3000);
                                function delay() {
                                    window.location = "profile.jsp";
                                }
                            }
                            
                            if (data == "success") {
                                swal({
                                    title: "Good job!",
                                    text: "Login Successfully. Redirecting to your Profile.",
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


//                            
                        },
//                        
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                        }

                    });
                }
            });
        });

    </script>
</html>
