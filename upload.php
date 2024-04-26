<?php
// Database configuration
require_once('config.php');
if(isset($_POST['submit'])){
    // File upload handling
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["file"]["name"]);
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);

    // Check file type
    if($fileType != "xlsx" && $fileType != "xls") {
        echo "Sorry, only Excel files are allowed.";
        exit();
    }

    // Upload file
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
        // Open the uploaded Excel file
        $excelData = [];
        $file = fopen($target_file, "r");
        while (($row = fgetcsv($file, 10000, ",")) !== FALSE) {
            $excelData[] = $row;
        }
        fclose($file);

        // Remove header row
        array_shift($excelData);

        // Iterate through Excel data and insert into MySQL
        foreach ($excelData as $row) {
            $stmt = $conn->prepare("INSERT INTO your_table_name (column1, column2, column3) VALUES (?, ?, ?)");
            $stmt->execute($row);
        }

        echo "Data imported successfully.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
?>

