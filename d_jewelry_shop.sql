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
-- Database: `d'jewelry shop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^CU[[:digit:]]{3}$'),
  `CustomerName` varchar(50) NOT NULL CHECK (octet_length(`CustomerName`) <= 50),
  `CustomerGender` varchar(10) DEFAULT NULL CHECK (`CustomerGender` = 'Male' or `CustomerGender` = 'Female'),
  `CustomerAddress` varchar(50) DEFAULT NULL CHECK (`CustomerAddress` regexp '[[:alpha:]]{1,} Street$'),
  `CustomerPhoneNumber` varchar(12) DEFAULT NULL CHECK (`CustomerPhoneNumber` regexp '^[[:digit:]]+$'),
  `customeremail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerGender`, `CustomerAddress`, `CustomerPhoneNumber`, `customeremail`) VALUES
('CU001', 'Novelia Amata', 'Male', 'Redhawk Street', '087812443123', ''),
('CU002', 'Gerry Abuda', 'Male', 'Kapolrasa Street', '087875194227', ''),
('CU003', 'Ronaldo Rossie', 'Male', 'Kebon Jeruk Street', '088875194157', ''),
('CU004', 'Jennie Bluepink', 'Female', 'Adajika Street', '081234432111', ''),
('CU005', 'Rose Amarta', 'Female', 'Quaryas Street', '081234194757', ''),
('CU006', 'Agustina', 'Female', 'Green Street', '088108085656', ''),
('CU007', 'Agustono', 'Male', 'Kaloa Street', '081233212222', ''),
('CU008', 'Neneng Ramarja', 'Female', 'Bobasa Street', '082156567777', ''),
('CU009', 'Momo Twaise', 'Female', 'Shibuya Street', '081211770032', ''),
('CU010', 'Rossie Marco', 'Male', 'Alogada Street', '088112125314', ''),
('CU011', 'Priocesa', 'Female', 'Kalao Street', '085678123876', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailsalestransaction`
--

