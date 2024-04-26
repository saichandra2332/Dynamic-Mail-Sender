<?php
require_once('config.php');


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="style.css" />
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
            // Display the content of the requested page
            if (isset($page_content)) {
                echo $page_content;
            } else {
                // Display default content if no specific page is requested
                echo "Welcome to the Dashboard!";
            }
            ?>
        </div>
       
    </main>
</section>



</body>
</html>
