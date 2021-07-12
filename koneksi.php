<?php

$host = 'localhost';
$username = 'root';
$password = '';
$db_name = 'sistem penjualan'; // nama database
$conn = new mysqli($host, $username, $password, $db_name);

// Check connection
if (mysqli_connect_errno()){
	echo "koneksi database gagal : " . mysqli_connect_error();
}

?>