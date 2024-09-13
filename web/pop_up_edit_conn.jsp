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

    .img-replace-edit-category {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-edit-connection {
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
    .cd-popup-edit-connection.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-connection-container {
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

    .cd-popup-edit-connection-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-connection-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-connection-container .cd-buttons-add-category div {
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
    .cd-popup-edit-connection-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-connection-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-connection-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-connection-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-connection-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-connection-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-connection-container .cd-popup-edit-connection-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-connection-container .cd-popup-edit-connection-close::before, .cd-popup-edit-connection-container .cd-popup-edit-connection-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-connection-container .cd-popup-edit-connection-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-connection-container .cd-popup-edit-connection-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-connection-container {
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
        .cd-popup-edit-connection-container {
            margin: 8em auto;
        }
    }
    #label_edit_category {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_edit_category{
        color: gray;
        display: flex;
        justify-content: center;
        height: 180px;
    }
    #boxz_edit_category{
        /*background-color: green;*/
        color: gray;
        display: flex;
        justify-content: center;
        /*height: 260px;*/
    }
    #box1_edit_category {
        width: 150px;
        height: 200px;
        margin-right: 5px;
        border-radius: 5px;
    }
    #box2_edit_category {
        width: 350px;
        height: 200px;
        margin-right: 50px;
        border-radius: 5px;

    }
    #box3_edit_category {
        width: 150px;
        height: 270px;
        margin-right: 5px;
        border-radius: 5px;
        /*visibility: hidden;*/

    }
    #box4_edit_category {
        width: 350px;
        height: 270px;
        margin-right: 5px;
        border-radius: 5px;
        /*visibility: hidden;*/

    }
    #box5_edit_category {
        width: 700px;
        height: 70px;
        margin-right: 5px;
        border-radius: 5px;
        /*margin-left: 30px;*/
    }
    #box6_edit_category {
        width: 150px;
        height: 200px;
        margin-right: 5px;
        border-radius: 5px;

    }
    input {
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
    #buttonon_edit_category {
        /*        justify-content: center;
                color: white;
                margin-top: 10px;
                display: flex;*/
        display: -webkit-inline-box;
        color: white;
        margin-top: 60px;
        margin-left: -550px;
    }
    #btn_cancel_edit_category {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_save_edit_category {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }

    #btn_cancel_edit_category:hover {
        background-color: #CCC;
    }
    #btn_save_edit_category:hover {
        background-color: #CCC;
    }

    /* The Close Button */
    .close_edit_category {
        padding-top: -10px;
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_category:hover,
    .close_edit_category:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }


    #btn_del_edit_category {
        cursor: pointer;
        width: 135px;
        height: 35px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        border-radius: 3px;
    }
    #btn_del_edit_category:hover {
        background-color: #c52d18;
        color: white;
    }

    #btn_edit_message:hover {
        background-color: #CCC;
    }
    #btn_edit_message {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }
</style>


