<?php
require_once('config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $clientName = $_POST['category'];
    $usernames = $_POST['uname'];

    // Sanitize client name for table creation
    $tableName = strtolower(str_replace(' ', '_', $clientName));

    // Create table query
    $createQuery = "CREATE TABLE IF NOT EXISTS `$tableName` (
        `sno` INT AUTO_INCREMENT PRIMARY KEY,
        ";

    // Add column names based on input fields
    foreach ($usernames as $index => $username) {
        // Sanitize and escape column names to prevent SQL injection
        $columnName = mysqli_real_escape_string($conn, trim($username));
        $createQuery .= "`$columnName` VARCHAR(200), ";
    }

    // Remove the trailing comma and close the query
    $createQuery = rtrim($createQuery, ', ') . ")";

    // Execute the create table query
    mysqli_query($conn, $createQuery) or die(mysqli_error($conn));

    echo "Table created successfully!";
    exit();
}
?>
