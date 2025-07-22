<?php
// Simple .env loader (no Composer needed)
$envPath = __DIR__ . '/../../../.env';
if (file_exists($envPath)) {
    $lines = file($envPath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0 || strpos($line, '=') === false) continue;
        list($name, $value) = explode('=', $line, 2);
        putenv(trim($name) . '=' . trim($value));
    }
}
// for front end
define('SITE_URL','http://127.0.0.1/updatedone/');
define('ABOUT_IMG_PATH',SITE_URL.'images/about/');
define('CAROUSEL_IMG_PATH',SITE_URL.'images/carousel/');
define('FACILITIES_IMG_PATH',SITE_URL.'images/facilities/');
define('ROOMS_IMG_PATH',SITE_URL.'images/rooms/');
define('USERS_IMG_PATH',SITE_URL.'images/users/');

// for backend
define('UPLOAD_IMAGE_PATH',$_SERVER['DOCUMENT_ROOT'].'/bookmyhotel/images/');
define('ABOUT_FOLDER','about/');
define('CAROUSEL_FOLDER','carousel/');
define('FACILITIES_FOLDER','facilities/');
define('ROOMS_FOLDER','rooms/');
define('USERS_FOLDER','users/');

//sendgrid API KEY

define('SENDGRID_API_KEY', getenv('SENDGRID_API_KEY'));
define('SENDGRID_EMAIL', getenv('SENDGRID_EMAIL'));
define('SENDGRID_NAME', getenv('SENDGRID_NAME'));

function adminLogin() {
    session_start();
    if(!(isset($_SESSION['adminLogin']) && $_SESSION['adminLogin'] == true)) {
        echo"<script>
            window.location.href='index.php';
        </script>";
        exit;
    }
}

function redirect($url){
    echo"<script>
    window.location.href='$url';
    </script>";
    exit;
}


function alert($type,$msg) {
    $alert_class = ($type == "success") ? "alert-success" : "alert-danger";
    echo <<<alert
            <div class="alert $alert_class alert-dismissible fade show custom-alert" role="alert">
                <strong class="me-3">$msg</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            alert;
}

function uploadImage($image,$folder) {
    $valid_mime = ['image/jpeg', 'image/png', 'image/webp'];
    $img_mime = $image['type'];

    if(!in_array($img_mime,$valid_mime)) {
        return 'inv_img';
    }
    else if(($image['size']/(1024*1024))>2) {
        return 'inv_size';
    }
    else {
        $ext = pathinfo($image['name'],PATHINFO_EXTENSION);
        $rname = 'IMG_'.random_int(11111,99999).".$ext";
        $img_path = UPLOAD_IMAGE_PATH.$folder.$rname;
        if(move_uploaded_file($image['tmp_name'],$img_path)) {
            return $rname;
        }
        else {
            return 'upd_failed';
        }
    }
}

function deleteIMG($image,$folder) {
    if(unlink(UPLOAD_IMAGE_PATH.$folder.$image)) {
        return true;
    }
    else {
        return false;
    }
}

function uploadSVG($image,$folder) {
    $valid_mime = ['image/svg+xml'];
    $img_mime = $image['type'];

    if(!in_array($img_mime,$valid_mime)) {
        return 'inv_img';
    }
    else if(($image['size']/(1024*1024))>1) {
        return 'inv_size';
    }
    else {
        $ext = pathinfo($image['name'],PATHINFO_EXTENSION);
        $rname = 'IMG_'.random_int(11111,99999).".$ext";
        $img_path = UPLOAD_IMAGE_PATH.$folder.$rname;
        if(move_uploaded_file($image['tmp_name'],$img_path)) {
            return $rname;
        }
        else {
            return 'upd_failed';
        }
    }
}

function uploadUserImg($image) {
    $valid_mime = ['image/jpeg', 'image/png', 'image/webp'];
    $img_mime = $image['type'];
    $ext = strtolower(pathinfo($image['name'], PATHINFO_EXTENSION));

    if (!in_array($img_mime, $valid_mime)) {
        return 'inv_img';
    }

    $rname = 'IMG_' . random_int(11111, 99999) . '.' . $ext;
    $img_path = UPLOAD_IMAGE_PATH . USERS_FOLDER . $rname;

    switch ($ext) {
        case 'png':
            if (function_exists('imagecreatefrompng')) {
                $img = imagecreatefrompng($image['tmp_name']);
            } else {
                return 'png_not_supported';
            }
            $save_func = 'imagepng';
            $quality = 6;
            break;

        case 'webp':
            if (function_exists('imagecreatefromwebp')) {
                $img = imagecreatefromwebp($image['tmp_name']);
            } else {
                return 'webp_not_supported';
            }
            $save_func = 'imagewebp';
            $quality = 75; 
            break;

        case 'jpeg':
        case 'jpg':
        default:
            if (function_exists('imagecreatefromjpeg')) {
                $img = imagecreatefromjpeg($image['tmp_name']);
            } else {
                return 'jpeg_not_supported';
            }
            $save_func = 'imagejpeg';
            $quality = 75;
            break;
    }

    if ($save_func($img, $img_path, $quality)) {
        return $rname;
    } else {
        return 'upd_failed';
    }
}


?>