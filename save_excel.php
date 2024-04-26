<?php
require_once('config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Assuming the data is passed as a base64-encoded string
    $base64Data = $_POST['excelData'];
    $excelData = base64_decode($base64Data);

    // Path to your project directory
    $directory = 'C:\Users\saich\OneDrive\Desktop\XAMP\htdocs\Dynamic Mail Sender\Excels';

    // Name for the Excel file
    $filename = 'formData.xlsx';

    // Full path to the Excel file
    $filepath = $directory . $filename;

    // Write the Excel data to the file
    if (file_put_contents($filepath, $excelData) !== false) {
        echo "Excel file saved in project directory.";
    } else {
        echo "Failed to save Excel file.";
        var_dump(error_get_last());
    }
    exit();
} else {
    echo "Method not allowed.";
}
?>

