<?php
  error_reporting(E_ERROR | E_PARSE);
$server="localhost";
$username="root";
$password="";
$database="mail_sender";
$conn=new mysqli($server,$username,$password,$database);
if($conn){
    // echo "successfull";
}
else{
    echo "not successfull"; 
}
?>


