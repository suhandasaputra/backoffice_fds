<%-- 
    Document   : dashboard
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@include file='defaultextend.jsp'%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>FDS</title>
        <style>
            .card {
                background-color: white;
            }
            .add_category {                
                display: inline-block;

            }

            th {
                background-color: #CCC;
            }


            #table_conn th {
                font-size: 12px;
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_conn td {
                font-size: 12px;
            }
        </style>
        <script>
            $(document).ready(function () {
                var table = $('#table_conn').DataTable({
                    "ajax": {
                        "url": "/bo_mdw/cos",
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"
                    },
                    "columns": [
                        {data: "seq",
                            "className": 'seq'
                        },
                        {data: "todirect",
                            "className": 'todirect'
                        },
                        {data: "host",
                            "className": 'host'
                        },
                        {data: "port",
                            "className": 'port'
                        },
                        {data: "statusopen",
                            "className": 'statusopen'
                        },
                        {data: "statusstart",
                            "className": 'statusstart',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "headertype",
                            "className": 'headertype',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "bankcode",
                            "className": 'bankcode'
                        },
                        {data: "lengthincl",
                            "className": 'lengthincl',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "typeapp",
                            "className": 'typeapp'
                        },
                        {data: "conname",
                            "className": 'conname'
                        },
                        {data: "packagename",
                            "className": 'packagename'
                        },
                        {data: "autosignon",
                            "className": 'autosignon',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "needsignon",
                            "className": 'needsignon',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "packagerpath",
                            "className": 'packagerpath',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "loadbalancing",
                            "className": 'loadbalancing',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "lbgroup",
                            "className": 'lbgroup',
                            "visible": false,
                            "searchable": false
                        },
                        {data: "statusconnect",
                            "className": 'statusconnect',
                            render: function (data) {
                            if (data == 'f') {
                                return '<div style="height: 20px; width: 80px; background-color: red; border-radius: 3px;"></div>';
                            } else if (data == 't') {
                                return '<div style="height: 20px; width: 80px; background-color: aquamarine; border-radius: 3px;"></div>';
                            }
                        }
                        },
                    ],
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'collection',
                            text: 'Export',
                            buttons:
                                    [
                                        {
                                            extend: "copyHtml5",
                                            title: "List conncetion",
                                            exportOptions: {columns: ':visible:not()'}, //last column has the action types detail/edit/delete
                                            footer: true
                                        },
                                        {
                                            extend: "csvHtml5",
                                            title: "List connection",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "excelHtml5",
                                            title: "List connection",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "pdfHtml5",
                                            title: "List connection",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "print",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        }
                                    ]
                        }
                    ]
                });
            });
            $.fn.dataTable.ext.errMode = 'none';
        </script>
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
            <%@include file='header.jsp'%>
            <!-- /.navbar -->
            <!-- Main Sidebar Container -->
            <%@include file='sidebar_left.jsp'%>
            <!--end sidebar-->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <div class="content-header">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <p class="text-left" style="color: #29B19C; font-size: 20px;">
                                                        List Connection
                                                    </p>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="category" class="tab-pane fade in active show">
                                                        <div id="add_category">
                                                            <label id="add_category_text" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                <i class="icon fa fa-plus-circle" style="margin-right: 5px">
                                                                </i>Add Connection
                                                            </label>
                                                        </div>
                                                        <div class="container">        
                                                            <table class="table" id="table_conn">
                                                                <thead>
                                                                    <tr>
                                                                        <th>id</th>
                                                                        <th>todirect</th>
                                                                        <th>host</th>
                                                                        <th>port</th>
                                                                        <th>statusopen</th>
                                                                        <th>statusstart</th>
                                                                        <th>headertype</th>
                                                                        <th>chanelid</th>
                                                                        <th>lengthincl</th>
                                                                        <th>typeapp</th>
                                                                        <th>conname</th>
                                                                        <th>packagename</th>
                                                                        <th>autosignon</th>
                                                                        <th>needsignon</th>
                                                                        <th>packagerpath</th>
                                                                        <th>loadbalancing</th>
                                                                        <th>lbgroup</th>
                                                                        <th>statusconnect</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_add_conn.jsp'%>
                                                        <%@include file='pop_up_edit_conn.jsp'%>
                                                        <%@include file='pop_up_message.jsp'%>
                                                        <%@include file='pop_up_add_field.jsp'%>
                                                        <%@include file='pop_up_edit_field.jsp'%>
                                                        
                                                        <%@include file='pop_up_800series.jsp'%>
                                                        <%@include file='pop_up_add_field800.jsp'%>
                                                        <%@include file='pop_up_edit_field800.jsp'%>
                                                        
                                                        <%@include file='pop_up_400series.jsp'%>
                                                        <%@include file='pop_up_add_field400.jsp'%>
                                                        <%@include file='pop_up_edit_field400.jsp'%>
                                                        
                                                        <%@include file='pop_up_200series.jsp'%>
                                                        <%@include file='pop_up_add_field200.jsp'%>
                                                        <%@include file='pop_up_edit_field200.jsp'%>
                                                    </div>
                                                </div>    
                                            </div>
                                            <!-- /.row -->
                                        </div>
                                        <!-- ./card-body -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </section>
                </div>
            </div>
            <!-- /.content-wrapper -->
            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- Main Footer -->
            <%@include file='footer.jsp'%>
        </div>
    </body>

</html>
