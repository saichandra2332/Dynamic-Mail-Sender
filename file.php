<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style.css" />
    <title>Insert File</title>
    <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    :root {
        --blue: #0071FF;
        --light-blue: #B6DBF6;      
        --dark-blue: #005DD1;
        --grey: #f2f2f2;
    }

    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }


    .container {
        max-width: 400px;
        width: 100%;
        background: #fff;
        padding: 30px;
        border-radius: 30px;
    }
    .img-area {
        position: relative;
        width: 100%;
        height: 240px;
        background: var(--grey);
        margin-bottom: 30px;
        border-radius: 15px;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .img-area .icon {
        font-size: 100px;
    }
    .img-area h3 {
        font-size: 20px;
        font-weight: 500;
        margin-bottom: 6px;
    }
    .img-area p {
        color: #999;
    }
    .img-area p span {
        font-weight: 600;
    }
    .img-area img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        object-position: center;
        z-index: 100;
    }
    .img-area::before {
        content: attr(data-img);
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, .5);
        color: #fff;
        font-weight: 500;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        pointer-events: none;
        opacity: 0;
        transition: all .3s ease;
        z-index: 200;
    }
    .img-area.active:hover::before {
        opacity: 1;
    }
    .select-image {
        display: block;
        width: 100%;
        padding: 16px 0;	
        border-radius: 15px;
        background: black;
        color: #fff;
        font-weight: 500;
        font-size: 16px;
        border: none;
        cursor: pointer;
        transition: all .3s ease;
        border-radius: 50px;
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
        <?php
        require_once('config.php');
        ?>

    <div class="container">
    <select id="category">
        <option value="">Select Client</option>
        <?php
        $client_names = mysqli_query($conn,"SELECT * from clients WHERE client_status = '1'") or die(mysqli_error($conn));
        while ($client_name = mysqli_fetch_object($client_names)){
        ?>
        <option value="<?php echo $client_name->client_id ?>"><?php echo $client_name->client_name ?></option>
        <?php } ?>     
    </select><br><br>

        <form id="uploadForm" method="POST" enctype="multipart/form-data" action="">
            <input type="file" name="import_file" id="import_file" hidden>
            <div class="img-area" data-img="">
                <i class='bx bxs-cloud-upload icon'></i>
                <h3>Upload File</h3>
            </div>
            <button type="button" class="select-image" id="selectImage">Select File</button><br>
            <a id="downloadLink" href="#" download>formData().xlsx</a>
            <button type="submit" name="excel_submit" id="excel_submit" class="select-image">Submit</button>
        </form>
    </div>
           
        </div>
       
    </main>
</section>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    
    <script>
        const selectImage = document.getElementById('selectImage');
        const inputFile = document.getElementById('import_file');
        const imgArea = document.querySelector('.img-area');
        const uploadForm = document.getElementById('uploadForm');

        selectImage.addEventListener('click', function () {
            inputFile.click();
        });

        inputFile.addEventListener('change', function () {
            const fileName = inputFile.files[0].name;
            downloadLink.href = fileName;
            downloadLink.textContent = fileName;
        });

        uploadForm.addEventListener('submit', function (event) {
            const selectedOption = document.getElementById('category').value;
            if (!selectedOption) {
                event.preventDefault(); // Prevent form submission
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select a client!',
                });
            }
        });
    </script>
</body>
</html>
