<?php

// Membuat koneksi ke database MySQL
$connection = new mysqli("localhost", "root", "", "data_tugas");

// Mengambil nilai 'nik' dari data yang dikirim melalui metode GET
$nik = $_GET['nik'];

// Mengeksekusi query SQL untuk mengambil data KTP dengan 'nik' tertentu dari tabel data_ktp
$data = mysqli_query($connection, "SELECT * FROM data_ktp WHERE nik=" . $nik);

// Mengambil hasil query sebagai array asosiatif
$data = mysqli_fetch_array($data, MYSQLI_ASSOC);

// Mengembalikan data dalam format JSON
echo json_encode($data);

// Menutup koneksi ke database setelah selesai menggunakan
$connection->close();
