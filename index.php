<?php
session_start();
if (!isset($_SESSION['login_ok'])) {
    header("Location: login.php");
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Document</title>
</head>

<body>
    <div class="container-fluid !direction !spacing">
        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#"><i class="fas fa-home">Active</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Danh bạ người dùng</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Danh bạ đơn vị</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.php">Đăng xuất</a>
            </li>
        </ul>
    </div>
</body>

</html>