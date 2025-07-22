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
    <title>New Bookings</title>
    <?php require('admin_components/link.php')?>
</head>
<body class="bg-light">

<?php require('admin_components/header.php')?>

<div class="container-fluid" id="main-content">
    <div class="row">
        <div class="col-lg-10 ms-auto p-4 overflow-hidden">
            <h3 class="mb-4">New Bookings</h3>

            <!-- feature -->
            <div class="card border-0 shadow mb-4">
                <div class="card-body">
                    <div class="text-end mb-4">   
                        <input type="text" oninput="get_bookings(this.value)" class="form-control shadow-none w-25 ms-auto" placeholder="Type to search.">
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-hover border" style="min-width: 1200px;">
                            <thead>
                                <tr class="bg-dark text-light">
                                <th scope="col">#</th>
                                <th scope="col">User details</th>
                                <th scope="col">Room details</th>
                                <th scope="col">Bookings details</th>
                                <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody id="table-data">
                            </tbody>
                        </table>
                    </div>
                </div>                
            </div>          
        </div>
    </div>
</div>

<!-- Assign room modal-->
    <div class="modal fade" id="assign-room" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
        <form id="assign_room_form">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title">Assign Room</h5>
                </div>
            <div class="modal-body">
                <div class="mb-3">
                <label  class="form-label fw-sbold">Room Number</label>
                <input type="text" name="room_no" class="form-control shadow-none" required>
                </div>

                <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
                    Note: Assign Room Number only when user has been arrived
                </span>

                <input type="hidden" name="booking_id">

            </div>
                <div class="modal-footer">
                <button type="reset"  class="btn text-secondary shadow-none" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn custom-bg text-white shadow-none">Assign</button>
                </div>
            </div>
        </form>
        </div>
    </div>


<?php require('admin_components/scripts.php')?>
<script src="admin_scripts/new_bookings.js"></script>

</body>
</html>