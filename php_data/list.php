<?php

// Membuat koneksi ke database MySQL
$connection = new mysqli("localhost", "root", "", "data_tugas");

// Mengeksekusi query SQL untuk mengambil semua data KTP dari tabel data_ktp
$data = mysqli_query($connection, "SELECT * FROM data_ktp");

// Mengambil semua hasil query sebagai array asosiatif
$data = mysqli_fetch_all($data, MYSQLI_ASSOC);

// Mengembalikan data dalam format JSON
echo json_encode($data);

// Menutup koneksi ke database setelah selesai menggunakan
$connection->close();
