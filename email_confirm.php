<?php
    require('admin/admin_components/db_config.php');
    require('admin/admin_components/essentials.php');

    if(isset($_GET['email_confirmation'])) {
        $data = filteration($_GET);
        $query = select("SELECT * FROM `user_details` WHERE `email`=? AND `token`=? LIMIT 1 ",[$data['email'],$data['token']],'ss');

        if(mysqli_num_rows($query) == 1) {
            $fetch = mysqli_fetch_assoc($query);

            if($fetch['is_verified']==1) {
            echo"<script>alert('Email Already Verified!')</script>";
            }
            else {
                $update = update("UPDATE `user_details` SET `is_verified`=?  WHERE `id`=?",[1,$fetch['id']],'ii' );
                if($update) {
                echo"<script>alert('Email Verification Successful!')</script>";
                }
                else {
                echo"<script>alert('Email Verification Failed!')</script>";
                    
                }
            }
            redirect('index.php');
        }
        else {
            echo"<script>alert('Invalid Link!')</script>";
            redirect('index.php');

        }
    }

?>