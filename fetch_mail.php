<?php
require_once('config.php');

$query = mysqli_query($conn, "SELECT client_name FROM clients WHERE client_status = '1'");

if ($query) {
    $clients = array();
    while ($result = mysqli_fetch_assoc($query)) {
        $clients[] = $result;
    }
    echo json_encode($clients);
} else {
    echo json_encode(['error' => 'Unable to fetch client data']);
}
?>
