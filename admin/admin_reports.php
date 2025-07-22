<?php 
require('admin_components/essentials.php');
require('admin_components/db_config.php');
adminLogin();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Generate Reports</title>
  <?php require('admin_components/link.php'); ?>
</head>
<body class="bg-light">
<?php require('admin_components/header.php'); ?>

<div class="container-fluid" id="main-content">
    <div class="row">
        <div class="col-lg-10 ms-auto p-4 overflow-hidden">
  <h4 class="mb-4">Download Booking Reports</h4>
  <form method="POST" action="generate_report.php">
    <div class="row mb-3">
      <div class="col-md-4">
        <label class="form-label">From Date</label>
        <input type="date" name="from_date" required class="form-control shadow-none">
      </div>
      <div class="col-md-4">
        <label class="form-label">To Date</label>
        <input type="date" name="to_date" required class="form-control shadow-none">
      </div>
      <div class="col-md-4">
        <label class="form-label">Room Type (optional)</label>
        <input type="text" name="room_type" class="form-control shadow-none" placeholder="Ex: Deluxe, Suite">
      </div>
    </div>
    <button class="btn btn-primary" name="generate_report">Download Report</button>
  </form>
</div>
</div>
</div>

<?php require('admin_components/scripts.php'); ?>
</body>
</html>
