<%-- 
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-add-category
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-add-category {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-category {
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
    .cd-popup-add-category.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-category-container {
        position: relative;
        width: 100%;
        height: -webkit-fill-available;
        /*max-width: 500px;*/
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

    .cd-popup-add-category-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-add-category-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-add-category-container .cd-buttons-add-category div {
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
    .cd-popup-add-category-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-add-category-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-add-category-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-add-category-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-add-category-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-add-category-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-add-category-container .cd-popup-add-category-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-category-container .cd-popup-add-category-close::before, .cd-popup-add-category-container .cd-popup-add-category-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-category-container .cd-popup-add-category-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-category-container .cd-popup-add-category-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-category-container {
        margin-left: 260px;
        width: 80%;
        height: 87%;
        margin-top: 70px;
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-category-container {
            margin: 8em auto;
        }
    }
    #label_add_category {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_category{
        /*background-color: red;*/
        color: gray;
        display: flex;
        justify-content: center;
        height: 180px;
    }
    #boxz_category{
        /*background-color: green;*/
        color: gray;
        display: flex;
        justify-content: center;
        /*height: 260px;*/
    }
    #box1_category {
        width: 150px;
        height: 200px;
        margin-right: 5px;
        border-radius: 5px;
        /*background-color: blue;*/
    }
    #box2_category {
        width: 350px;
        height: 200px;
        margin-right: 50px;
        border-radius: 5px;

    }
    #box3_category {
        width: 150px;
        height: 270px;
        margin-right: 5px;
        border-radius: 5px;
        visibility: hidden;

    }
    #box4_category {
        width: 350px;
        height: 270px;
        margin-right: 5px;
        border-radius: 5px;
        visibility: hidden;

    }
    #box5_category {
        width: 700px;
        height: 70px;
        margin-right: 5px;
        border-radius: 5px;
        /*margin-left: 30px;*/
    }
    #box6_category {
        width: 150px;
        height: 200px;
        margin-right: 5px;
        border-radius: 5px;

    }
    input {
        color: gray;
        padding-left: 10px;
        border: 1px solid #CCC; 
        border-radius: 3px;
        width: 100%;
        margin-bottom: 5px;
    }
    textarea {
        padding-left: 10px;
        border-radius: 3px;
        width: 100%;
        margin-top: 10px;
        height: 115px;
    }
    #buttonon {
        display: -webkit-inline-box;
        /*background-color: yellow;*/
        color: white;
        margin-top: 60px;
        margin-left: -550px;
    }
    #btn_cancel {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_save_conn {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }

    #btn_cancel:hover {
        background-color: #CCC;
    }
    #btn_save_conn:hover {
        background-color: #CCC;
    }
    .image-upload > input {
        visibility:hidden;
        width:0;
        height:0
    }
    #panel_img {
        margin: 15px;
        height: 300px;
        width: 430px;
        background-color: white;
    }
    #blah {
        width: 430px;;
        height: 300px;
    }
    #btn_upl {
        width: 100px;
    }
    #img_filechooser_category {
        width: 215px;
        height: 200px;
    }

</style>


<script>
    jQuery(document).ready(function ($) {
        //open popup add category
        $('#add_category_text').on('click', function (event) {
            event.preventDefault();
            $('.cd-popup-add-category').addClass('is-visible');
        });
        //close popup add category
        $('.cd-popup-add-category').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-category-close') || $(event.target).is('.cd-popup-add-category') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                document.getElementById("box3_category").style.visibility = "hidden";
                document.getElementById("box4_category").style.visibility = "hidden";
            }
        });
        //close popup when clicking the esc keyboard button add category
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-category').removeClass('is-visible');
                document.getElementById("box3_category").style.visibility = "hidden";
                document.getElementById("box4_category").style.visibility = "hidden";
            }
        });
    });</script>
