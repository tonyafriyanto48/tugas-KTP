<?php

// Membuat koneksi ke database MySQL
$connection = new mysqli("localhost", "root", "", "data_tugas");

// Mengambil nilai 'nik' dari data yang dikirim melalui metode POST
$nik = $_POST['nik'];

// Mengeksekusi query SQL untuk menghapus data dengan 'nik' tertentu dari tabel data_ktp
$result = mysqli_query($connection, "DELETE FROM data_ktp WHERE nik=" . $nik);

// Memeriksa keberhasilan eksekusi query
if ($result) {
    // Menampilkan pesan berhasil jika data berhasil dihapus
    echo json_encode([
        'message' => 'Data delete successfully'
    ]);
} else {
    // Menampilkan pesan kesalahan jika data gagal dihapus
    echo json_encode([
        'message' => 'Data Failed to delete'
    ]);
}

// Menutup koneksi ke database setelah selesai menggunakan
$connection->close();