CREATE TABLE `detailsalestransaction` (
  `SalesID` char(5) NOT NULL,
  `JewelryID` char(5) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailsalestransaction`
--

INSERT INTO `detailsalestransaction` (`SalesID`, `JewelryID`, `Quantity`) VALUES
('SA001', 'JE001', 2),
('SA001', 'JE002', 3),
('SA002', 'JE001', 4),
('SA002', 'JE004', 2),
('SA002', 'JE006', 6),
('SA003', 'JE002', 8),
('SA004', 'JE002', 1),
('SA005', 'JE001', 3),
('SA005', 'JE002', 1),
('SA006', 'JE010', 2),
('SA007', 'JE001', 2),
('SA007', 'JE002', 3),
('SA007', 'JE003', 4),
('SA007', 'JE004', 2),
('SA008', 'JE001', 8),
('SA008', 'JE002', 1),
('SA008', 'JE006', 6),
('SA009', 'JE009', 1),
('SA009', 'JE010', 3),
('SA010', 'JE001', 4),
('SA011', 'JE004', 4),
('SA012', 'JE005', 4),
('SA013', 'JE006', 4),
('SA014', 'JE009', 3),
('SA015', 'JE009', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `headersalestransaction`
--

CREATE TABLE `headersalestransaction` (
  `SalesID` char(5) NOT NULL CHECK (`SalesID` regexp '^SA[[:digit:]]{3}$'),
  `CustomerID` char(5) DEFAULT NULL,
  `StaffID` char(5) DEFAULT NULL,
  `SalesDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `headersalestransaction`
--

INSERT INTO `headersalestransaction` (`SalesID`, `CustomerID`, `StaffID`, `SalesDate`) VALUES
('SA001', 'CU003', 'ST001', '2015-06-14'),
('SA002', 'CU001', 'ST004', '2015-07-13'),
('SA003', 'CU002', 'ST003', '2015-07-14'),
('SA004', 'CU004', 'ST002', '2015-07-15'),
('SA005', 'CU003', 'ST006', '2015-07-15'),
('SA006', 'CU010', 'ST010', '2015-09-14'),
('SA007', 'CU009', 'ST004', '2015-09-14'),
('SA008', 'CU009', 'ST005', '2015-09-14'),
('SA009', 'CU007', 'ST001', '2015-10-15'),
('SA010', 'CU006', 'ST007', '2015-10-15'),
('SA011', 'CU010', 'ST002', '2015-11-08'),
('SA012', 'CU001', 'ST004', '2015-11-13'),
('SA013', 'CU004', 'ST003', '2015-11-13'),
('SA014', 'CU004', 'ST002', '2015-11-15'),
('SA015', 'CU008', 'ST001', '2015-11-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jewelry`
--

CREATE TABLE `jewelry` (
  `JewelryID` char(5) NOT NULL CHECK (`JewelryID` regexp '^JE[[:digit:]]{3}$'),
  `JewelryTypeID` char(5) DEFAULT NULL,
  `JewelryName` varchar(50) NOT NULL,
  `JewelrySalesPrice` int(11) DEFAULT NULL,
  `JewelryCarat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jewelry`
--

INSERT INTO `jewelry` (`JewelryID`, `JewelryTypeID`, `JewelryName`, `JewelrySalesPrice`, `JewelryCarat`) VALUES
('JE001', 'JT001', 'Marine Taka', 1500000, 20),
('JE002', 'JT003', 'Heart D', 1300000, 15),
('JE003', 'JT007', 'Blaster Fruo', 1000000, 20),
('JE004', 'JT006', 'Foo Feed', 2000000, 18),
('JE005', 'JT009', 'Queeni Alab', 1000000, 20),
('JE006', 'JT003', 'Arabasta Fam', 2000000, 15),
('JE007', 'JT005', 'Big Mom Nana', 5000000, 25),
('JE008', 'JT005', 'Florla', 4000000, 34),
('JE009', 'JT005', 'Flogal', 5000000, 28),
('JE010', 'JT010', 'Shcwi', 5000000, 15),
('JE011', 'JT006', 'Egg Stone', 1500000, 24),
('JE012', 'JT002', 'Ruby Ring', 1000000, 10),
('JE013', 'JT006', 'Fairy Stone', 1000000, 22),
('JE014', 'JT001', 'Amegarise', 1000000, 12),
('JE015', 'JT002', 'Amulete Ring', 2000000, 25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jewelrytype`
--

CREATE TABLE `jewelrytype` (
  `JewelryTypeID` char(5) NOT NULL CHECK (`JewelryTypeID` regexp '^JT[[:digit:]]{3}$'),
  `JewelryTypeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jewelrytype`
--

INSERT INTO `jewelrytype` (`JewelryTypeID`, `JewelryTypeName`) VALUES
('JT001', 'Chains'),
('JT002', 'Ring'),
('JT003', 'Bracelet'),
('JT004', 'Pendant'),
('JT005', 'Necklace'),
('JT006', 'Heart Stone'),
('JT007', 'Metal'),
('JT008', 'Rose ld'),
('JT009', 'Ring Stone'),
('JT010', 'Silver-Sterling');

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `StaffID` char(5) NOT NULL CHECK (`StaffID` regexp '^ST[[:digit:]]{3}$'),
  `StaffName` varchar(50) NOT NULL CHECK (octet_length(`StaffName`) <= 50),
  `StaffGender` varchar(10) DEFAULT NULL CHECK (`StaffGender` = 'Male' or `StaffGender` = 'Female'),
  `StaffPhoneNumber` varchar(12) DEFAULT NULL CHECK (`StaffPhoneNumber` regexp '^[[:digit:]]+$'),
  `StaffSalary` int(11) DEFAULT NULL CHECK (`StaffSalary` >= 1000000 and `StaffSalary` <= 10000000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `staff`
--

INSERT INTO `staff` (`StaffID`, `StaffName`, `StaffGender`, `StaffPhoneNumber`, `StaffSalary`) VALUES
('ST001', 'Elisa Dargsosa', 'Female', '085750941221', 4000000),
('ST002', 'Hengky Santosa', 'Male', '088898781234', 4400000),
('ST003', 'Teddy Bearando', 'Male', '082134556614', 3200000),
('ST004', 'Miyayando', 'Male', '088833331221', 3800000),
('ST005', 'Angelica Wino', 'Female', '084321568756', 2000000),
('ST006', 'Jessica Amaro', 'Female', '088146758332', 2000000),
('ST007', 'Nando Redondo', 'Male', '088864723816', 5000000),
('ST008', 'Victoria Ana', 'Female', '088345871699', 3500000),
('ST009', 'Jiso Redpink', 'Female', '081264789825', 4300000),
('ST010', 'Valen Valantia', 'Female', '081257839247', 5300000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendor`
--

CREATE TABLE `vendor` (
  `VendorId` char(5) NOT NULL CHECK (`VendorId` regexp '^VE[0-9]{3}$'),
  `VendorName` varchar(50) NOT NULL,
  `VendorVolume` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `detailsalestransaction`
--
ALTER TABLE `detailsalestransaction`
  ADD KEY `fk_sales` (`SalesID`),
  ADD KEY `fk_jewelry` (`JewelryID`);

--
-- Indeks untuk tabel `headersalestransaction`
--
ALTER TABLE `headersalestransaction`
  ADD PRIMARY KEY (`SalesID`),
  ADD KEY `fk_customer` (`CustomerID`),
  ADD KEY `fk_staff` (`StaffID`);

--
-- Indeks untuk tabel `jewelry`
--
ALTER TABLE `jewelry`
  ADD PRIMARY KEY (`JewelryID`);

--
-- Indeks untuk tabel `jewelrytype`
--
ALTER TABLE `jewelrytype`
  ADD PRIMARY KEY (`JewelryTypeID`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indeks untuk tabel `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`VendorId`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailsalestransaction`
--
ALTER TABLE `detailsalestransaction`
  ADD CONSTRAINT `fk_jewelry` FOREIGN KEY (`JewelryID`) REFERENCES `jewelry` (`JewelryID`),
  ADD CONSTRAINT `fk_sales` FOREIGN KEY (`SalesID`) REFERENCES `headersalestransaction` (`SalesID`);

--
-- Ketidakleluasaan untuk tabel `headersalestransaction`
--
ALTER TABLE `headersalestransaction`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
