<?php
use PHPMailer\PHPMailer\PHPMailer;
include './vendor/autoload.php';
class SMTPMailer{

    public function load(){
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->SMTPDebug = 0;
        $mail->Host = "bh-69.webhostbox.net";
        $mail->SMTPAuth = TRUE;
        $mail->isHTML(TRUE);
        $mail->Username = "";
        $mail->Password = "";
        $mail->Port = 587;
        $mail->CharSet = "utf-8";
        $mail->From = "saisabbavarapu2002@gmail.com";
        $mail->FromName = "Sai.IN";
        return $mail;
    }
}
?>