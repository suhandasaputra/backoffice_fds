<%-- 
    Document   : header
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<style>
    #profile {
        color: #29B19C;
        margin-top: 5px;
        margin-left: 10px;
        cursor: pointer;
    }
    #profile_img {
        height: 30px;
        width: 30px;
        /*margin-top: 3px;*/
        /*margin-left: 7px;*/
        border-radius: 50px;
    }
    #seting {
        color: #3dceb7;
        text-align: center;
        padding: 10px;
        cursor: pointer;
    }
    #seting:hover {
        background-color: #3dceb7;
        color: white;
    }

    #logout {
        color: #3dceb7;
        padding: 10px;
        text-align: center;
        cursor: pointer;
    }
    #logout:hover {
        background-color: red;
        opacity: 0.5;
        color: white;
    }




















    .cd-buttons
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup {
        position: fixed;
        left: 0;
        top: 0;
        height: 100%;
        width: 100%;
        background-color: rgba(94, 110, 141, 0.9);
        opacity: 0;
        visibility: hidden;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
        transition: opacity 0.3s 0s, visibility 0s 0.3s;
    }
    .cd-popup.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-container {
        position: relative;
        width: 90%;
        max-width: 400px;
        margin: 4em auto;
        background: #FFF;
        border-radius: .25em .25em .4em .4em;
        text-align: center;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        -webkit-transform: translateY(-40px);
        -moz-transform: translateY(-40px);
        -ms-transform: translateY(-40px);
        -o-transform: translateY(-40px);
        transform: translateY(-40px);
        /* Force Hardware Acceleration in WebKit */
        -webkit-backface-visibility: hidden;
        -webkit-transition-property: -webkit-transform;
        -moz-transition-property: -moz-transform;
        transition-property: transform;
        -webkit-transition-duration: 0.3s;
        -moz-transition-duration: 0.3s;
        transition-duration: 0.3s;
    }
    .cd-popup-container p {
        padding: 3em 1em;
    }
    .cd-popup-container .cd-buttons:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-container .cd-buttons li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-container .cd-buttons div {
        cursor: pointer;
        display: block;
        height: 60px;
        line-height: 60px;
        text-transform: uppercase;
        color: #FFF;
        -webkit-transition: background-color 0.2s;
        -moz-transition: background-color 0.2s;
        transition: background-color 0.2s;
    }
    .cd-popup-container .cd-buttons li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-container .cd-buttons li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-container .cd-buttons li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-container .cd-buttons li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-container .cd-buttons li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-container .cd-buttons li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-container .cd-popup-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-container .cd-popup-close::before, .cd-popup-container .cd-popup-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-container .cd-popup-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-container .cd-popup-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-container {
            margin: 8em auto;
        }
    }
    #waktu {
        font-size: 8px;
    }
    #user_log {
        font-size: 10px;
        color: #29B19C;
    }
    #info_log {
        font-size: 12px;
        color: #29B19C;
    }
    #useryabes {
        height: 300px;
        overflow-x: hidden;
    }
    #accset {
        color: #3dceb7;
    }
    #accset:hover {
        color: white;
    }
</style>


<script>
    jQuery(document).ready(function ($) {
        //open popup
        $('.cd-popup-trigger').on('click', function (event) {
            event.preventDefault();
            $('.cd-popup').addClass('is-visible');
        });

        //close popup
        $('.cd-popup').on('click', function (event) {
            if ($(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') || $(event.target).is('#no')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
            }
        });
        //close popup when clicking the esc keyboard button
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup').removeClass('is-visible');
            }
        });
        //action logout
        $('#yes').on('click', function (event) {
//            var xhttp = new XMLHttpRequest();
//            xhttp.onreadystatechange = function () {
//            };
//            xhttp.open("POST", "lgos", true);
//            xhttp.send();
            var a = document.getElementById('flgo');
            a.submit();
        });
    });

</script>

<!--<script>
    $(document).ready(function () {
        $.getJSON('usr_log', {}, function (data) {
            var useryabes = [];
            var useryabessum = data.length;
            var useryabessum1 = "You have " + data.length + " notification";
            for (var i = 0; i < data.length; i++) {
//            useryabes += '<li><a><div class="pull-left"><div class="person"><i class="fa fa-user fa-2x"></i></div></div><h4>' +
//                    data[i].userid
//                    + '<small><i class="fa fa-clock-o"></i>' + data[i].process_time + '</small></h4><p>' +
//                    data[i].detail_info + '</p></a></li>';



                useryabes += '<a href="#" class="dropdown-item" id="user_log"><i class="fas fa-envelope mr-2"></i>' + data[i].userid +
                        '<span class="float-right text-muted" id="waktu">' + data[i].process_time + '</span><p id="info_log">' +
                        data[i].detail_info + '</p></a><div class="dropdown-divider"></div>';



            }
            $("#useryabes").html(useryabes);
            $("span#useryabessum").html(useryabessum);
            $("span#useryabessum1").html(useryabessum1);
        });
    });
</script>-->



<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
    </ul>


    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="far fa-bell"></i>
                <span class="badge badge-warning navbar-badge" id="useryabessum"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-item dropdown-header" id="useryabessum1"></span>
                <div class="dropdown-divider"></div>
                <div id="useryabes"></div>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
            </div>
        </li>


        <!--start profile-->
        <li>
            <div class="dropdown">
                <div id="profile" data-toggle="dropdown">
                    <span class="hidden-xs">${sessionScope.user_name}</span>
                    <img src="img/pas photo.jpg" alt="User Image" id="profile_img"/>
                </div>
                <ul class="dropdown-menu dropdown-menu-right">
                    <!--<li id="seting">Role: ${sessionScope.userlevel}</li>-->
                    <li id="seting"><a href="usr" id="accset">Account Setting</a></li>
                    <!--<li id="seting">Feedback</li>-->
                    <li id="logout" class="cd-popup-trigger">Logout</li>
                </ul>
            </div>
        </li>
        <!--end profile-->
    </ul>
    <!--logout popup-->
    <div class="cd-popup" role="alert">
        <div class="cd-popup-container">
            <p>Are you sure want to logout?</p>
            <ul class="cd-buttons">
                <li><div id="yes">Yes</div></li>
                <li><div id="no">No</div></li>
            </ul>
            <a href="#0" class="cd-popup-close img-replace">Close</a>
        </div>
    </div>
    <!--logout popup end-->

    <form action="lgos" method="post" id="flgo" class="hidden-xs">
    </form>
</nav>

