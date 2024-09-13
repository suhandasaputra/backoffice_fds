<%-- 
    Document   : login
    Created on : 09-Oct-2020, 10:39:58
    Author     : matajari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='defaultextend.jsp'%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FDS</title>
        <style>
            body{
                background-color: aquamarine;
            }
            #login_panel{
                display: block;
                margin-top: 50px;
                margin-left: auto;
                margin-right: auto;
                height: 500px;
                width: 300px;
                background-color: white;
                border-radius: 10px;
            }
            #login_header{
                font-family: fantasy;
                text-align: center;
                padding-top: 30px;
                font-size: 22px;

            }
            #img_mdw{
                margin-top: -50px;
            }

            #user_label{
                margin-bottom: -4px;
                font-size: 16px;

            }
            #password_label{
                margin-top: 10px;
                margin-bottom: -4px;
                font-size: 16px;
            }
            #user{
                width: 230px;
                font-family: sans-serif;
                font-size: 14px;
                height: 30px;
                border-radius: 7px;
                padding-left: 15px;
            }
            #pass{
                width: 230px;
                font-family: sans-serif;
                font-size: 14px;
                height: 30px;
                border-radius: 7px;
                padding-left: 15px;
            }
            #login_button{
                height: 40px;
                width: 233px;
                border-radius: 7px;
                color: white;
                background-color: darkcyan;
            }





            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */

            }

            /* Modal Content */
            .modal-content {
                width: 150px;
                display: inline-block;
                background-color: darkcyan;
                margin-top: 20px;
                padding: 20px;
                border: 1px solid white;
                padding-top: 4px;
                /*padding-left: -70px;*/
                color: white;
                font-weight: 100;
                font-size: 14px;
                border-radius: 7px;
            }
            /* The Close Button */
            .close {
                /*padding-top: -10px;*/
                color: white;
                float: right;
                font-size: 14px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>

    </head>
    <body>
        <div id="login_panel">
            <div id="login_header">
                WELCOME
                <div style="margin-top: 30px; margin-bottom: 30px">
                    <!--<img id="img_mdw" src="img/mdw_image.pg" alt="img">-->FRAUD DETECTION SYSTEM
                </div>
                <form id="form_login">
                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <div id="push_text"></div>
                        </div>
                    </div>
                    <div id="user_label">
                        USER
                    </div>
                    <div id="box_user">
                        <input type="text" id="user" name="user" maxlength="50">
                    </div>
                    <div id="password_label">
                        PASSWORD
                    </div>
                    <div id="box_pass">
                        <input type="password" id="pass" name="pass" maxlength="20">
                    </div>
                    <br>
                    <div id="box_login_btn">
                        <input type="button" id="login_button" value="LOGIN" onclick="login()">
                    </div>
                </form>
                <script>
                    var input = document.getElementById("pass");
                    input.addEventListener("keyup", function (event) {
                        if (event.keyCode === 13) {
                            event.preventDefault();
                            document.getElementById("login_button").click();
                        }
                    });

                    function login() {
                        var user = document.getElementById("user").value;
                        var pass = document.getElementById("pass").value;
                        var modal = document.getElementById("myModal");
                        var span = document.getElementsByClassName("close")[0];
                        var push = document.getElementById("push_text");
                        ;
                        if (user == "") {
                            push.innerHTML = "<p>USER must be fill</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (user != "") {
                            if (pass == "") {
                                push.innerHTML = "<p>Password must be fill</p>";
                                modal.style.display = "block";
                                span.onclick = function () {
                                    modal.style.display = "none";
                                };
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                };
                            } else if (pass != "") {
                                axios.post('lgs', {
                                    username: user,
                                    password: pass
                                })
                                        .then(res => {
                                            if (res.data.present == '1') {
                                                if (res.data.user_status == '1') {
                                                    if (res.data.pass == '1') {
                                                        if (res.data.status_login == '0') {
                                                            window.location = 'dashboard.jsp';
                                                        } else {
                                                            alert('user sedang login di device lain');
                                                        }
                                                    } else {
                                                        alert('password salah');
                                                    }
                                                } else {
                                                    alert('user tidak aktif');
                                                }
                                            } else {
                                                alert('user tidak terdaftar');
                                            }
                                        })
                                        .catch(err => {
                                            alert('error : ' + err);
                                        });
                            }
                        }
                    }
                </script>
            </div>
        </div>
    </body>
</html>
