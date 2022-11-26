<?php
    require_once "php/user-list-process.php";
    require('php/connection.php');
require('layouts/header_admin.php');
    

    
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

<title>Admin || Approved Appointment List</title>


            <div class="col-md-6 col-sm-4 mx-auto">
                <div class="card mt-5">
                    <div class="card-header ">
                        <h3 class="text-dark">Approved Appointment List </h3>
                    </div>
                    <div class="card-body">

                        <button type="button" class="btn btn-primary mb-3"
                            onclick="PrintElem('customer-appoint','Appointment List')"><span class="fa fa-print"></span>
                            Print</button>
                        <div class="table-responsive" id="customer-appoint">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Appointment No</th>
                                        <th>Customer Name</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        
                                    </tr>
                                    <?php $appointment_count = 0;
                            $queryappoint = "SELECT c.*,CONCAT(u.first_name,' ',u.middle_name,' ',u.last_name,' ',u.suffix) AS customer_name FROM client_appointment c LEFT JOIN usertable u ON u.id = c.user_id WHERE c.status='approved' AND u.id is not null";
                            $resultcappoint = mysqli_query($con, $queryappoint);  
                            while($rowcapp =  mysqli_fetch_array($resultcappoint)){
                               ?> <tr>
                                        <!-- <td align="center"><?php echo $count1; ?></td> -->
                                        
                                        <td><?php echo $rowcapp['appoint_no']; ?></td>
                                        <td><?php echo $rowcapp['customer_name']; ?></td>
                                        <td><?php echo $rowcapp['appoint_date']; ?></td>
                                        <td><?php echo $rowcapp['appoint_time']; ?></td>
                                        
                                        <!-- <td align="center"><?php echo $roworder['qty']; ?></td>
                                    <td align="right">₱<?php echo number_format($roworder['product_price'],2); ?></td>
                                    <td align="right">₱<?php echo number_format($roworder['total_price'],2); ?></td> -->
                                    </tr>
                                    <?php $appointment_count = $appointment_count + 1;
                            }

                        ?>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
                    crossorigin="anonymous">
                </script>
                <script src="/js/script.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <script>
                function PrintElem(elem, title) {
                    var mywindow = window.open('', 'PRINT', 'height=1000,width=1920');

                    mywindow.document.write('<html><head><title>' + document.title + '</title>');
                    mywindow.document.write('</head><body ><style>' +
                        'table, td, th {' +
                        'border: 1px solid;' +
                        '}' +
                        'table {' +
                        'width: 100%;' +
                        'border-collapse: collapse;' +
                        '}' +
                        '</style>');
                    mywindow.document.write('<h1>' + title + '</h1>');
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