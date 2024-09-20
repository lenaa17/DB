-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Sep 2024 pada 17.19
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
-- Database: `hehegroceries`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `msbrand`
--

CREATE TABLE `msbrand` (
  `BrandID` char(5) NOT NULL CHECK (`BrandID` regexp '^BR[0-9]{3}$'),
  `BrandName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mscustomer`
--

CREATE TABLE `mscustomer` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^CU[0-9]{3}'),
  `CustomerName` varchar(50) NOT NULL,
  `CustomerGender` varchar(10) NOT NULL,
  `CustomerAddress` varchar(50) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerDOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `msbrand`
--
ALTER TABLE `msbrand`
  ADD PRIMARY KEY (`BrandID`);

--
-- Indeks untuk tabel `mscustomer`
--
ALTER TABLE `mscustomer`
  ADD PRIMARY KEY (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
