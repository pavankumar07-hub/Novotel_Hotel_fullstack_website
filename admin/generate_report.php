<?php
require('admin_components/db_config.php');
require('admin_components/essentials.php');
adminLogin();

if (isset($_POST['generate_report'])) {
    $from = $_POST['from_date'];
    $to = $_POST['to_date'];
    $room = $_POST['room_type'];

    $query = "SELECT bo.*, bd.user_name, bd.room_name FROM booking_order bo 
              INNER JOIN booking_details bd ON bo.booking_id = bd.booking_id 
              WHERE bo.check_in BETWEEN ? AND ?";

    $params = [$from, $to];
    $types = 'ss';

    if (!empty($room)) {
        $query .= " AND bd.room_name LIKE ?";
        $params[] = "%$room%";
        $types .= 's';
    }

    $res = select($query, $params, $types);

    header('Content-Type: text/csv');
    header('Content-Disposition: attachment;filename=booking_report.csv');

    $output = fopen('php://output', 'w');
    fputcsv($output, ['Booking ID', 'User', 'Room', 'Status', 'Check-In', 'Check-Out', 'Amount']);

    while ($row = mysqli_fetch_assoc($res)) {
        fputcsv($output, [
            $row['booking_id'],
            $row['user_name'],
            $row['room_name'],
            $row['booking_status'],
            $row['check_in'],
            $row['check_out'],
            $row['total_pay']
        ]);
    }

    fclose($output);
    exit;
}
?>
