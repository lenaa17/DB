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
-- Database: `latsol2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mscustomer`
--

CREATE TABLE `mscustomer` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^CU[0-9]{3}$'),
  `CustomerName` varchar(255) DEFAULT NULL,
  `CustomerEmail` varchar(255) DEFAULT NULL,
  `CustomerGender` varchar(250) DEFAULT NULL,
  `CustomerAge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mscustomer`
--

INSERT INTO `mscustomer` (`CustomerID`, `CustomerName`, `CustomerEmail`, `CustomerGender`, `CustomerAge`) VALUES
('CU001', 'Emily Johnson', 'emily@gmail.com', 'Female', 28),
('CU002', 'Michael Brown', 'michael@gmail.com', 'Male', 35),
('CU003', 'Sophia Williams', 'sophia@gmail.com', 'Female', 22),
('CU004', 'James Miller', 'james@gmail.com', 'Male', 30),
('CU005', 'Emma Davis', 'emma@gmail.com', 'Female', 25),
('CU006', 'David Wilson', 'david@gmail.com', 'Male', 28),
('CU007', 'Olivia Lee', 'olivia@gmail.com', 'Female', 40),
('CU008', 'William Moore', 'william@gmail.com', 'Male', 33),
('CU009', 'Ava Turner', 'ava@gmail.com', 'Female', 29),
('CU010', 'Liam Parker', 'liam@gmail.com', 'Male', 31);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msproduct`
--

CREATE TABLE `msproduct` (
  `ProductID` char(5) NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productTypeID` char(5) DEFAULT NULL,
  `productStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msproduct`
--

INSERT INTO `msproduct` (`ProductID`, `productName`, `productTypeID`, `productStock`) VALUES
('PR001', 'Smartphone', 'PT001', 50),
('PR002', 'Laptop', 'PT001', 30),
('PR003', 'T-Shirt', 'PT002', 100),
('PR004', 'Jeans', 'PT002', 70),
('PR005', 'Refrigerator', 'PT001', 20),
('PR006', 'Microwave', 'PT001', 25),
('PR007', 'Novel', 'PT003', 80),
('PR008', 'Sci-Fi Book', 'PT003', 40),
('PR009', 'Romance Book', 'PT003', 60),
('PR010', 'TV', 'PT001', 45);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msproducttype`
--

CREATE TABLE `msproducttype` (
  `productTypeID` char(5) NOT NULL CHECK (`productTypeID` regexp '^PT[0-9]{3}$'),
  `productTypeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msproducttype`
--

INSERT INTO `msproducttype` (`productTypeID`, `productTypeName`) VALUES
('PT001', 'Electronics'),
('PT002', 'Clothing'),
('PT003', 'Books');

-- --------------------------------------------------------

--
-- Struktur dari tabel `msstaff`
--

CREATE TABLE `msstaff` (
  `staffID` char(5) NOT NULL CHECK (`staffID` regexp '^ST[0-9]{3}$'),
  `staffName` varchar(255) DEFAULT NULL,
  `staffEmail` varchar(255) DEFAULT NULL,
  `staffGender` varchar(250) DEFAULT NULL,
  `StaffAge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msstaff`
--

INSERT INTO `msstaff` (`staffID`, `staffName`, `staffEmail`, `staffGender`, `StaffAge`) VALUES
('ST001', 'Isabella Johnson', 'isabella@gmail.com', 'Female', 27),
('ST002', 'Noah Williams', 'noah@gmail.com', 'Male', 34),
('ST003', 'Mia Davis', 'mia@gmail.com', 'Female', 29),
('ST004', 'Liam Brown', 'liam@gmail.com', 'Male', 26),
('ST005', 'Sophia Miller', 'sophia@gmail.com', 'Female', 31),
('ST006', 'William Wilson', 'william@gmail.com', 'Male', 33),
('ST007', 'Ava Lee', 'ava@gmail.com', 'Female', 24),
('ST008', 'James Turner', 'james@gmail.com', 'Male', 30),
('ST009', 'Emma Parker', 'emma@gmail.com', 'Female', 25),
('ST010', 'Oliver Moore', 'oliver@gmail.com', 'Male', 28);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msvendor`
--

