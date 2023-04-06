<?php
include 'connection.php';
$email=$_POST['email'];
$password=$_POST['password'];
$query=mysqli_query($con,"select * from login_tb where email='$email' and password='$password'");
if(mysqli_num_rows($query)>0){
    $row=mysqli_fetch_assoc($query);
    $response['message']="success";
    $response['id']=$row['login_id'];
    echo json_encode($response);
}
else{
    $response['message']="failed";
}


?>