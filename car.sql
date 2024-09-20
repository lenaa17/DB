-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Sep 2024 pada 17.20
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
-- Database: `car`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_car`
--

CREATE TABLE `ms_car` (
  `car_id` char(5) NOT NULL,
  `car_name` varchar(100) NOT NULL,
  `car_brand` varchar(100) NOT NULL,
  `car_rent_phone` int(11) NOT NULL,
  `car_speed` double DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_customer`
--

CREATE TABLE `ms_customer` (
  `customer_id` char(5) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_dob` date NOT NULL,
  `customer_gender` varchar(100) NOT NULL,
  `customer_address` varchar(100) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_staff`
--

CREATE TABLE `ms_staff` (
  `staff_id` char(5) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `staff_phone` varchar(15) NOT NULL,
  `staff_dob` date NOT NULL,
  `staff_gender` varchar(10) NOT NULL,
  `staff_address` varchar(100) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `transaction_id` char(5) NOT NULL,
  `car_id` char(5) NOT NULL,
  `duration` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_header`
--

CREATE TABLE `transaction_header` (
  `transaction_id` char(5) NOT NULL,
  `transaction_date` date NOT NULL,
  `staff_id` char(5) NOT NULL,
  `customer_id` char(5) NOT NULL
) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ms_car`
--
ALTER TABLE `ms_car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indeks untuk tabel `ms_customer`
--
ALTER TABLE `ms_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `ms_staff`
--
ALTER TABLE `ms_staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indeks untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`transaction_id`,`car_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indeks untuk tabel `transaction_header`
--
ALTER TABLE `transaction_header`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `transaction_detail_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_header` (`transaction_id`),
  ADD CONSTRAINT `transaction_detail_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `ms_car` (`car_id`);

--
-- Ketidakleluasaan untuk tabel `transaction_header`
--
ALTER TABLE `transaction_header`
  ADD CONSTRAINT `transaction_header_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `ms_staff` (`staff_id`),
  ADD CONSTRAINT `transaction_header_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ms_customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