<script>
    jQuery(document).ready(function ($) {
// Add event listener for opening and closing details
        $('#table_conn').on('click', 'td', function () {
            var $row = $(this).closest("tr");
            var data = $('#table_conn').DataTable().row($row).data();

            var seq = data['seq'];
            var todirect = $row.find(".todirect").text();
            var host = $row.find(".host").text();
            var port = $row.find(".port").text();
            var statusopen = $row.find(".statusopen").text();
            var statusstart = data['statusstart'];
            var statusconnect = data['statusconnect'];
            var headertype = data['headertype'];
            var bankcode = $row.find(".bankcode").text();
            var lengthincl = data['lengthincl'];
            var typeapp = $row.find(".typeapp").text();
            var conname = $row.find(".conname").text();
            var packagename = $row.find(".packagename").text();
            var autosignon = data['autosignon'];
            var needsignon = data['needsignon'];
            var packagerpath = data['packagerpath'];
            var loadbalancing = data['loadbalancing'];
            var lbgroup = data['lbgroup'];

            document.getElementById("seq1").value = seq;
            document.getElementById("todirect1").value = todirect;
            document.getElementById("host1").value = host;
            document.getElementById("port1").value = port;
            var sts;
            if (statusopen == 't') {
                sts = 1;
            } else if (statusopen == 'f') {
                sts = 0;
            }
            document.getElementById("statusopen1").value = sts;
//            document.getElementById("statusstart1").value = statusstart;
//            document.getElementById("statusconnect1").value = statusconnect;
            document.getElementById("headertype1").value = headertype;
            document.getElementById("bankcode1").value = bankcode;
            var lgt;
            if (lengthincl == 't') {
                lgt = 1;
            } else if (lengthincl == 'f') {
                lgt = 0;
            }
            document.getElementById("lengthincl1").value = lgt;
            document.getElementById("typeapp1").value = typeapp;
            document.getElementById("conname1").value = conname;
            document.getElementById("packagename1").value = packagename;
            var asg;
            if (autosignon == 't') {
                asg = 1;
            } else if (autosignon == 'f') {
                asg = 0;
            }
            document.getElementById("autosignon1").value = asg;
            var nsg;
            if (needsignon == 't') {
                nsg = 1;
            } else if (needsignon == 'f') {
                nsg = 0;
            }
            document.getElementById("needsignon1").value = nsg;
            document.getElementById("packagerpath1").value = packagerpath;
            var lbc;
            if (loadbalancing == 't') {
                lbc = 1;
            } else if (loadbalancing == 'f') {
                lbc = 0;
            }
            document.getElementById("loadbalancing1").value = lbc;
            document.getElementById("lbgroup1").value = lbgroup;

            $('.cd-popup-edit-connection').addClass('is-visible');















            //hide and show additional box suhanda
            var content_of_msg_edit = document.getElementById("packagename1").value;
            if (content_of_msg_edit === 'iso_adp') {
                document.getElementById("box3_edit_category").style.visibility = "visible";
                document.getElementById("box4_edit_category").style.visibility = "visible";
            } else if (content_of_msg_edit === 'json_adp') {
                document.getElementById("box3_edit_category").style.visibility = "hidden";
                document.getElementById("box4_edit_category").style.visibility = "hidden";
            } else if (content_of_msg_edit === 'xml_adp') {
                document.getElementById("box3_edit_category").style.visibility = "hidden";
                document.getElementById("box4_edit_category").style.visibility = "hidden";
            }
        });
        //close popup pro    vide password
        $('.cd-popup-edit-connection').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-connection-close') || $(event.target).is('.cd-popup-edit-connection') || $(event.target).is('#btn_cancel_edit_category')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                document.getElementById("box3_edit_category").style.visibility = "hidden";
                document.getElementById("box4_edit_category").style.visibility = "hidden";
            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-connection').removeClass('is-visible');
                document.getElementById("box3_edit_category").style.visibility = "hidden";
                document.getElementById("box4_edit_category").style.visibility = "hidden";
            }
        });
    });
</script>
<div class="cd-popup-edit-connection" role="alert">
    <div class="cd-popup-edit-connection-container" style="color: #29B19C;">
        <label id="label_edit_category">Edit Connection</label>
        <form>
            <div id="myModal_edit_cate" class="modal">
                <div class="modal-content">
                    <span class="close_edit_cate">&times;</span>
                    <div id="push_text_edit_cate"></div>
                </div>
            </div>
            <div id="boxx_edit_category">
                <div id="box1_edit_category">
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
                <div id="box2_edit_category">
                    <input type="text" id="seq1" name="seq1" hidden="" required="" placeholder="127.0.0.1" maxlength="50">
                    <input type="text" id="todirect1" name="todirect1" readonly="" required="" placeholder="127.0.0.1" maxlength="50" style="background-color: aquamarine">
                    <input type="text" id="host1" name="host1" required="" placeholder="127.0.0.1" maxlength="50">
                    <input type="text" id="port1" name="port1" required="" placeholder="17000" maxlength="6">
                    <input type="text" id="bankcode1" name="bankcode1" readonly="" required="" placeholder="BCA" maxlength="5" style="background-color: aquamarine">
                    <input type="text" id="conname1" name="conname1" required="" placeholder="IB" maxlength="30">
                    <select name="typeapp1" id="typeapp1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="C">Client</option>
                        <option value="S">Server</option>
                    </select>                    
                    <select name="packagename1" id="packagename1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="iso_adp">iso</option>
                        <option value="json_adp">json</option>
                        <option value="xml_adp">xml</option>
                    </select>
                </div>
                <div id="box3_edit_category">
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
                <div id="box4_edit_category">
                    <select name="headertype1" id="headertype1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="1">4 length byte</option>
                        <option value="2">STX/ETX</option>
                        <option value="3">2 hexa byte hi-low</option>
                        <option value="4">2 hexa byte low-hi</option>
                    </select>
                    <select name="lengthincl1" id="lengthincl1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>
                        
                    </select>
                    <input type="text" id="packagerpath1" name="packagerpath1" required="" placeholder="http://localhost:90/opt/iso87ascii.xml" maxlength="100">
                    <select name="statusopen1" id="statusopen1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>
                    </select>
                    <select name="autosignon1" id="autosignon1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>
                    </select>
                    <select name="needsignon1" id="needsignon1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>
                        
                    </select>
                    <select name="loadbalancing1" id="loadbalancing1" style="
                            width: 350px;
                            border-radius: 3px;
                            margin-bottom: 8px;">
                        <option value="0">FALSE</option>
                        <option value="1">TRUE</option>
                        
                    </select>
                    <input type="text" id="lbgroup1" name="lbgroup1" required="" placeholder="group1" maxlength="10">
                </div>
            </div>
            <div id="msgbox"></div>
            <div id="buttonon_edit_category">
                <div id="btn_cancel_edit_category">Cancel</div>
                <div id="btn_del_edit_category" onclick="sub_del_conn()">Delete</div>
                <div id="btn_save_edit_category">Update</div>
                <div id="btn_edit_message">Message</div>
            </div>

        </form>
        <a href="#0" class="cd-popup-edit-connection-close img-replace-edit-category">Close</a>
    </div>
