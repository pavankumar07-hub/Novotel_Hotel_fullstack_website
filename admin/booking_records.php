<?php 
    require('admin_components/essentials.php');
    require('admin_components/db_config.php');
    adminLogin();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Records</title>
    <?php require('admin_components/link.php')?>
    <!-- FullCalendar CSS -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css' rel='stylesheet' />

</head>
<body class="bg-light">

<?php require('admin_components/header.php')?>

<div class="container-fluid" id="main-content">
    <div class="row">
        <div class="col-lg-10 ms-auto p-4 overflow-hidden">
            <h3 class="mb-4">Booking Records</h3>

            <!-- feature -->
            <div class="card border-0 shadow mb-4">
                <div class="card-body">
                    <div class="d-flex justify-content-end mb-3">
                    <button class="btn btn-outline-primary btn-sm shadow-none me-2" onclick="showCalendar()">Calendar View</button>
                    <button class="btn btn-outline-secondary btn-sm shadow-none" onclick="showTable()">Table View</button>
                    </div>

                    <!-- Calendar Container -->
                    <div id="calendar-container" style="display:none;">
                        <div id="calendar"></div>
                    </div>

                    <div class="text-end mb-4">   
                        <input type="text" id="search_input" oninput="get_bookings(this.value)" class="form-control shadow-none w-25 ms-auto" placeholder="Type to search.">
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-hover border" style="min-width: 1200px;">
                            <thead>
                                <tr class="bg-dark text-light">
                                <th scope="col">#</th>
                                <th scope="col">User details</th>
                                <th scope="col">Room details</th>
                                <th scope="col">Bookings details</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody id="table-data">
                            </tbody>
                        </table>
                    </div>

                    <nav>
                        <ul class="pagination mt-2" id="table-pagination">
                            
                        </ul>
                    </nav>


                </div>                
            </div>          
        </div>
    </div>
</div>

<?php require('admin_components/scripts.php')?>
<script src="admin_scripts/booking_records.js"></script>
<!-- FullCalendar JS -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

</body>
</html>