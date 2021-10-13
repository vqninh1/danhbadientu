<?php
    session_start();
    include('config/db.php');
    if(isset($_GET['email']))
    {
        #truy van lấy dữ liệu user có email
        $emai = $_GET['email'];
        echo $_GET['activation'];
        $act = $_GET['activation'];

        $sql = "SELECT * FROM users where mail = 'email'";
        $query = mysqli_query($cnn,$sql1);
        if(mysqli_num_rows($query)==1)
        {
            $row = mysqli_fetch_assoc($query);
            if($row['activation'] == $act)
            {
                $sql2 = "UPDATE `users` SET `status` = '1' WHERE mail= '$email' ";
                mysqli_query($cnn,$sql2);
                header('Location: index.php');
            }
        }
    }