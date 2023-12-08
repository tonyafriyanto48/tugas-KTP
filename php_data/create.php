<?php

// Membuat koneksi ke database MySQL
$connection = new mysqli("localhost", "root", "", "data_tugas");

// Check connection
if ($connection->connect_error) {
    // Menampilkan pesan kesalahan jika koneksi gagal
    die("Connection failed: " . $connection->connect_error);
}

// Mengambil data dari input form dan menghindari serangan SQL injection
$nama           = $connection->real_escape_string($_POST['nama']);
$tanggal_lahir  = $connection->real_escape_string($_POST['tanggal_lahir']);
$provinsi       = $connection->real_escape_string($_POST['provinsi']);
$tempat_tinggal = $connection->real_escape_string($_POST['tempat_tinggal']);
$date           = date('Y-m-d');

// Membuat query SQL untuk menyimpan data ke tabel data_ktp
$sql = "INSERT INTO data_ktp (nama, tanggal_lahir, provinsi, tempat_tinggal, date) VALUES ('$nama', '$tanggal_lahir', '$provinsi', '$tempat_tinggal', '$date')";

// Menjalankan query dan mengecek keberhasilannya
if ($connection->query($sql) === TRUE) {
    // Menampilkan pesan berhasil jika query berhasil dijalankan
    echo json_encode(['message' => 'Data input successfully']);
} else {
    // Menampilkan pesan kesalahan jika query gagal dijalankan
    echo json_encode(['message' => 'Data failed to input: ' . $connection->error]);
}

// Menutup koneksi ke database setelah selesai menggunakan
$connection->close();
