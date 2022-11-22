<?php
    require_once "php/user-list-process.php";
    require('php/connection.php');
    

    
    $queryimage = "SELECT * FROM admin_quicktips"; //You don't need a like you do in SQL;
    $resultimage = mysqli_query($db_admin_account, $queryimage);

    if(isset($_POST['action'])){
        
        $id = $_POST['id'];
        $update_query = mysqli_query($con, "UPDATE messages SET seen=1 WHERE employee_id=$id");
        
        $query = mysqli_query($con,"SELECT * FROM usertable  WHERE id = $id") or die ('query failed');
        $seQuery = mysqli_fetch_array($query);
        $name = '';
        if(isset($seQuery)){
            $name = $seQuery['first_name'].' '.$seQuery['last_name'].' '.$seQuery['suffix'];
        }
        $returnHtml = '<input name="employee-id" value='.$id.' type="hidden" />
                        <div class="form-group" align="center">
                            <h5>'.$name.'</h5>
                        </div>
        ';
        $get_messages = "SELECT * FROM messages WHERE employee_id = $id";
        $res = mysqli_query($con, $get_messages);
        while($fetch_message = mysqli_fetch_assoc($res)){                                    
            if($fetch_message['sender_id']=='petko'){
                $returnHtml .= '<div class="outgoing_msg">
                                    <div class="sent_msg">
                                    <p>'.$fetch_message['message'].'</p>
                                    <span class="time_date"> '.date('h:i a',strtotime($fetch_message['created_at'])).'  |  '.date('F d',strtotime($fetch_message['created_at'])).'</span> </div>
                                </div>';
            }else{
                $returnHtml .= '<div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img style="width:100%;" src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                        <p>'.$fetch_message['message'].'</p>
                                        <span class="time_date"> '.date('h:i a',strtotime($fetch_message['created_at'])).'  |  '.date('F d',strtotime($fetch_message['created_at'])).'</span> </div>
                                    </div>
                                </div>';
            }
        }

        echo $returnHtml;
        die;
    }

    if(isset($_POST['submit-message'])){
        $message = $_POST['message'];
        

        date_default_timezone_set('Asia/Manila');
        $datetime = date("Y-m-d H:i:s");
        $user_id = $_POST['employee-id'];

        
        $sender = mysqli_query($con,"SELECT * FROM usertable  WHERE id = $user_id") or die ('query failed');
        $senderQuery = mysqli_fetch_array($sender);

        $name = $senderQuery['first_name'].' '.$senderQuery['last_name'].' '.$senderQuery['suffix'];

        $insert_data = "INSERT INTO messages (employee_id, `admin`, `message`, created_at, sender_name, receiver_name, sender_id)
                            values('$user_id', 'petko', '$message', '$datetime', '$name', '$name', 'petko')";
        $data_check1 = mysqli_query($con, $insert_data);
    }
    
?>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="icon" href="asset/logopet.png" type="image/x-icon">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Admin || Dashboard</title>

