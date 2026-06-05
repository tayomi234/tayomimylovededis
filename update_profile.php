<?php
session_start();
include "db_connect.php";

if (!isset($_SESSION['user_id'])) {
    exit();
}

$user_id = $_SESSION['user_id'];

$first_name = mysqli_real_escape_string($conn,$_POST['first_name']);
$last_name = mysqli_real_escape_string($conn,$_POST['last_name']);
$email = mysqli_real_escape_string($conn,$_POST['email']);
$phone = mysqli_real_escape_string($conn,$_POST['phone']);

mysqli_query($conn,"
UPDATE users
SET
first_name='$first_name',
last_name='$last_name',
email='$email',
phone='$phone'
WHERE id='$user_id'
");

header("Location: account.php");