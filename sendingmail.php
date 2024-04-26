<?php
require_once('config.php');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $selectedEmails = explode(',', $_POST["selectedEmails"]); 
    $subject = $_POST["subject"];
    $body = isset($_POST["body"]) ? $_POST["body"] : ''; 
    if (empty($body)) {
        echo "Error: Body message is empty!";
        exit; 
    }

    foreach ($selectedEmails as $email) {
        if (!empty($email)) {
            $mail = new PHPMailer(true);
            // Configure PHPMailer
            $mail->SMTPDebug = SMTP::DEBUG_OFF;                     
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'saichandra2332@gmail.com'; // Replace with your email address
            $mail->Password = 'eoqpkjqklpdxnbyl'; // Replace with your email password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;            
            $mail->Port = 587; 
            $mail->setFrom('saichandra2332@gmail.com'); // Replace with your email address
            $mail->addAddress($email);
            $mail->Subject = $subject;
            $mail->Body = $body;

            // $mail->send();
            
            if($mail->send()) {
                echo "Email sent successfully to: $email\n";
            } else {
                echo "Failed to send email to: $email. Error: " . $mail->ErrorInfo . "\n";
            }
        }
    }
}
?>
