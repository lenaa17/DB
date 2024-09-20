-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Sep 2024 pada 17.21
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
-- Database: `bluejack bakery`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `breadsalesmarch`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `breadsalesmarch` (
`BreadID` char(5)
,`BreadName` varchar(50)
,`BreadPrice` int(10)
,`BreadType` varchar(29)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msbread`
--

CREATE TABLE `msbread` (
  `BreadID` char(5) NOT NULL CHECK (`BreadID` regexp '^BR[0-9]{3}$'),
  `BreadTypeID` char(5) NOT NULL,
  `BreadName` varchar(50) NOT NULL,
  `BreadPrice` int(10) NOT NULL,
  `BreadStock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msbread`
--

INSERT INTO `msbread` (`BreadID`, `BreadTypeID`, `BreadName`, `BreadPrice`, `BreadStock`) VALUES
('BR001', 'BT002', 'Bagel', 21000, 50),
('BR002', 'BT001', 'Banana bread', 17500, 120),
('BR003', 'BT004', 'Belgian waffle', 45000, 25),
('BR004', 'BT003', 'Bread Stick', 15000, 200),
('BR005', 'BT002', 'Dorayaki', 37500, 75),
('BR006', 'BT007', 'Curry Bread', 30500, 35),
('BR007', 'BT006', 'White Bread ', 12500, 200),
('BR008', 'BT009', 'Melon Pan', 50000, 50),
('BR009', 'BT010', 'Yakisoba Pan', 32500, 75),
('BR010', 'BT008', 'Pretzel', 42700, 35),
('BR011', 'BT005', 'Roti Canai', 27500, 75),
('BR012', 'BT007', 'Roti Buaya', 47500, 10),
('BR013', 'BT006', 'Texas Toast', 36500, 25),
('BR014', 'BT001', 'Soda Bread', 30500, 50),
('BR015', 'BT007', 'Choco chips Cookies', 33500, 60);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msbreadtype`
--

CREATE TABLE `msbreadtype` (
  `BreadTypeID` char(5) NOT NULL CHECK (`BreadTypeID` regexp '^BT[0-9]{3}$'),
  `BreadTypeName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msbreadtype`
--

INSERT INTO `msbreadtype` (`BreadTypeID`, `BreadTypeName`) VALUES
('BT001', 'Baguette'),
('BT002', 'Brioche'),
('BT003', 'Sourdough'),
('BT004', 'Focaccia'),
('BT005', 'Ciabatta'),
('BT006', 'Rye Bread'),
('BT007', 'Multigrain'),
('BT008', 'Pita'),
('BT009', 'Whole-Grain'),
('BT010', 'Challah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mscustomer`
--

CREATE TABLE `mscustomer` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^CU[0-9]{3}$'),
  `CustomerName` varchar(50) NOT NULL,
  `CustomerGender` varchar(7) NOT NULL,
  `CustomerAddress` varchar(150) NOT NULL,
  `CustomerDOB` date NOT NULL,
  `CustomerPhone` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mscustomer`
--

INSERT INTO `mscustomer` (`CustomerID`, `CustomerName`, `CustomerGender`, `CustomerAddress`, `CustomerDOB`, `CustomerPhone`) VALUES
('CU001', 'Emily Ali', 'Male', '387 Pham Path Suite 890\nCannonmouth, WI 44399', '1971-03-18', ''),
('CU002', 'Peggy Tran', 'Male', '4966 Micheal Route Suite 942\nDawntown, NC 41036', '2017-12-12', ''),
('CU003', 'Bryan Pugh', 'Male', '36362 Alexa Manors Apt. 159\nLake Tinaberg, CO 40999', '2017-03-26', ''),
('CU004', 'Carolyn Anderson', 'Male', '656 Jefferson Islands\nSouth Mackenzieville, AK 01861', '2008-05-09', ''),
('CU005', 'Kristin Lee', 'Male', '32896 Lee Tunnel\nSpencerside, MN 29913', '2021-08-27', ''),
('CU006', 'Joshua Martinez', 'Female', '5887 Gilbert Isle\nEast Daniel, OR 54855', '2007-06-10', ''),
('CU007', 'James Phillips', 'Female', '6819 Stewart Expressway\nMelindaburgh, NM 22648', '2012-01-09', ''),
('CU008', 'Frank Martinez', 'Female', '9808 Edwards Pass Suite 292\nSouth Kenneth, RI 20521', '1979-06-09', ''),
('CU009', 'Maria Nichols', 'Male', '525 Figueroa Dam Apt. 323\nSydneymouth, HI 34628', '1980-11-25', ''),
('CU010', 'Natalie Lawrence', 'Female', '88399 Alison Flat\nJosephside, MO 01918', '1998-09-18', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `msstaff`
--

CREATE TABLE `msstaff` (
  `StaffID` char(5) NOT NULL CHECK (`StaffID` regexp '^ST[0-9]{3}$'),
  `StaffName` varchar(50) NOT NULL,
  `StaffGender` varchar(7) NOT NULL,
  `StaffSalary` int(10) NOT NULL,
  `StaffDOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msstaff`
--

INSERT INTO `msstaff` (`StaffID`, `StaffName`, `StaffGender`, `StaffSalary`, `StaffDOB`) VALUES
('ST001', 'David Oliver', 'Male', 65683760, '1993-02-25'),
('ST002', 'Jamie Hess', 'Female', 74834201, '2015-05-27'),
('ST003', 'David Smith', 'Female', 93108063, '1980-09-30'),
('ST004', 'Jennifer Kelley', 'Male', 42149576, '2000-04-06'),
('ST005', 'Garrett Kelly', 'Female', 90970128, '1983-01-16'),
('ST006', 'Adrian Cruz', 'Male', 70922768, '1990-07-11'),
('ST007', 'James Reed', 'Male', 81292282, '2000-02-17'),
('ST008', 'Lindsey Browning', 'Male', 60332967, '1996-09-14'),
('ST009', 'Timothy Gilbert', 'Female', 89480096, '2018-12-13'),
('ST010', 'Kayla Huerta', 'Male', 43585012, '1985-06-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `salesdetail`
--

CREATE TABLE `salesdetail` (
  `SalesID` char(5) NOT NULL,
  `BreadID` char(5) NOT NULL,
  `Quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `salesdetail`
--

INSERT INTO `salesdetail` (`SalesID`, `BreadID`, `Quantity`) VALUES
('SA001', 'BR003', 3),
('SA001', 'BR005', 7),
('SA002', 'BR009', 19),
('SA003', 'BR004', 1),
('SA003', 'BR005', 23),
('SA004', 'BR003', 4),
('SA004', 'BR006', 23),
('SA004', 'BR007', 12),
('SA005', 'BR007', 20),
('SA006', 'BR005', 23),
('SA006', 'BR007', 25),
('SA007', 'BR004', 18),
('SA008', 'BR001', 5),
('SA008', 'BR004', 1),
('SA008', 'BR007', 13),
('SA009', 'BR003', 5),
('SA009', 'BR009', 15),
('SA009', 'BR010', 21),
('SA010', 'BR005', 1),
('SA011', 'BR004', 19),
('SA012', 'BR003', 24),
('SA013', 'BR004', 12),
('SA013', 'BR007', 3),
('SA014', 'BR008', 8),
('SA015', 'BR003', 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `salesheader`
--

CREATE TABLE `salesheader` (
  `SalesID` char(5) NOT NULL CHECK (`SalesID` regexp '^SA[0-9]{3}$'),
  `CustomerID` char(5) NOT NULL,
  `StaffID` char(5) NOT NULL,
  `SalesDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `salesheader`
--

INSERT INTO `salesheader` (`SalesID`, `CustomerID`, `StaffID`, `SalesDate`) VALUES
('SA001', 'CU002', 'ST003', '2020-03-20'),
('SA002', 'CU003', 'ST005', '2021-03-20'),
('SA003', 'CU001', 'ST008', '2021-07-15'),
('SA004', 'CU006', 'ST010', '2018-09-01'),
('SA005', 'CU009', 'ST007', '2021-01-02'),
('SA006', 'CU010', 'ST004', '2019-04-12'),
('SA007', 'CU005', 'ST004', '2021-05-10'),
('SA008', 'CU008', 'ST006', '2017-05-05'),
('SA009', 'CU007', 'ST001', '2022-02-17'),
('SA010', 'CU004', 'ST005', '2019-04-12'),
('SA011', 'CU010', 'ST001', '2016-07-13'),
('SA012', 'CU004', 'ST002', '2018-04-04'),
('SA013', 'CU007', 'ST008', '2022-07-07'),
('SA014', 'CU006', 'ST005', '2020-09-30'),
('SA015', 'CU003', 'ST006', '2021-12-09');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `viewstaffat2020`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `viewstaffat2020` (
`StaffID` char(5)
,`StaffName` varchar(58)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `breadsalesmarch`
--
DROP TABLE IF EXISTS `breadsalesmarch`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `breadsalesmarch`  AS SELECT `mb`.`BreadID` AS `BreadID`, `mb`.`BreadName` AS `BreadName`, `mb`.`BreadPrice` AS `BreadPrice`, concat(`mbt`.`BreadTypeName`,'Type') AS `BreadType` FROM (((`salesheader` `sh` join `salesdetail` `sd` on(`sh`.`SalesID` = `sd`.`SalesID`)) join `msbread` `mb` on(`sd`.`BreadID` = `mb`.`BreadID`)) join `msbreadtype` `mbt` on(`mb`.`BreadTypeID` = `mbt`.`BreadTypeID`)) WHERE month(`sh`.`SalesDate`) = 3 AND `mb`.`BreadPrice` between 20000 and 50000 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `viewstaffat2020`
--
DROP TABLE IF EXISTS `viewstaffat2020`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewstaffat2020`  AS SELECT `ms`.`StaffID` AS `StaffID`, concat('Mr./Mrs.',`ms`.`StaffName`) AS `StaffName` FROM (`salesheader` `sh` join `msstaff` `ms` on(`sh`.`StaffID` = `ms`.`StaffID`)) WHERE year(`sh`.`SalesDate`) = 2020 ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `msbread`
--
ALTER TABLE `msbread`
  ADD PRIMARY KEY (`BreadID`),
  ADD KEY `BreadTypeID` (`BreadTypeID`);

--
-- Indeks untuk tabel `msbreadtype`
--
ALTER TABLE `msbreadtype`
  ADD PRIMARY KEY (`BreadTypeID`);

--
-- Indeks untuk tabel `mscustomer`
--
ALTER TABLE `mscustomer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `msstaff`
--
ALTER TABLE `msstaff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indeks untuk tabel `salesdetail`
--
ALTER TABLE `salesdetail`
  ADD PRIMARY KEY (`SalesID`,`BreadID`),
  ADD KEY `BreadID` (`BreadID`);

--
-- Indeks untuk tabel `salesheader`
--
ALTER TABLE `salesheader`
  ADD PRIMARY KEY (`SalesID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `msbread`
--
ALTER TABLE `msbread`
  ADD CONSTRAINT `msbread_ibfk_1` FOREIGN KEY (`BreadTypeID`) REFERENCES `msbreadtype` (`BreadTypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `salesdetail`
--
ALTER TABLE `salesdetail`
  ADD CONSTRAINT `salesdetail_ibfk_1` FOREIGN KEY (`SalesID`) REFERENCES `salesheader` (`SalesID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salesdetail_ibfk_2` FOREIGN KEY (`BreadID`) REFERENCES `msbread` (`BreadID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `salesheader`
--
ALTER TABLE `salesheader`
  ADD CONSTRAINT `salesheader_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `mscustomer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salesheader_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `msstaff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
