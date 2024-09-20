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
-- Database: `latsol4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mscategory`
--

CREATE TABLE `mscategory` (
  `CategoryID` char(5) NOT NULL CHECK (`CategoryID` regexp '^CA[0-9]{3}$'),
  `CategoryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mscustomer`
--

CREATE TABLE `mscustomer` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^CU[0-9]{3}$'),
  `CustomerName` varchar(50) NOT NULL,
  `CustomerGender` varchar(10) NOT NULL,
  `CustomerAddress` varchar(50) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerDOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `msemployee`
--

CREATE TABLE `msemployee` (
  `EmployeeID` char(5) NOT NULL CHECK (`EmployeeID` regexp '^EM[0-9]{3}$'),
  `EmployeeName` varchar(50) NOT NULL,
  `EmployeeGender` varchar(10) NOT NULL,
  `EmployeeAddress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `msproduct`
--

CREATE TABLE `msproduct` (
  `ProductID` char(5) NOT NULL CHECK (`ProductID` regexp '^PR[0-9]{3}$'),
  `CategoryID` char(5) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactiondetail`
--

CREATE TABLE `transactiondetail` (
  `TransactionID` char(5) NOT NULL,
  `ProductID` char(5) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactionheader`
--

CREATE TABLE `transactionheader` (
  `TransactionID` char(5) NOT NULL CHECK (`TransactionID` regexp '^TR[0-9]{3}$'),
  `EmployeeID` char(5) NOT NULL,
  `CustomerID` char(5) NOT NULL,
  `TransactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mscategory`
--
ALTER TABLE `mscategory`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indeks untuk tabel `mscustomer`
--
ALTER TABLE `mscustomer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `msemployee`
--
ALTER TABLE `msemployee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indeks untuk tabel `msproduct`
--
ALTER TABLE `msproduct`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indeks untuk tabel `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD KEY `TransactionID` (`TransactionID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indeks untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `msproduct`
--
ALTER TABLE `msproduct`
  ADD CONSTRAINT `msproduct_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `mscategory` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD CONSTRAINT `transactiondetail_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactionheader` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactiondetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `msproduct` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD CONSTRAINT `transactionheader_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `msemployee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionheader_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `mscustomer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
