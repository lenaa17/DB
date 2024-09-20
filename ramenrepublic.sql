-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Sep 2024 pada 17.18
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
-- Database: `ramenrepublic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mscustomer`
--

CREATE TABLE `mscustomer` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^CU[0-9]{3}$'),
  `CustomerName` varchar(50) NOT NULL,
  `CustomerGender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mscustomer`
--

INSERT INTO `mscustomer` (`CustomerID`, `CustomerName`, `CustomerGender`) VALUES
('CU011', 'Ryan Rafael', 'Male');

-- --------------------------------------------------------

--
-- Struktur dari tabel `msramen`
--

CREATE TABLE `msramen` (
  `RamenID` char(5) NOT NULL CHECK (`RamenID` regexp '^RA[0-9]{3}$'),
  `RamenName` varchar(50) NOT NULL,
  `NoodleType` varchar(10) NOT NULL,
  `RamenPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `msricebowl`
--

CREATE TABLE `msricebowl` (
  `RiceBowlID` char(5) NOT NULL CHECK (`RiceBowlID` regexp '^RB[0-9]{3}$'),
  `RiceBowlName` varchar(50) NOT NULL,
  `RiceBowlPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `msstaff`
--

CREATE TABLE `msstaff` (
  `StaffID` char(5) NOT NULL CHECK (`StaffID` regexp '^ST[0-9]{3}$'),
  `StaffName` varchar(50) NOT NULL,
  `StaffGender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservation`
--

CREATE TABLE `reservation` (
  `reservationID` char(5) NOT NULL CHECK (`reservationID` regexp '^RV[0-9]{3}$'),
  `RiceBowlName` varchar(50) NOT NULL,
  `RiceBowlPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactiondetail`
--

CREATE TABLE `transactiondetail` (
  `TransactionID` char(5) NOT NULL,
  `RamenID` char(5) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactionheader`
--

CREATE TABLE `transactionheader` (
  `TransactionID` char(5) NOT NULL CHECK (`TransactionID` regexp '^TR[0-9]{3}$'),
  `CustomerID` char(5) NOT NULL,
  `StaffID` char(5) NOT NULL,
  `TransactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mscustomer`
--
ALTER TABLE `mscustomer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `msramen`
--
ALTER TABLE `msramen`
  ADD PRIMARY KEY (`RamenID`);

--
-- Indeks untuk tabel `msricebowl`
--
ALTER TABLE `msricebowl`
  ADD PRIMARY KEY (`RiceBowlID`);

--
-- Indeks untuk tabel `msstaff`
--
ALTER TABLE `msstaff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indeks untuk tabel `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationID`);

--
-- Indeks untuk tabel `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD KEY `TransactionID` (`TransactionID`),
  ADD KEY `RamenID` (`RamenID`);

--
-- Indeks untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD CONSTRAINT `transactiondetail_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactionheader` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactiondetail_ibfk_2` FOREIGN KEY (`RamenID`) REFERENCES `msramen` (`RamenID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD CONSTRAINT `transactionheader_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `mscustomer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionheader_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `msstaff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
