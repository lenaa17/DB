-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Sep 2024 pada 17.16
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `ID_Barang` varchar(5) NOT NULL,
  `Nama_Barang` varchar(255) NOT NULL,
  `Tanggal_Terima` datetime NOT NULL,
  `Stok_Barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`ID_Barang`, `Nama_Barang`, `Tanggal_Terima`, `Stok_Barang`) VALUES
('B001', 'Laptop', '2023-01-15 08:00:00', 50),
('B002', 'Printer', '2023-02-20 10:30:00', 30),
('B003', 'Mouse', '2023-03-10 14:45:00', 100),
('B004', 'Headset', '2023-04-05 11:20:00', 20),
('B005', 'Monitor', '2023-05-12 15:10:00', 40),
('B006', 'Keyboard', '2023-06-20 09:30:00', 60),
('B007', 'Scanner', '2023-07-08 13:45:00', 15),
('B008', 'Speaker', '2023-08-15 16:20:00', 25),
('B009', 'External HDD', '2023-09-25 09:50:00', 12),
('B010', 'Webcam', '2023-10-30 12:15:00', 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `ID_Pembeli` varchar(5) NOT NULL,
  `ID_Barang` varchar(5) NOT NULL,
  `Tanggal_Beli` datetime NOT NULL,
  `Jumlah_Pembelian` int(11) NOT NULL,
  `Nama_Pembeli` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`ID_Pembeli`, `ID_Barang`, `Tanggal_Beli`, `Jumlah_Pembelian`, `Nama_Pembeli`) VALUES
('P001', 'B001', '2023-04-05 09:15:00', 5, 'John Doe'),
('P002', 'B002', '2023-05-12 11:45:00', 2, 'Jane Smith'),
('P003', 'B001', '2023-06-20 13:30:00', 10, 'Bob Johnson'),
('P004', 'B003', '2023-07-25 10:00:00', 8, 'Alice Brown'),
('P005', 'B005', '2023-08-30 14:30:00', 3, 'Charlie White'),
('P006', 'B006', '2023-09-15 16:45:00', 6, 'David Black'),
('P007', 'B008', '2023-10-10 08:30:00', 4, 'Eva Green'),
('P008', 'B009', '2023-11-20 12:00:00', 2, 'Frank Red'),
('P009', 'B004', '2023-12-05 14:15:00', 7, 'Grace Blue'),
('P010', 'B010', '2023-01-10 11:30:00', 9, 'Henry Orange');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_Barang`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`ID_Pembeli`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
