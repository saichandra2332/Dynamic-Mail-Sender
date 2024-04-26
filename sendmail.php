<?php
require_once('config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style.css" />
    <title>Document</title>
    <style>
        .container {
            margin-top: 50px;
        }
        .animated {
            animation-duration: 1s;
        }
        .btn-primary {
            transition: transform 0.3s ease-in-out;
        }
        .btn-primary:hover {
            transform: scale(1.05);  
        }
        .order {
        border: none;
        padding: 15px 30px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 8px;
        background-color: #3498db;
        color: white;
        transition: background-color 0.3s, transform 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        position: relative;
    }

    .order:hover {
        background-color: #2980b9;
        transform: translateY(-3px);
    }

    .order::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 300%;
        height: 300%;
        background-color: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
        transition: all 0.5s ease-out;
        transform: translate(-50%, -50%);
        z-index: 0;
        pointer-events: none;
    }

    .order:hover::before {
        width: 0;
        height: 0;
        opacity: 0;
    }

    .order span {
        position: relative;
        z-index: 1;
    }
    </style>
</head>
<body>
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
        <form class="" id="emailForm">
    <select id="category">
        <option value="">Select Client</option>
        <?php
        $client_names = mysqli_query($conn,"SELECT * from clients WHERE client_status = '1'") or die(mysqli_error($conn));
        while ($client_name = mysqli_fetch_object($client_names)){
        ?>
        <option value="<?php echo $client_name->client_id ?>"><?php echo $client_name->client_name ?></option>
        <?php } ?>     
    </select><br><br>
    <input type="hidden" name="selectedEmails" id="selectedEmails">
    <input type="hidden" name="subject" id="subject">
    <textarea type="hidden" class="d-none" name="body" id="body"></textarea>

    <form class="emailForm" action="sendmail.php" method="post"> 
            <div class="form-group animate__animated animate__fadeInLeft">
                <label for="subject">Subject:</label>
                <input type="text" class="form-control" id="subject1" name="subject1" placeholder="Enter subject...">
            </div>
            <div class="form-group animate__animated animate__fadeInRight">
                <label >Body:</label>
                <textarea class="form-control" id="body1" name="body1" rows="8" placeholder="Enter your message..."></textarea>

                <center> <button type="button" name="send_data" id="send_data" class="order"><span class="default">Send Mail</span></button></center>

            </div>
        </form>

    
</form>
            
        </div>
       
    </main>
</section>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#category').change(function(){
                var company=$(this).val();

                $.ajax({
                    type: 'POST',
                    url: 'fetchdata.php',
                    data: {company:company,work:"1"},
                    dataType: 'json', 
                    success: function(data) {
                        console.log(data);
                        if (data.length > 0 && typeof data[0] === 'object') {
                            var mailBody = data[0].mail_body;
                            $('#body').val(mailBody);
                            $('#body1').val(mailBody);

                        } else {
                            // Handle case when data is empty or not in the expected format
                            console.error('Invalid response data');
                        }

                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });

        

            });
            $('#send_data').click(function(){
            // Retrieve selected values
            var selectedEmails = $('#category').val();
            var subject = $('#subject1').val();
            var body = $('#body1').val();

            $.ajax({
                    type: 'POST',
                    url: 'mail.php',
                    data: {selectedEmails:selectedEmails},
                    dataType: 'json', 
                    success: function(data) {
                        console.log(data);

                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });


            
            
            var redirectTo = 'mail.php';
            redirectTo += '?selectedEmails=' + selectedEmails;
            redirectTo += '&subject=' + encodeURIComponent(subject);
            redirectTo += '&body=' + encodeURIComponent(body);
            window.location.href = redirectTo;
            });
            


           
        });
    </script>
</body>
</html>
        