<head>
    <style>
    .inbox_people {
        background: #f8f8f8 none repeat scroll 0 0;
        float: left;
        overflow: hidden;
        width: 40%;
        border-right: 1px solid #c4c4c4;
    }

    .inbox_msg {
        border: 1px solid #c4c4c4;
        clear: both;
        overflow: hidden;
    }

    .top_spac {
        margin: 20px 0 0;
    }


    .recent_heading {
        float: left;
        width: 40%;
    }

    .srch_bar {
        display: inline-block;
        text-align: right;
        width: 60%;
    }

    .headind_srch {
        padding: 10px 29px 10px 20px;
        overflow: hidden;
        border-bottom: 1px solid #c4c4c4;
    }

    .recent_heading h4 {
        color: #05728f;
        font-size: 21px;
        margin: auto;
    }

    .srch_bar input {
        border: 1px solid #cdcdcd;
        border-width: 0 0 1px 0;
        width: 80%;
        padding: 2px 0 4px 6px;
        background: none;
    }

    .srch_bar .input-group-addon button {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        padding: 0;
        color: #707070;
        font-size: 18px;
    }

    .srch_bar .input-group-addon {
        margin: 0 0 0 -27px;
    }

    .chat_ib h5 {
        font-size: 15px;
        color: #464646;
        margin: 0 0 8px 0;
    }

    .chat_ib h5 span {
        font-size: 13px;
        float: right;
    }

    .chat_ib p {
        font-size: 14px;
        color: #989898;
        margin: auto
    }

    .chat_img {
        float: left;
        width: 11%;
    }

    .chat_ib {
        float: left;
        padding: 0 0 0 15px;
        width: 88%;
    }

    .chat_people {
        overflow: hidden;
        clear: both;
    }

    .chat_list {
        border-bottom: 1px solid #c4c4c4;
        margin: 0;
        padding: 18px 16px 10px;
    }

    .inbox_chat {
        height: 550px;
        overflow-y: scroll;
    }

    .active_chat {
        background: #ebebeb;
    }

    .incoming_msg_img {
        display: inline-block;
        width: 6%;
    }

    .received_msg {
        display: inline-block;
        padding: 0 0 0 10px;
        vertical-align: top;
        width: 92%;
    }

    .received_withd_msg p {
        background: #ebebeb none repeat scroll 0 0;
        border-radius: 3px;
        color: #646464;
        font-size: 14px;
        margin: 0;
        padding: 5px 10px 5px 12px;
        width: 100%;
    }

    .time_date {
        color: #747474;
        display: block;
        font-size: 12px;
        margin: 8px 0 0;
    }

    .received_withd_msg {
        width: 57%;
    }

    .mesgs {
        float: left;
        padding: 30px 15px 0 25px;
        width: 60%;
        background: white;
    }

    .sent_msg p {
        background: #05728f none repeat scroll 0 0;
        border-radius: 3px;
        font-size: 14px;
        margin: 0;
        color: #fff;
        padding: 5px 10px 5px 12px;
        width: 100%;
    }

    .outgoing_msg {
        overflow: hidden;
        margin: 26px 0 26px;
    }

    .sent_msg {
        float: right;
        width: 46%;
    }

    .input_msg_write input {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        color: #4c4c4c;
        font-size: 15px;
        min-height: 48px;
        width: 100%;
    }

    .type_msg {
        border-top: 1px solid #c4c4c4;
        position: relative;
    }

    .msg_send_btn {
        background: #05728f none repeat scroll 0 0;
        border: medium none;
        border-radius: 50%;
        color: #fff;
        cursor: pointer;
        font-size: 17px;
        height: 33px;
        position: absolute;
        right: 0;
        top: 11px;
        width: 33px;
    }

    .messaging {
        padding: 0 0 50px 0;
    }

    .msg_history {
        height: 516px;
        overflow-y: auto;
    }
    </style>
</head>

