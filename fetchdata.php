<?php
require_once('config.php');

if(isset($_POST['work']) && $_POST['work'] == "1"){
    $company = $_POST['company'];

    $fetch_roles_data = mysqli_query($conn, "SELECT * FROM mail WHERE Company = '$company' AND mail_status = '1'");
    $role_data = array();
    while ($role_row = mysqli_fetch_assoc($fetch_roles_data)) {
        $role_data[] = $role_row;
    }

    echo json_encode($role_data);
}

?>
