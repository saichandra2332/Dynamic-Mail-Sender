<?php
require_once('config.php');
if (isset($_POST['clientName'])) {
    $clientName = $_POST['clientName'];

    $query = "INSERT INTO clients (client_name) VALUES ('$clientName')";
    if (mysqli_query($conn, $query)) {
        echo json_encode(['success' => 'Client inserted successfully']);
    } else {
        echo json_encode(['error' => 'Error inserting client']);
    }
} else {
    echo json_encode(['error' => 'Client name not provided']);
}
?>