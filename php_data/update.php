<?php

// Membuat koneksi ke database MySQL
$connection = new mysqli("localhost", "root", "", "data_tugas");

// Mengambil nilai 'nik', 'nama', 'tanggal_lahir', 'provinsi', dan 'tempat_tinggal' dari data yang dikirim melalui metode POST
$nik            = $_POST['nik']; // Anggap Lu memiliki kolom formulir bernama 'nik'
$nama           = $_POST['nama'];
$tanggal_lahir  = $_POST['tanggal_lahir'];
$provinsi       = $_POST['provinsi']; // Perbaiki typo di sini
$tempat_tinggal = $_POST['tempat_tinggal'];
$date           = date('Y-m-d');

// Mengeksekusi query SQL untuk mengupdate data KTP berdasarkan 'nik'
$result = mysqli_query($connection, "UPDATE data_ktp SET 
    nama='$nama', 
    tanggal_lahir='$tanggal_lahir',
    provinsi='$provinsi', -- // Perbaiki typo di sini
    tempat_tinggal='$tempat_tinggal',
    date='$date'
    WHERE nik='$nik'");

// Memeriksa keberhasilan eksekusi query
if ($result) {
    // Menampilkan pesan berhasil jika data berhasil diupdate
    echo json_encode([
        'message' => 'Data edit successfully'
    ]);
} else {
    // Menampilkan pesan kesalahan jika data gagal diupdate
    echo json_encode([
        'message' => 'Data Failed to update'
    ]);
}

// Menutup koneksi ke database setelah selesai menggunakan
$connection->close();
?>
