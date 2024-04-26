<?php
    require_once('config.php');
    session_start();

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;
    use PHPMailer\PHPMailer\Exception;

    require 'phpmailer/src/Exception.php';
    require 'phpmailer/src/PHPMailer.php';
    require 'phpmailer/src/SMTP.php';

        $response = 0;
        $email = $_POST['mail'];
    
        $query = mysqli_query($conn, "SELECT * FROM users WHERE email = '$email' AND status = '1'");
        if (mysqli_num_rows($query) > 0) {
            $user_details = mysqli_fetch_object($query);

            $user_name = $user_details->name;
            $userId = $user_details->user_id;                               
            $_SESSION['userId'] = $userId;
            $_SESSION['resend_email'] = $email;

            $otp = mt_rand(100000, 999999);

            $updateQuery = mysqli_query($conn, "UPDATE users SET otp = '$otp' WHERE email = '$email'");

            $mail = new PHPMailer(true);

            try {
                $mail->SMTPDebug = SMTP::DEBUG_OFF;                     
                $mail->isSMTP();                                            
                $mail->Host       = 'smtp.gmail.com';                     
                $mail->SMTPAuth   = true;                                   
                $mail->Username   = 'pavan1738111176@gmail.com';                   
                $mail->Password   = 'knzyikzoeztavtby';                               
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;            
                $mail->Port       = 587;                                    


                $mail->setFrom('pavan1738111176@gmail.com', 'Stock');
                $mail->addAddress($email,$user_name);     
                    
                $mail->addReplyTo('pavan1738111176@gmail.com', 'Stock');
            

                //Content
                $mail->isHTML(true);                                  
                $mail->Subject = 'Your OTP';
                $mail->Body    = 'Your OTP for verification is: ' . $otp;
                $mail->AltBody = 'Your OTP for verification is: ' . $otp;

                $mail->send();

                $response = 1;
                
            } catch (Exception $e) {
                $response = 0;
            }
            
        }else{
            $response = 2;
        }
echo json_encode($response);
?>
