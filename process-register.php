<?php
include('../config/db.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'Exception.php';
require 'PHPMailer.php';
require 'SMTP.php';
$first_Name = $_POST['firstName'];
$last_Name = $_POST['lastName'];
$email = $_POST['email'];
$pass1 = $_POST['pass1'];
$pass2 = $_POST['pass2'];

$sql_1 = "select * from users where email = '$email'";
$result_1 = mysqli_query($conn, $sql_1);


if (mysqli_num_rows($result_1) > 0) {
    $value = 'existed';
    header("Location: register.php?response=$value");
} else {
    $pass_hash = password_hash($pass1, PASSWORD_DEFAULT);
    $sql_2 = "insert into users(first_name, last_name, email, password) values ('$first_Name','$last_Name','$email','$pass_hash')";
    $result_2 = mysqli_query($conn, $sql_2);
    $mail = new PHPMailer(true);


    try {
        //Server settings
        $mail->SMTPDebug = SMTP::DEBUG_SERVER; // Enable verbose debug output
        $mail->isSMTP(); // gửi mail SMTP
        $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
        $mail->SMTPAuth = true; // Enable SMTP authentication
        $mail->Username = 'vqninh1@gmail.com'; // SMTP username
        $mail->Password = 'agvyvoywphpsktxg'; // SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
        $mail->Port = 587; // TCP port to connect to
        $mail->CharSet = 'UTF-8';
        //Recipients
        $mail->setFrom('vqninh1@gmail.com', 'Văn phòng Khoa CNTT - Trường ĐH Thủy lợi');

        $mail->addReplyTo('vqninh1@gmail.com', 'Văn phòng Khoa CNTT - Trường ĐH Thủy lợi');

        $mail->addAddress($email); // Add a recipient   

        // Attachments
        // $mail->addAttachment('pdf/XTT/'.$data[11].'.pdf', $data[11].'_1.pdf'); // Add attachments
        //$mail->addAttachment('pdf/Giay_bao_mat_sau.pdf'); // Optional name

        // Content
        $mail->isHTML(true);   // Set email format to HTML
        $tieude = '[Đăng kí tài khoản ] kích hoạt tài khoản';
        $mail->Subject = $tieude;

        $str=rand();
        $code = md5($str);
        // Mail body content 
        $bodyContent = '<p>Chào mừng bạn đến với dbdt</h1>';
        $bodyContent .= '<p>Bạn vui lòng nhấp vào đường link dưới đây để kích hoạt tài khoản</p>';
        $bodyContent .= '<p><a href="http://localhost/danhbadt/admin/activation.php?email='.$email.'&activation='.$strActivation.'">Click here</a></p>';

        $mail->Body = $bodyContent;
        // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
        if ($mail->send()) {
            echo 'Thư đã được gửi đi';
        } else {
            echo 'Lỗi. Thư chưa gửi được';
        }
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }

    if ($result_2 > 0) {
        $value = 'successfully';
        header("Location: register.php?response=$value");
    }
}
?