</div>




<script>
    function sub_del_conn() {
        var todir = document.getElementById("todirect1").value;
        var sequel = document.getElementById("seq1").value;
        var bankcode = document.getElementById("bankcode1").value;
        var modal = document.getElementById("myModal_edit_cate");
        var span = document.getElementsByClassName("close_edit_cate")[0];
        var push = document.getElementById("push_text_edit_cate");
        if (sequel == "") {
            push.innerHTML = "<p>id must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (sequel != "") {
            if (todir == "") {
                push.innerHTML = "<p>to direct be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (todir != "") {
                var datjson3 = new Object();
                datjson3.sequel = sequel;
                datjson3.todir = todir;
                datjson3.bankcode = bankcode;
                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "dcon",
                    data: JSON.stringify(datjson3),
                    type: 'post',
                    success: function (response) {
                        if (response.status == 00) {
                            alert('success delete connection');
                            window.location.href = "con";
                        } else {
                            alert('failed delete connection');
                        }
                    }
                });
            }
        }
    }





    jQuery(document).ready(function ($) {
        $('#btn_save_edit_category').on('click', function (event) {

            var seq = document.getElementById("seq1").value;
            var todirect = document.getElementById("todirect1").value;
            var host = document.getElementById("host1").value;
            var port = document.getElementById("port1").value;
            var statusopen = document.getElementById("statusopen1").value;
            var headertype = document.getElementById("headertype1").value;
            var bankcode = document.getElementById("bankcode1").value;
            var lengthincl = document.getElementById("lengthincl1").value;
            var typeapp = document.getElementById("typeapp1").value;
            var conname = document.getElementById("conname1").value;
            var packagename = document.getElementById("packagename1").value;
            var autosignon = document.getElementById("autosignon1").value;
            var needsignon = document.getElementById("needsignon1").value;
            var packagerpath = document.getElementById("packagerpath1").value;
            var loadbalancing = document.getElementById("loadbalancing1").value;
            var lbgroup = document.getElementById("lbgroup1").value;





            var modal = document.getElementById("myModal_edit_cate");
            var span = document.getElementsByClassName("close_edit_cate")[0];
            var push = document.getElementById("push_text_edit_cate");

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
//                                            if (packagerpath == "") {
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
//                                            } else if (packagerpath != "") {
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
//                                                                    if (lbgroup == "") {
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
//                                                                    } else if (lbgroup != "") {
                                                                        var datjson4 = new Object();
                                                                        datjson4.seq = seq;
                                                                        datjson4.todirect = todirect;
                                                                        datjson4.host = host;
                                                                        datjson4.port = port;
                                                                        datjson4.statusopen = statusopen;
                                                                        datjson4.headertype = headertype;
                                                                        datjson4.bankcode = bankcode;
                                                                        datjson4.lengthincl = lengthincl;
                                                                        datjson4.typeapp = typeapp;
                                                                        datjson4.conname = conname;
                                                                        datjson4.packagename = packagename;
                                                                        datjson4.autosignon = autosignon;
                                                                        datjson4.needsignon = needsignon;
                                                                        datjson4.packagerpath = packagerpath;
                                                                        datjson4.loadbalancing = loadbalancing;
                                                                        datjson4.lbgroup = lbgroup;

                                                                        $.ajax({
                                                                            contentType: 'application/json',
                                                                            dataType: "json",
                                                                            url: "ucon",
                                                                            data: JSON.stringify(datjson4),
                                                                            type: 'post',
                                                                            success: function (response) {
                                                                                if (response.status == 00) {
                                                                                    alert('success update Connection');
                                                                                    window.location.href = "con";
                                                                                } else {
                                                                                    alert('failed update Connection');
                                                                                }
                                                                            }
                                                                        });
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
</script>