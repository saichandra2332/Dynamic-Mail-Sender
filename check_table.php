<?php
require_once('config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $category = $_POST['category'];

    // Sanitize category for table name
    $tableName = strtolower(str_replace(' ', '_', $category));

    // Check if the table exists
    $checkQuery = "SHOW TABLES LIKE '$tableName'";
    $result = mysqli_query($conn, $checkQuery);

    if (mysqli_num_rows($result) > 0) {
        // Table exists
        echo "Table exists";
    } else {
        // Table doesn't exist
        echo "Table does not exist";
    }
} else {
    echo "Invalid request method";
}
?>
