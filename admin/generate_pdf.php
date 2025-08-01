<?php 
    require('admin_components/essentials.php');
    require('admin_components/db_config.php');
    require('admin_components/mpdf/vendor/autoload.php');
    adminLogin();


    if(isset($_GET['gen_pdf']) && isset($_GET['id'])) {
        $form_data = filteration($_GET);
        $query = "SELECT bo.* , bd.*, ud.email FROM `booking_order` bo 
        INNER JOIN `booking_details` bd ON bo.booking_id = bd.booking_id 
        INNER JOIN `user_details` ud ON bo.user_id = ud.id
        WHERE ((bo.booking_status = 'booked' AND bo.arrival = 1) OR (bo.booking_status='cancelled' AND bo.refund = 1))
        AND bo.booking_id = '$form_data[id]';
        ";

        $res = mysqli_query($con,$query);
        $total_rows = mysqli_num_rows($res);

        if($total_rows == 0) {
            header('location: dashboard.php');
            exit;
        }

        $data = mysqli_fetch_assoc($res);
        $date = date("d-m-Y",strtotime($data['order_date']));
        $checkin = date("d-m-Y",strtotime($data['check_in']));
        $checkout = date("d-m-Y",strtotime($data['check_out']));

        $table_data = "
        <h2>Booking Reciept</h2>
        <table border='1'>
        <tr>
        <td>Order Id: $data[order_id]</td>
        <td>Booking Date: $date</td>
        </tr>
        <tr>
        <td colspan='2'>Status: $data[booking_status]</td>
        </tr>
        <tr>
        <td>Name: $data[user_name]</td>
        <td>Email: $data[email]</td>
        </tr>
        <tr>
        <td>Phone Number: $data[phone_num]</td>
        <td>address: $data[address]</td>
        </tr>
        <tr>
        <td>Room Name: $data[room_name]</td>
        <td>Cost: ₹$data[price] per night</td>
        </tr>
        <tr>
        <td>Check-in: $checkin</td>
        <td>Check-out: $checkout </td>
        </tr>
        ";

        if($data['booking_status'] == 'cancelled'){

            $refund = ($data['refund']) ? "Amount Refunded" : "Not yet Refunded";
            $table_data.="<tr>
            <td>Amount Paid: $data[total_pay]</td>
            <td>Refund: $refund</td>
            </tr>";
        }
        else {
            $table_data.="<tr>
            <td>Room Number: $data[room_no]</td>
            <td>Amount: $data[total_pay]</td>
            </tr>";
        }

        $table_data .= "</table>"; 
        
        $mpdf = new \Mpdf\Mpdf();

        $mpdf->WriteHTML($table_data);

        $mpdf->Output($data['order_id'].'.pdf','D');

    }
    else {
        header('location: dashboard.php');
    }

?>