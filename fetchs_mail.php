<?php
// fetchs_mail.php

// Include your database connection script (config.php)
require_once('config.php');

// Check if clientId is set and not empty
if(isset($_POST['clientId']) && !empty($_POST['clientId'])) {
    $clientId = $_POST['clientId'];
    error_log("Client ID: " . $clientId); // Debugging statement

    // Define the table name based on the selected option
    $tableName = '';

    // Determine the table name based on the selected client ID
    if($clientId === 'cy4') { // Assuming client ID should be lowercase 'cy4'
        $tableName = 'cy4_mail'; // Set the table name to 'cy4_mail' if the selected client ID is 'cy4'
    } else {
        $tableName = 'mail'; // Default to 'mail' table if no specific table is defined
    }
    error_log("Table Name: " . $tableName); // Debugging statement

    // Fetch mail body from the database based on the selected client
    $query = "SELECT mail_body FROM $tableName WHERE mail_status = '1'";
    error_log("Query: " . $query); // Debugging statement
    
    // Execute the query
    $result = mysqli_query($conn, $query);

    // Check if query executed successfully
    if($result) {
        // Check if any rows are returned
        if(mysqli_num_rows($result) > 0) {
            // Fetch the first row
            $row = mysqli_fetch_assoc($result);
            $mailBody = $row['mail_body'];
            // Echo the fetched data back to JavaScript
            echo $mailBody;
        } else {
            // Handle if no data found
            echo "No data found for the selected client.";
        }
    } else {
        // Handle database query error
        echo "Error: " . mysqli_error($conn);
    }
} else {
    // Handle if clientId is not set or empty
    echo "Please Select the client Id";
}
?>
