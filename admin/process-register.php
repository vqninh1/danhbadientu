<?php
    //lưu giá trị vào các biến
    $username  = $_POST['username'];
    $email     = $_POST['email'];
    $pass1     = $_POST['pass1'];
    $pass2     = $_POST['pass2'];
    //quy trình 3(4) bước:
    //bước 1 kết nối sql
    $conn=mysqli_connect('localhost','root','','dhtl');
    if(!$conn){
        die("Không thể kết nối,kiểm tra lại các tham số kết nối");
    }
    //bước 2 thực hiến truy vấn
    //2.1 kiểm tra email trùng hay k
    $sql_1= "SELECT * FROM db_nguoidung WHERE email='$email'";
    $result_1=mysqli_query($conn,$sql_1);

    if(mysqli_num_rows($result_1) >0){
        $value='existed';
        header("Location:register.php?response=$value");
    }else{
        //2.2 không trùng email mới lưu
        $pass_hash= password_hash($pass1,PASSWORD_DEFAULT);
        $sql_2="INSERT into db_nguoidung (tendangnhap,email,matkhau) VALUES ('$username','$email','$pass_hash')";
        $result_2=mysqli_query($conn,$sql_2);

        if($result_2>0){
            $value='successfully';
            header("Location:register.php?response=$value");
        }
}
?>