CREATE TABLE `msvendor` (
  `VendorID` char(5) NOT NULL CHECK (`VendorID` regexp '^VE[0-9]{3}$'),
  `VendorName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactiondetail`
--

CREATE TABLE `transactiondetail` (
  `TransactionID` char(5) NOT NULL,
  `ProductID` char(5) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactiondetail`
--

INSERT INTO `transactiondetail` (`TransactionID`, `ProductID`, `Quantity`) VALUES
('TR001', 'PR001', 2),
('TR001', 'PR003', 1),
('TR002', 'PR004', 3),
('TR003', 'PR002', 1),
('TR003', 'PR009', 1),
('TR004', 'PR007', 2),
('TR004', 'PR010', 3),
('TR005', 'PR001', 1),
('TR005', 'PR005', 2),
('TR006', 'PR002', 1),
('TR007', 'PR003', 3),
('TR008', 'PR004', 2),
('TR009', 'PR006', 3),
('TR009', 'PR009', 2),
('TR010', 'PR010', 1),
('TR011', 'PR001', 1),
('TR011', 'PR005', 2),
('TR012', 'PR002', 1),
('TR013', 'PR003', 3),
('TR014', 'PR004', 2),
('TR015', 'PR006', 3),
('TR015', 'PR009', 2),
('TR016', 'PR010', 1),
('TR017', 'PR002', 2),
('TR017', 'PR005', 1),
('TR018', 'PR001', 2),
('TR018', 'PR005', 2),
('TR018', 'PR007', 3),
('TR019', 'PR003', 1),
('TR019', 'PR006', 4),
('TR019', 'PR009', 1),
('TR020', 'PR002', 1),
('TR020', 'PR004', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactionheader`
--

CREATE TABLE `transactionheader` (
  `TransactionID` char(5) NOT NULL,
  `CustomerID` char(5) DEFAULT NULL,
  `StaffID` char(5) DEFAULT NULL,
  `TransactionDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactionheader`
--

INSERT INTO `transactionheader` (`TransactionID`, `CustomerID`, `StaffID`, `TransactionDate`) VALUES
('TR001', 'CU001', 'ST003', '2017-03-08'),
('TR002', 'CU003', 'ST002', '2017-06-10'),
('TR003', 'CU007', 'ST009', '2017-09-12'),
('TR004', 'CU005', 'ST006', '2017-12-23'),
('TR005', 'CU002', 'ST004', '2018-02-15'),
('TR006', 'CU010', 'ST005', '2018-04-17'),
('TR007', 'CU008', 'ST001', '2018-06-11'),
('TR008', 'CU004', 'ST007', '2018-08-29'),
('TR009', 'CU009', 'ST010', '2018-10-14'),
('TR010', 'CU006', 'ST008', '2018-12-05'),
('TR011', 'CU003', 'ST006', '2019-07-02'),
('TR012', 'CU009', 'ST002', '2019-11-22'),
('TR013', 'CU010', 'ST007', '2020-06-11'),
('TR014', 'CU005', 'ST003', '2020-08-03'),
('TR015', 'CU002', 'ST009', '2021-04-30'),
('TR016', 'CU004', 'ST005', '2021-11-25'),
('TR017', 'CU006', 'ST001', '2022-05-18'),
('TR018', 'CU008', 'ST010', '2022-09-06'),
('TR019', 'CU001', 'ST008', '2023-01-20'),
('TR020', 'CU007', 'ST004', '2023-03-29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mscustomer`
--
ALTER TABLE `mscustomer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `msproduct`
--
ALTER TABLE `msproduct`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `productTypeID` (`productTypeID`);

--
-- Indeks untuk tabel `msproducttype`
--
ALTER TABLE `msproducttype`
  ADD PRIMARY KEY (`productTypeID`);

--
-- Indeks untuk tabel `msstaff`
--
ALTER TABLE `msstaff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indeks untuk tabel `msvendor`
--
ALTER TABLE `msvendor`
  ADD PRIMARY KEY (`VendorID`);

--
-- Indeks untuk tabel `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD PRIMARY KEY (`TransactionID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

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
-- Ketidakleluasaan untuk tabel `msproduct`
--
ALTER TABLE `msproduct`
  ADD CONSTRAINT `msproduct_ibfk_1` FOREIGN KEY (`productTypeID`) REFERENCES `msproducttype` (`productTypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `transactionheader_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `mscustomer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionheader_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `msstaff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
