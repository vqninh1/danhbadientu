<?php
    session_start();
    $email = $_POST['email'];
    $pass = $_POST['pass'];

    $sql_1 = "select * from users where email = '$email'";
    $result_1 = mysqli_query($conn, $sql_1);

    if (mysqli_num_rows($result_1)>0){
       $row=mysqli_fetch_assoc($result_1);
       $pass_saved = $row['password'];
       if(password_verify($pass, $pass_saved) and $row['status'] == 1){
           $_SESSION['login_ok']=$email;
           header("Location: index.php");
       }else{
        $response = 'failed_password';
        header("Location: login.php?response=$response");
       }
    }else{
        $response = 'failed_email';
        header("Location: login.php?response=$response");
    }
?>