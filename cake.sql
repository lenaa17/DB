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
-- Database: `cake`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `budidata`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `budidata` (
`Transaction ID` varchar(5)
,`Transaction Date` varchar(8)
,`CustomerName` varchar(50)
,`CakeName` varchar(50)
,`CakePrice` float
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cakes`
--

CREATE TABLE `cakes` (
  `CakeID` char(5) NOT NULL CHECK (`CakeID` regexp '^CA[0-9]{3}$'),
  `CakeTypeID` char(5) NOT NULL,
  `CakeName` varchar(50) NOT NULL,
  `CakePrice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `caketypes`
--

CREATE TABLE `caketypes` (
  `CakeTypeID` char(5) NOT NULL CHECK (`CakeTypeID` regexp '^CT[0-9]{3}$'),
  `CakeTypeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chefs`
--

CREATE TABLE `chefs` (
  `ChefID` char(5) NOT NULL CHECK (`ChefID` regexp '^CH[0-9]{3}$'),
  `ChefName` varchar(50) NOT NULL,
  `ChefGender` varchar(6) NOT NULL,
  `ChefDOB` date NOT NULL,
  `ChefPhone` varchar(12) NOT NULL,
  `ChefEmail` varchar(50) NOT NULL,
  `ChefAddress` varchar(50) NOT NULL,
  `ChefPosition` varchar(20) NOT NULL,
  `ChefInstagram` varchar(50) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^CU[0-9]{3}$'),
  `CustomerName` varchar(50) NOT NULL,
  `CustomerGender` varchar(6) NOT NULL,
  `CustomerDOB` date NOT NULL,
  `CustomerPhone` varchar(12) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerAddress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `menu`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `menu` (
`Cakeid` char(5)
,`cakename` varchar(50)
,`Cake Price` varchar(13)
,`Cake Type` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactiondetails`
--

CREATE TABLE `transactiondetails` (
  `TransactionID` char(5) NOT NULL,
  `CakeID` char(5) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactionheader`
--

CREATE TABLE `transactionheader` (
  `TransactionID` char(5) NOT NULL CHECK (`TransactionID` regexp '^TR[0-9]{3}$'),
  `CustomerID` char(5) NOT NULL,
  `ChefID` char(5) NOT NULL,
  `TransactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur untuk view `budidata`
--
DROP TABLE IF EXISTS `budidata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `budidata`  AS SELECT reverse(lcase(`th`.`TransactionID`)) AS `Transaction ID`, date_format(`th`.`TransactionDate`,'%d %m %y') AS `Transaction Date`, `c`.`CustomerName` AS `CustomerName`, `ca`.`CakeName` AS `CakeName`, `ca`.`CakePrice` AS `CakePrice` FROM (((`transactionheader` `th` join `transactiondetails` `td` on(`th`.`TransactionID` = `td`.`TransactionID`)) join `customers` `c` on(`th`.`CustomerID` = `c`.`CustomerID`)) join `cakes` `ca` on(`td`.`CakeID` = `ca`.`CakeID`)) WHERE `c`.`CustomerName` like 'Budi Abdi Santoso' ;

-- --------------------------------------------------------

--
-- Struktur untuk view `menu`
--
DROP TABLE IF EXISTS `menu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu`  AS SELECT `c`.`CakeID` AS `Cakeid`, `c`.`CakeName` AS `cakename`, concat('$',`c`.`CakePrice`) AS `Cake Price`, ucase(`ca`.`CakeTypeName`) AS `Cake Type` FROM (`cakes` `c` join `caketypes` `ca` on(`c`.`CakeTypeID` = `ca`.`CakeTypeID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cakes`
--
ALTER TABLE `cakes`
  ADD PRIMARY KEY (`CakeID`),
  ADD KEY `CakeTypeID` (`CakeTypeID`);

--
-- Indeks untuk tabel `caketypes`
--
ALTER TABLE `caketypes`
  ADD PRIMARY KEY (`CakeTypeID`);

--
-- Indeks untuk tabel `chefs`
--
ALTER TABLE `chefs`
  ADD PRIMARY KEY (`ChefID`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `transactiondetails`
--
ALTER TABLE `transactiondetails`
  ADD KEY `TransactionID` (`TransactionID`),
  ADD KEY `CakeID` (`CakeID`);

--
-- Indeks untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ChefID` (`ChefID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cakes`
--
ALTER TABLE `cakes`
  ADD CONSTRAINT `cakes_ibfk_1` FOREIGN KEY (`CakeTypeID`) REFERENCES `caketypes` (`CakeTypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactiondetails`
--
ALTER TABLE `transactiondetails`
  ADD CONSTRAINT `transactiondetails_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactionheader` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactiondetails_ibfk_2` FOREIGN KEY (`CakeID`) REFERENCES `cakes` (`CakeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD CONSTRAINT `transactionheader_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionheader_ibfk_2` FOREIGN KEY (`ChefID`) REFERENCES `chefs` (`ChefID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