<div class="cd-popup-add-category" role="alert">
    <div class="cd-popup-add-category-container">
        <label id="label_add_category">Add Connection</label>
        <form action="cos?action=addconn" id="form_add_conn" method="post">
            <div id="myModal_add_cate" class="modal">
                <div class="modal-content">
                    <span class="close_add_cate">&times;</span>
                    <div id="push_text_add_cate"></div>
                </div>
            </div>
            <div id="boxx_category">
                <div id="box1_category">
                    <input type="text" readonly="" value="To Direct">
                    <br>
                    <input type="text" readonly="" value="Host">
                    <br>
                    <input type="text" readonly="" value="Port">
                    <br>
                    <input type="text" readonly="" value="Channel ID">
                    <br>
                    <input type="text" readonly="" value="Conn Name">
                    <br>
                    <input type="text" readonly="" value="App As">
                    <br>
                    <input type="text" readonly="" value="Package Msg">
                </div>
                <div id="box2_category">
                    <!--<input type="text" id="seq" name="seq" required="" placeholder="1" maxlength="3">-->
                    <select name="todirect" id="todirect" style="
                            width: 215px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="web">Web</option>
                        <option value="socket">Socket</option>
                    </select>
                    <input type="text" id="host" name="host" required="" placeholder="127.0.0.1" maxlength="50">
                    <input type="text" id="port" name="port" required="" placeholder="17000" maxlength="6">
                    <input type="text" id="bankcode" name="bankcode" required="" placeholder="BCA" maxlength="5">
                    <input type="text" id="conname" name="conname" required="" placeholder="IB" maxlength="30">
                    <select name="typeapp" id="typeapp" style="
                            width: 215px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="C">Client</option>
                        <option value="S">Server</option>
                    </select>
                    <select name="packagename" id="packagename" style="
                            width: 215px;
                            border-radius: 3px;
                            margin-bottom: 8px;" onchange="funcMessage()">
                        <option selected disabled>Choose message type</option>
                        <option value="json_adp">json</option>
                        <option value="xml_adp">xml</option>
                        <option value="iso_adp">iso</option>
                    </select>
                </div>
                <!--<div id="ggwp" style="width: 700px; height: 300px; background-color: green">-->
                <div id="box3_category">
                    <input type="text" readonly="" value="Header Type">
                    <br>
                    <input type="text" readonly="" value="Length incl">
                    <br>
                    <input type="text" readonly="" value="Package Path">
                    <br>
                    <input type="text" readonly="" value="Status Open">
                    <br>
                    <input type="text" readonly="" value="Auto Signon">
                    <br>
                    <input type="text" readonly="" value="Need Signon">
                    <br>
                    <input type="text" readonly="" value="Load Balancing">
                    <br>
                    <input type="text" readonly="" value="Group LB">
                </div>
                <div id="box4_category">
                    <select name="headertype" id="headertype" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="1">4 length byte</option>
                        <option value="2">STX/ETX</option>
                        <option value="3">2 hexa byte hi-low</option>
                        <option value="4">2 hexa byte low-hi</option>
                    </select>
                    <select name="lengthincl" id="lengthincl" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>

                    </select>
                    <input type="text" id="packagerpath" name="packagerpath" required="" placeholder="http://localhost:90/opt/iso87ascii.xml" maxlength="100">
                    <select name="statusopen" id="statusopen" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>

                    </select>
                    <select name="autosignon" id="autosignon" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>

                    </select>
                    <select name="needsignon" id="needsignon" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>

                    </select>
                    <select name="loadbalancing" id="loadbalancing" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>

                    </select>
                    <input type="text" id="lbgroup" name="lbgroup" required="" placeholder="group1" maxlength="10">
                </div>
                <!--</div>-->
            </div>
            <div id="msgbox"></div>
            <div id="buttonon">
                <div id="btn_cancel">Cancel</div>
                <div id="btn_save_conn">Save</div>
            </div>
        </form>
        <a href="#0" class="cd-popup-add-category-close img-replace-add-category">Close</a>
    </div>
