<?php
require_once('config.php');
session_start();
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

if(isset($_POST["send"])){
    $mail = new PHPMailer(true);

    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'saisabbavarapu2002@gmail.com';
    $mail->Password = 'onlewdvuqqkjeysf';
    $mail->SMTPSecure = 'ssl'; // or 'tls'
    $mail->Port = 465; // or 587 for TLS

    $mail->setFrom('saisabbavarapu2002@gmail.com');
    $mail->addAddress($_POST["checkAllHeader"]); // Corrected here
    $mail->Subject = $_POST["subject"]; // Ensure you have a field with name="subject" in your HTML form
    $mail->Body = $_POST["body"]; // Ensure you have a field with name="body" in your HTML form

    if($mail->send()) {
        echo "<script>alert('Sent Successfully');</script>";
    } else {
        echo "<script>alert('Failed to send. Error: " . $mail->ErrorInfo . "');</script>";
    }
}
?>
