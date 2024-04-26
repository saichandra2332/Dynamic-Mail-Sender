<?php
require_once('config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animated Input Fields with Icons</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css" />
    <style>
        input[type="text"], select {
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
            width: calc(100% - 40px); 
        }

        input[type="text"]:focus, select:focus {
            border-color: #007bff; 
            outline: none;
        }

        ::placeholder {
            color: #999; 
            opacity: 1; 
            transition: color 0.3s ease, opacity 0.3s ease;
        }

        input[type="text"]:focus::placeholder {
            color: transparent; 
            opacity: 0; 
        }

        .input-group {
            position: relative;
            display: inline-block;
            width: 30%;
        }

        .input-group i {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 10px;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .input-group i:hover {
            color: #007bff; 
        }
        .input-group .addInput {
        right: 50px; /* Adjust the distance from the right */
        }

        .input-group .removeInput {
            right: 30px; /* Adjust the distance from the right */
        }
        
    </style>
</head>
<body >
<section class="sidebar">
    <a href="#" class="logo">
        <i class="fab fa-slack"></i>
        <span class="text">Admin Panel</span>
    </a>

   
    <ul class="side-menu top">
        <li class="active">
            <a href="?page=dashboard" class="nav-link">
                <i class="fas fa-border-all"></i>
                <span class="text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="?page=clients" class="nav-link">
                <i class="ri-team-line"></i>
                <span class="text"><a href="clients.php">Clients</a></span>
            </a>
        </li>
        <li>
            <a href="?page=template" class="nav-link">
                <i class="ri-file-excel-2-fill"></i>
                <span class="text"><a href="VulTemplate.php">Template</a></span>
            </a>
        </li>
        <li>
            <a href="?page=insertfile" class="nav-link">
                <i class="ri-file-fill"></i>
                <span class="text"><a href="file.php">Insert File</a></span>
            </a>
        </li>
        <li>
            <a href="?page=sendmails" class="nav-link">
                <i class="ri-mail-fill"></i>
                <span class="text"><a href="sendmail.php">Send Mails</a></span>
            </a>
        </li>
    </ul>

    <ul class="side-menu">
        <li>
            <a href="login.php" class="logout">
                <i class="fas fa-right-from-bracket"></i>
                <span class="text">Logout</span>
            </a>
        </li>
    </ul>
</section>

<section class="content">
    <main>
        <div class="head-title">
            <div class="left">
            </div>
        </div>
        <div id="dashboard-content" class="center-content">

        <center>
        <div class="input-group">
            <select id="category">
                <option value="">Select Client</option>
                <?php
                $client_names = mysqli_query($conn,"SELECT * from clients WHERE client_status = '1'") or die(mysqli_error($conn));
                while ($client_name = mysqli_fetch_object($client_names)){
                ?>
                <option value="<?php echo $client_name->client_name ?>" > <?php echo $client_name->client_name ?></option>
                <?php } ?>     
            </select>
        </div><br><br><br>
        <div id="inputFieldsContainer">
            <div class="input-group">
                <input type="text" class="uname" name="uname" placeholder="">
                <i class="fas fa-plus-circle addInput"></i>
                <i class="fas fa-minus-circle removeInput"></i>
            </div><br><br><br>
        </div>
        <button type="button" id="saveBtn" class="btn btn-primary">Save</button>
    </center>
            
        </div>
       
    </main>
</section>
   

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.0/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script>
    var dataDownloaded = false;

    $(document).ready(function() {
        // Add input field
        $(document).on('click', '.addInput', function() {
            // Check if data has been downloaded
            if (!dataDownloaded) {
                var inputField = '<div class="input-group"><input type="text" class="uname" name="uname[]" placeholder=""><i class="fas fa-plus-circle addInput"></i><i class="fas fa-minus-circle removeInput"></i></div><br><br><br>';
                $('#inputFieldsContainer').append(inputField);
            } else {
                alert("Data has already been downloaded. You cannot add more fields.");
            }
        });

        // Remove input field
        $(document).on('click', '.removeInput', function() {
            $(this).parent('.input-group').remove();
        });

        // Save data to database and handle Excel download
        $("#saveBtn").on("click", function() {
            var formData = {
                category: $("#category").val(),
                uname: $('.uname').map(function() {
                    return $(this).val();
                }).get()
            };

            // Perform AJAX call to save_data.php to save data to database
            $.ajax({
                type: "POST",
                url: "save_data.php", // Change this to the path of your PHP script
                data: formData,
                success: function(response) {
                    console.log(response);
                    // Optionally, you can perform actions after saving data to database
                    saveExcel(formData); // Call function to save Excel after saving data to database
                    // Clear input fields and selected options
                    $("#category").val('');
                    $(".uname").val('');
                    $("input-group").val('');
                    dataDownloaded = true; // Set flag to true after data download

                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                    alert("An error occurred while saving data. Please try again later.");
                }
            });
        });

        // Function to save Excel file
        function saveExcel(formData) {
            // Get the selected client name
            var selectedClient = $("#category option:selected").text().trim();

            // If no client is selected, prompt the user and return
            if (selectedClient === "Select Client") {
                alert("Please select a client first.");
                return;
            }

            // Create a filename based on the selected client name
            var fileName = selectedClient + "_formData.xlsx";

            // Prepare the data in the format required for Excel
            var dataForExcel = [];

            // Check if formData has at least one value
            if (formData.uname.length > 0) {
                // Push form data to Excel data array
                formData.uname.forEach(function(value, index) {
                    dataForExcel[index] = [value]; // Each value will go into a separate row initially
                });

                // Transpose the data array to convert rows to columns
                dataForExcel = transposeArray(dataForExcel);

                // Create the Excel workbook
                var wb = XLSX.utils.book_new();
                var ws = XLSX.utils.aoa_to_sheet(dataForExcel); // Convert array of arrays to worksheet
                XLSX.utils.book_append_sheet(wb, ws, 'Form Data');

                // Convert the workbook to binary data
                var wbout = XLSX.write(wb, {
                    bookType: 'xlsx',
                    type: 'binary'
                });

                // Create a Blob object from binary data
                var blob = new Blob([s2ab(wbout)], {
                    type: 'application/octet-stream'
                });

                // Create a download link
                var link = document.createElement("a");
                link.href = URL.createObjectURL(blob);
                link.download = fileName;

                // Trigger the download
                document.body.appendChild(link);
                link.click();

                // Clean up
                document.body.removeChild(link);
            } else {
                console.error('No data to create Excel');
                return; // Exit if no data is available
            }
        }

        function s2ab(s) {
            var buf = new ArrayBuffer(s.length);
            var view = new Uint8Array(buf);
            for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
            return buf;
        }

        // Function to transpose a 2D array
        function transposeArray(array) {
            return array[0].map((_, colIndex) => array.map(row => row[colIndex]));
        }
    });
</script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