<body style="background:  #9FBACD;">
<!--Navbar-->
<div class="nav-bar container-fluid overflow-hidden">
        <div class="row vh-100 overflow-auto">
            <div class="col-12 col-sm-3 col-xl-2 px-sm-2 px-0 d-flexs sticky-top">
                <div
                    class="d-flex flex-sm-column flex-row flex-grow-1 align-items-center align-items-sm-start px-3 pt-2 text-white">
                    <a href="/"
                        class="navbar-brand d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none"><img
                            src="asset/logopet.png" alt="Saint Jude Logo"
                            style="width: 50px; padding-left: 10px; padding-top: 5px;">
                        <span class="navbar-brand">PETCO. ADMIN</span>
                    </a>
                    <ul class="nav nav-pills flex-sm-column flex-row flex-nowrap flex-shrink-1 flex-sm-grow-0 flex-grow-1 mb-sm-auto mb-0 justify-content-center align-items-center align-items-sm-start"
                        id="menu">
                        <li class="nav-item">
                            <a href="admin-dashboards.php" class="nav-link align-middle px-0">
                                <i class="fs-4 bi-speedometer2"></i> <span
                                    class="ms-1 d-none d-sm-inline">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="quicktips_content.php" class="nav-link align-middle px-0">
                                <i class="fs-4 	fa fa-file-video-o"></i> <span
                                    class="ms-1 d-none d-sm-inline">Quicktips</span>
                            </a>
                        </li>

                        
                        <?php 
                        $selectMessages = mysqli_query($con,"SELECT * FROM `messages` WHERE seen = 0 AND sender_id != 'petko'") or die ('query failed');
                        $count_message = mysqli_num_rows($selectMessages);
                        ?>
                        <li>
                            <a href="admin-message.php" class="nav-link px-sm-0 px-2">
                                <i class="fa fa-envelope text-white"></i><span class="ms-1 d-none d-sm-inline"> Messages <?php if($count_message>0){ ?><span class="badge badge-danger text-white bg-danger"><?php echo $count_message; ?></span><?php } ?></span>
                            </a>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle px-sm-0 px-1" id="dropdown"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fs-4 bi-person-lines-fill"></i><span
                                    class="ms-1 d-none d-sm-inline">Accounts</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdown">
                                <li><a class="dropdown-item" href="#">Admin Accounts</a></li>
                                <li><a class="dropdown-item" href="admin-user-accounts.php">User Accounts</a></li>
                                <li><a class="dropdown-item" href="#">Employee Accounts</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link px-sm-0 px-2">
                                <i class="fs-4 bi-table"></i><span class="ms-1 d-none d-sm-inline">Sales</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle px-sm-0 px-1" id="dropdown"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fs-4 bi-archive"></i><span class="ms-1 d-none d-sm-inline">Archives</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdown">
                                <li><a class="dropdown-item" href="#">Pet Profile</a></li>
                                <li><a class="dropdown-item" href="archive-user.php">Pet Owners</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle px-sm-0 px-1" id="dropdown"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fs-4 bi-pencil-square"></i><span
                                    class="ms-1 d-none d-sm-inline">Content</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdown">
                                <li><a class="dropdown-item" href="admin-slider.php">Slider</a></li>
                                <li><a class="dropdown-item" href="admin-quicktips.php">Quicktips</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="admin-orders.php" class="nav-link px-sm-0 px-2">
                                <i class="fs-4 bi-bag-check"></i><span class="ms-1 d-none d-sm-inline">Orders</span>
                            </a>
                        </li>
                    </ul>
                    <div class="dropdown py-sm-4 mt-sm-auto ms-auto ms-sm-0 flex-shrink-1">
                        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="asset/cha.jpg" alt="Admin" width="28" height="28" class="rounded-circle">
                            <span class="d-none d-sm-inline mx-1">Cha</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                            <li><a class="dropdown-item" href="#">New project...</a></li>
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li><a class="dropdown-item" href="admin-profile.php">Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="admin-login.php">Sign out</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col py-3 mt-5 p-5">
                <div class="row">
                    <div class="col-md-3">
                        <?php 
                            $querysales = "SELECT 
                            product_price*qty  AS total_price
                            FROM order_list 
                            LEFT JOIN `order` ON order.id=order_list.order_id
                            LEFT JOIN admin_menu ON admin_menu.Menu_id = order_list.product_id
                            WHERE 
                            order.order_status = 'pickedup' AND 
                            product_price > 0 AND
                            admin_menu.Menu_name IS NOT NULL"; 
                            $resultsales = mysqli_query($con, $querysales);  

                            $total_sales = 0;
                            $order_count = 0;
                            while($rowsales =  mysqli_fetch_array($resultsales)){ 
                                $total_sales = $total_sales+floatval($rowsales['total_price']);
                                $order_count = $order_count + 1;
                            }

                            $querycustomer_count = "SELECT 
                                                        CONCAT(first_name,' ',middle_name,' ',last_name,' ',suffix) AS fullname,email,contact
                                                        FROM usertable
                                                        WHERE 
                                                        `status`='verified' AND user_level='client'"; 
                            $resultcustomer_count = mysqli_query($con, $querycustomer_count);  
                            $customer_count = 0;
                            while($rowcustomer_count =  mysqli_fetch_array($resultcustomer_count)){
                                $customer_count = $customer_count + 1;
                            }

                            $appointment_count = 0;
                            $queryappoint = "SELECT c.*,CONCAT(u.first_name,' ',u.middle_name,' ',u.last_name,' ',u.suffix) AS customer_name FROM client_appointment c LEFT JOIN usertable u ON u.id = c.user_id WHERE c.status='approved' AND u.id is not null";
                            $resultcappoint = mysqli_query($con, $queryappoint);  
                            while($rowcapp =  mysqli_fetch_array($resultcappoint)){
                                $appointment_count = $appointment_count + 1;
                            }

                        ?>
                        <div class="card shadow">
                            <div align="left" class="p-3">
                                <h3 class="text-dark"><b class=" text-success">₱</b> Total Sales</h3>
                            </div>
                            <div align="right" class="p-3">
                                <h1>Php <?php echo number_format($total_sales,2); ?></h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow">
                        <a href="view-totalsales.php" class="text-decoration-none"><div align="left" class="p-3">
                                <h3 class="text-dark"><b class="fa fa-shopping-cart text-info"></b> Orders</h3>
                            </div>
                            <div align="right" class="p-3">
                                <h1><?php echo $order_count; ?></h1>
                            </div>
                        </div></a>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow">
                        <a href="view-customerlist.php" class="text-decoration-none"><div align="left" class="p-3">
                                <h3 class="text-dark"><b class="fa fa-users text-primary"></b> Active Users</h3>
                            </div>
                            <div align="right" class="p-3">
                                <h1><?php echo $customer_count; ?></h1>
                            </div></a>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow">
                        <a href="view-appointment.php" class="text-decoration-none"><div align="left" class="p-3">
                                <h3 class="text-dark"><b class="fa fa-calendar text-danger"></b> Appointments</h3>
                            </div>
                            <div align="right" class="p-3">
                                <h1><?php echo $appointment_count; ?></h1>
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header ">
                                <h3 class="text-dark">Expired Products</h3>
                            </div>
                            <div class="card-body">
                                <?php 
                                    $querymenu = "SELECT * FROM admin_menu WHERE DATE(expiration)<NOW()"; 
                                    $resultmenu = mysqli_query($con, $querymenu);  
                                ?>
                                <button type="button" class="btn btn-primary mb-3" onclick="PrintElem('product-content','Expired Products')"><span class="fa fa-print"></span> Print</button>
                                <div class="table-responsive" id="product-content">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Product</th>
                                                <th>Expiration Date</th>
                                            </tr>
                                        </thead>
                                        <?php $count = 0; while($rowmenu =  mysqli_fetch_array($resultmenu)){  $count++;?>
                                            <tr>
                                                <td align="center"><?php echo $count; ?></td>
                                                <td><?php echo $rowmenu['Menu_name']; ?></td>
                                                <td><?php echo date('F d,Y',strtotime($rowmenu['expiration'])); ?></td>
                                            </tr>
                                        <?php } ?>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="card mt-3">
                            <div class="card-header ">
                                <h3 class="text-dark">Customer List</h3>
                            </div>
                            <div class="card-body">
                                <?php 
                                    $querycustomer = "SELECT 
                                                        CONCAT(first_name,' ',middle_name,' ',last_name,' ',suffix) AS fullname,email,contact
                                                        FROM usertable
                                                        WHERE 
                                                        `status`='verified' AND user_level='client'"; 
                                    $resultcustomer = mysqli_query($con, $querycustomer);  
                                ?>
                                <button type="button" class="btn btn-primary mb-3" onclick="PrintElem('customer-content','Customer List')"><span class="fa fa-print"></span> Print</button>
                                <div class="table-responsive" id="customer-content">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Contact Number</th>
                                                <th>Email</th>
                                            </tr>
                                            <?php $count2 = 0; while($rowcustomer =  mysqli_fetch_array($resultcustomer)){  $count2++;?>
                                                <tr>
                                                    <td align="center"><?php echo $count2; ?></td>
                                                    <td><?php echo $rowcustomer['fullname']; ?></td>
                                                    <td><?php echo $rowcustomer['email']; ?></td>
                                                    <td><?php echo $rowcustomer['contact']; ?></td>
                                                </tr>
                                            <?php } ?>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <!-- <div class="col-md-6">
                        <div class="card">
                            <div class="card-header ">
                                <h3 class="text-dark">Orders List</h3>
                            </div>
                            <div class="card-body">
                                <?php 
                                    $queryorders = "SELECT 
                                    order_list.qty,
                                    order_list.product_id,
                                    order_list.product_price,
                                    order.order_status,
                                    admin_menu.Menu_name,
                                    product_price*qty  AS total_price
                                    FROM order_list 
                                    LEFT JOIN `order` ON order.id=order_list.order_id
                                    LEFT JOIN admin_menu ON admin_menu.Menu_id = order_list.product_id
                                    WHERE 
                                     order.order_status = 'pickedup' AND 
                                    product_price > 0 AND
                                    admin_menu.Menu_name IS NOT NULL"; 
                                    $resultorder = mysqli_query($con, $queryorders);  
                                ?>
                                <button type="button" class="btn btn-primary mb-3" onclick="PrintElem('order-content','Order List')"><span class="fa fa-print"></span> Print</button>
                                <div class="table-responsive" id="order-content">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Product</th>
                                                <th>QTY</th>
                                                <th>Amount</th>
                                                <th>Total Price</th>
                                            </tr>
                                        </thead>
                                        <?php $count1 = 0; $grand_total = 0; while($roworder =  mysqli_fetch_array($resultorder)){  $count1++; $grand_total = $grand_total+floatval($roworder['total_price']);?>
                                            <tr>
                                                <td align="center"><?php echo $count1; ?></td>
                                                <td><?php echo $roworder['Menu_name']; ?></td>
                                                <td align="center"><?php echo $roworder['qty']; ?></td>
                                                <td align="right">₱<?php echo number_format($roworder['product_price'],2); ?></td>
                                                <td align="right">₱<?php echo number_format($roworder['total_price'],2); ?></td>
                                            </tr>
                                        <?php } ?>
                                        <tr>
                                            <td align="right" colspan="4"><b>Grand Total:</b></td>
                                            <td align="right">₱<?php echo number_format($grand_total,2); ?></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        
                    </div> -->
                  
                </div>
            </div>



            <!--DIVISION -->


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
                crossorigin="anonymous">
            </script>
            <script src="/js/script.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                function PrintElem(elem,title)
                {
                    var mywindow = window.open('', 'PRINT', 'height=1000,width=1920');

                    mywindow.document.write('<html><head><title>' + document.title  + '</title>');
                    mywindow.document.write('</head><body ><style>'+
                                                'table, td, th {'+
                                                'border: 1px solid;'+
                                                '}'+
                                                'table {'+
                                                'width: 100%;'+
                                                'border-collapse: collapse;'+
                                                '}'+
                                                '</style>');
                    mywindow.document.write('<h1>' + title  + '</h1>');
                    mywindow.document.write(document.getElementById(elem).innerHTML);
                    mywindow.document.write('</body></html>');

                    mywindow.document.close(); // necessary for IE >= 10
                    mywindow.focus(); // necessary for IE >= 10*/

                    mywindow.print();
                    mywindow.close();

                    return true;
                }
            $(document).ready(function(index) {
              
            });
            </script>
</body>

</html>