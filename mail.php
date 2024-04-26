<?php
require_once('config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" />
    <style>
        .order {
            background-color: #4CAF50; /* Green background */
            border: none; /* Remove border */
            color: white; /* White text */
            padding: 15px 32px; /* Padding */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove default underline */
            display: inline-block; /* Display as inline-block */
            font-size: 16px; /* Font size */
            margin: 4px 2px; /* Margin */
            cursor: pointer; /* Cursor on hover */
            border-radius: 10px; /* Rounded corners */
        }

        /* Hover effect */
        .order:hover {
            background-color: #45a049; /* Darker green */
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


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
        <input type="hidden" name="subject1" id="subject1">
    <textarea type="hidden" class="d-none" name="body1" id="body1"></textarea>

<select id="category">
        <option value="">Select Client</option>
        <?php
        $client_names = mysqli_query($conn,"SELECT * from clients WHERE client_status = '1'") or die(mysqli_error($conn));
        while ($client_name = mysqli_fetch_object($client_names)){
        ?>
        <option value="<?php echo $client_name->client_id ?>"><?php echo $client_name->client_name ?></option>
        <?php } ?>     
    </select><br><br>

    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col"><input type="checkbox" name="checkAllHeader" id="checkAllHeader"></th>
                <th scope="col">S.no</th>
                <th scope="col">Name</th>
                <th scope="col">Mail</th>
            </tr>
        </thead>
        <tbody>
        <?php
        if(isset($_GET['selectedEmails'])){
            $company = $_GET['selectedEmails'];
            $client_query = mysqli_query($conn, "SELECT client_name FROM clients WHERE client_id='$company'") or die(mysqli_error($conn));
            $client_row = mysqli_fetch_assoc($client_query);
            $client_name = $client_row['client_name'];
        
            $qry=mysqli_query($conn, "SELECT * FROM $client_name  ")or die(mysqli_error($conn));
        
        while($res=mysqli_fetch_object($qry)){
    ?>
             <tr>
                <td><input type="checkbox" class="columnCheckbox" value="<?php echo $res->Mail; ?>"></td> <!-- Set value to email address -->
                <td><?php echo $res->sno; ?></td>
                <td><?php echo $res->Name; ?></td>
                <td><?php echo $res->Mail; ?></td>
            </tr>
        <?php
        }
        }
    ?>
        </tbody>
    </table><br><br>
   <center> <button type="button" name="send" id="send" class="order"><span class="default">Send Mail</span></button></center>
</form>
           
        </div>
       
    </main>
</section>


   
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        };

        // Populate hidden input fields with URL parameters
        $('#subject1').val(getUrlParameter('subject'));
        $('#body1').val(getUrlParameter('body'));

        $('#send').click(function () {
                var selectedEmails = [];
                $('.columnCheckbox:checked').each(function () {
                    selectedEmails.push($(this).val());
                });
                var formData = {
                    selectedEmails: selectedEmails.join(','),
                    subject: $('#subject1').val(),
                    body: $('#body1').val(),
                };
                $.ajax({
                    type: 'POST',
                    url: 'sendingmail.php',
                    data: formData,
                    success: function(response) {
                        Swal.fire({
                        title: 'Success!',
                        text: response,
                        icon: 'success',
                        confirmButtonText: 'OK'
                    });
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });
            // Check or uncheck all checkboxes when header checkbox is clicked
            $('#checkAllHeader').change(function() {
                $('.columnCheckbox').prop('checked', $(this).prop('checked'));
           });

            // Check or uncheck header checkbox based on the state of individual checkboxes
            $('.columnCheckbox').change(function() {
                var allChecked = $('.columnCheckbox:checked').length === $('.columnCheckbox').length;
                $('#checkAllHeader').prop('checked', allChecked);
            });
    })
    </script>
</body>
</html>