</div>
<script>
    jQuery(document).ready(function ($) {
        $('#btn_save_conn').on('click', function (event) {
            var todirect = document.getElementById('todirect').value;
            var host = document.getElementById('host').value;
            var port = document.getElementById('port').value;
            var bankcode = document.getElementById('bankcode').value;
            var conname = document.getElementById('conname').value;
            var packagename = document.getElementById('packagename').value;
            var typeapp = document.getElementById('typeapp').value;
            var headertype = document.getElementById('headertype').value;
            var lengthincl = document.getElementById('lengthincl').value;
            var packagerpath = document.getElementById('packagerpath').value;
            var statusopen = document.getElementById('statusopen').value;
            var autosignon = document.getElementById('autosignon').value;
            var needsignon = document.getElementById('needsignon').value;
            var loadbalancing = document.getElementById('loadbalancing').value;
            var lbgroup = document.getElementById('lbgroup').value;
            var modal = document.getElementById("myModal_add_cate");
            var span = document.getElementsByClassName("close_add_cate")[0];
            var push = document.getElementById("push_text_add_cate");
            if (todirect == "") {
                push.innerHTML = "<p>todirect must be Fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (todirect != "") {
                if (host == "") {
                    push.innerHTML = "<p>host must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (host != "") {
                    if (port == "") {
                        push.innerHTML = "<p>port must be fill</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (port != "") {
                        if (bankcode == "") {
                            push.innerHTML = "<p>chanel id must be fill</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (bankcode != "") {
                            if (conname == "") {
                                push.innerHTML = "<p>conname must be fill</p>";
                                modal.style.display = "block";
                                span.onclick = function () {
                                    modal.style.display = "none";
                                }
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                }
                            } else if (conname != "") {
                                if (packagename == "") {
                                    push.innerHTML = "<p>package msg must be fill</p>";
                                    modal.style.display = "block";
                                    span.onclick = function () {
                                        modal.style.display = "none";
                                    }
                                    window.onclick = function (event) {
                                        if (event.target == modal) {
                                            modal.style.display = "none";
                                        }
                                    }
                                } else if (packagename != "") {
                                    if (headertype == "") {
                                        push.innerHTML = "<p>headertype must be fill</p>";
                                        modal.style.display = "block";
                                        span.onclick = function () {
                                            modal.style.display = "none";
                                        }
                                        window.onclick = function (event) {
                                            if (event.target == modal) {
                                                modal.style.display = "none";
                                            }
                                        }
                                    } else if (headertype != "") {
                                        if (lengthincl == "") {
                                            push.innerHTML = "<p>length include must be fill</p>";
                                            modal.style.display = "block";
                                            span.onclick = function () {
                                                modal.style.display = "none";
                                            }
                                            window.onclick = function (event) {
                                                if (event.target == modal) {
                                                    modal.style.display = "none";
                                                }
                                            }
                                        } else if (lengthincl != "") {
                                            if (packagerpath == "" && packagename == "iso_adp") {
                                                push.innerHTML = "<p>package path must be fill</p>";
                                                modal.style.display = "block";
                                                span.onclick = function () {
                                                    modal.style.display = "none";
                                                }
                                                window.onclick = function (event) {
                                                    if (event.target == modal) {
                                                        modal.style.display = "none";
                                                    }
                                                }
                                            } else if (packagerpath != "" || packagerpath == "" && packagename == "json_adp" || packagerpath == "" && packagename == "xml_adp") {
                                                if (statusopen == "") {
                                                    push.innerHTML = "<p>statusopen must be fill</p>";
                                                    modal.style.display = "block";
                                                    span.onclick = function () {
                                                        modal.style.display = "none";
                                                    }
                                                    window.onclick = function (event) {
                                                        if (event.target == modal) {
                                                            modal.style.display = "none";
                                                        }
                                                    }
                                                } else if (statusopen != "") {
                                                    if (autosignon == "") {
                                                        push.innerHTML = "<p>autosignon must be fill</p>";
                                                        modal.style.display = "block";
                                                        span.onclick = function () {
                                                            modal.style.display = "none";
                                                        }
                                                        window.onclick = function (event) {
                                                            if (event.target == modal) {
                                                                modal.style.display = "none";
                                                            }
                                                        }
                                                    } else if (autosignon != "") {
                                                        if (autosignon == "") {
                                                            push.innerHTML = "<p>autosignon must be fill</p>";
                                                            modal.style.display = "block";
                                                            span.onclick = function () {
                                                                modal.style.display = "none";
                                                            }
                                                            window.onclick = function (event) {
                                                                if (event.target == modal) {
                                                                    modal.style.display = "none";
                                                                }
                                                            }
                                                        } else if (autosignon != "") {
                                                            if (needsignon == "") {
                                                                push.innerHTML = "<p>needsignon must be fill</p>";
                                                                modal.style.display = "block";
                                                                span.onclick = function () {
                                                                    modal.style.display = "none";
                                                                }
                                                                window.onclick = function (event) {
                                                                    if (event.target == modal) {
                                                                        modal.style.display = "none";
                                                                    }
                                                                }
                                                            } else if (needsignon != "") {
                                                                if (loadbalancing == "") {
                                                                    push.innerHTML = "<p>loadbalancing must be fill</p>";
                                                                    modal.style.display = "block";
                                                                    span.onclick = function () {
                                                                        modal.style.display = "none";
                                                                    }
                                                                    window.onclick = function (event) {
                                                                        if (event.target == modal) {
                                                                            modal.style.display = "none";
                                                                        }
                                                                    }
                                                                } else if (loadbalancing != "") {
                                                                    if (lbgroup == "" && packagename == "iso_adp") {
                                                                        push.innerHTML = "<p>lbgroup must be fill</p>";
                                                                        modal.style.display = "block";
                                                                        span.onclick = function () {
                                                                            modal.style.display = "none";
                                                                        }
                                                                        window.onclick = function (event) {
                                                                            if (event.target == modal) {
                                                                                modal.style.display = "none";
                                                                            }
                                                                        }
                                                                    } else if (lbgroup != "" || lbgroup == "" && packagename == "json_adp" || lbgroup == "" && packagename == "xml_adp") {
                                                                        var form_add_cate = document.getElementById('form_add_conn');
                                                                        form_add_cate.submit();
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });
    });
    function funcMessage() {
        var content_of_msg = document.getElementById("packagename").value;
        if (content_of_msg === 'iso_adp') {
            document.getElementById("box3_category").style.visibility = "visible";
            document.getElementById("box4_category").style.visibility = "visible";
        } else if (content_of_msg === 'json_adp') {
            document.getElementById("box3_category").style.visibility = "hidden";
            document.getElementById("box4_category").style.visibility = "hidden";
        } else if (content_of_msg === 'xml_adp') {
            document.getElementById("box3_category").style.visibility = "hidden";
            document.getElementById("box4_category").style.visibility = "hidden";
        }
    }
</script>