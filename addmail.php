<?php
require_once('config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Composer</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    </style>
</head>
<body>
    <div class="container">
        <div class="text-center">
            <h1 class="animate__animated animate__fadeInDown">Email Composer</h1>
        </div>
        <div class="input-group">
            <select id="category">
                <option value="">Select Client</option>
                <?php
                $client_names = mysqli_query($conn,"SELECT * from clients WHERE client_status = '1'") or die(mysqli_error($conn));
                while ($client_name = mysqli_fetch_object($client_names)){
                ?>
                <option value="<?php echo $client_name->client_id ?>"><?php echo $client_name->client_name ?></option>
                <?php } ?>     
            </select>
        </div><br><br><br>
        <form class="emailForm" action="sendmail.php" method="post"> 
            <div class="form-group animate__animated animate__fadeInLeft">
                <label for="subject">Subject:</label>
                <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter subject...">
            </div>
            <div class="form-group animate__animated animate__fadeInRight">
                <label >Body:</label>
                <textarea class="form-control" id="body" name="body" rows="8" placeholder="Enter your message..."></textarea>
            </div>
            <center><button type="submit" name="send" id="send" class="btn btn-primary">Send</button></center>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
  $(document).ready(function() {
    $('#category').change(function() {
        var clientId = $(this).val();
        if (clientId !== "") {
            $.ajax({
                url: 'fetchs_mail.php',
                type: 'POST',
                data: { clientId: clientId },
                success: function(response) {
                    $('#body').val(response);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                    
                }
            });
        }
    });

    $('#emailForm').submit(function(event) {
        event.preventDefault(); 

        var body = $('#body').val();

        var formData = $(this).serialize();
        console.log(formData);

        formData += '&body=' + encodeURIComponent(body);

        $.ajax({
            url: 'sendmail.php',
            type: 'POST',
            data: formData,
            success: function(response) {
                console.log(response); 
                window.location.href = 'sendmail.php';
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    });
});

    </script>
</body>
</html>
