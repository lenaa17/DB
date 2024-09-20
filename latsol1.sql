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
-- Database: `latsol1`
--

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

--
-- Dumping data untuk tabel `mscustomer`
--

INSERT INTO `mscustomer` (`CustomerID`, `CustomerName`, `CustomerGender`, `CustomerAddress`, `CustomerEmail`, `CustomerDOB`) VALUES
('CU001', 'Dirk Titterell', 'Male', '74 Melvin Point', 'dtitterell0@yellowpages.com', '2020-10-29'),
('CU002', 'Dukey Diano', 'Male', '92 Sugar Alley', 'ddiano1@state.com', '2020-09-27'),
('CU003', 'Alex Meekins', 'Male', '577 Dovetail Park', 'ameekins2@blogs.com', '2020-11-06'),
('CU004', 'Cherice Jermey', 'Female', '811 Debs Street', 'cjermey3@guardian.com', '2021-05-18'),
('CU005', 'Ingamar Carlin', 'Male', '389 Surrey Pass', 'icarlin4@shareasale.com', '2020-08-08'),
('CU006', 'Pooh McCutcheon', 'Male', '7 Melby Trail', 'pmccutcheon5@salon.com', '2020-08-03'),
('CU007', 'Silvain Jozsa', 'Female', '19269 Maryland Hill', 'sjozsa6@omniture.com', '2020-12-30'),
('CU008', 'Javier Drewson', 'Female', '8 Moulton Point', 'jdrewson7@home.com', '2020-08-20'),
('CU009', 'Wilbur Francino', 'Female', '21840 Golden Leaf Avenue', 'wfrancino8@wunderground.com', '2020-10-06'),
('CU010', 'Sadie Snow', 'Female', '70 Eagle Crest Hill', 'ssnow9@github.com', '2021-04-25'),
('CU011', 'Sofie Carmen', 'Female', '20196 Springview Plaza', 'scarmena@gov.com', '2020-11-20'),
('CU012', 'Amy Grenkov', 'Male', '2263 Weeping Birch Center', 'agrenkovb@aol.com', '2020-06-06'),
('CU013', 'Gabriela Scarf', 'Female', '920 Bobwhite Trail', 'gscarfc@skype.com', '2021-03-12'),
('CU014', 'Westley Boram', 'Female', '47 Darwin Terrace', 'wboramd@sun.com', '2020-09-03'),
('CU015', 'Hadleigh Playfoot', 'Female', '49 6th Junction', 'hplayfoote@msu.com', '2021-04-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `msfish`
--

CREATE TABLE `msfish` (
  `FishID` char(5) NOT NULL CHECK (`FishID` regexp '^FI[0-9]{3}$'),
  `FishTypeID` char(5) NOT NULL,
  `FishName` varchar(50) NOT NULL,
  `FishPrice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msfish`
--

INSERT INTO `msfish` (`FishID`, `FishTypeID`, `FishName`, `FishPrice`) VALUES
('FI001', 'FT005', 'Channel Catfish', 12.5),
('FI002', 'FT004', 'Blue Marlin', 20.3),
('FI003', 'FT003', 'Albacore', 10.3),
('FI004', 'FT004', 'Sailfish', 30.5),
('FI005', 'FT002', 'Red Grouper', 10.7),
('FI006', 'FT003', 'Atlantic Bonito', 20.3),
('FI007', 'FT004', 'Swordfish', 31.4),
('FI008', 'FT003', 'Bigeye Tuna', 10.2),
('FI009', 'FT004', 'White Marlin', 20.3),
('FI010', 'FT001', 'Spotted Bass', 35.3),
('FI011', 'FT003', 'Blackfin Tuna', 12.3),
('FI012', 'FT003', 'King Mackerel', 15.3),
('FI013', 'FT001', 'Striped Bass', 16.3),
('FI014', 'FT005', 'Flathead Catfish', 8.1),
('FI015', 'FT002', 'Gag Grouper', 39.4),
('FI016', 'FT005', 'Blue Catfish', 7.4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msfisherman`
--

CREATE TABLE `msfisherman` (
  `FishermanID` char(5) NOT NULL CHECK (`FishermanID` regexp '^FS[0-9]{3}$'),
  `FishermanName` varchar(50) NOT NULL,
  `FishermanGender` varchar(10) NOT NULL,
  `FishermanAddress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msfisherman`
--

INSERT INTO `msfisherman` (`FishermanID`, `FishermanName`, `FishermanGender`, `FishermanAddress`) VALUES
('FS001', 'Clem', 'Male', '0975 Forest Dale Trail'),
('FS002', 'Dene', 'Male', '2 Grayhawk Parkway'),
('FS003', 'Lethia', 'Female', '905 Goodland Lane'),
('FS004', 'Tyrone', 'Male', '51745 Bowman Hill'),
('FS005', 'Shanda', 'Male', '848 New Castle Center'),
('FS006', 'Nani', 'Male', '3455 Village Green Court'),
('FS007', 'Dorothea', 'Male', '772 Goodland Park'),
('FS008', 'Chet', 'Female', '1 Merchant Street'),
('FS009', 'Darsie', 'Female', '31718 Toban Point'),
('FS010', 'Don', 'Male', '936 Lyons Plaza'),
('FS011', 'Tabby', 'Male', '10787 School Drive'),
('FS012', 'Desmond', 'Male', '8 Lien Junction'),
('FS013', 'Robenia', 'Female', '4 Dapin Avenue'),
('FS014', 'Curr', 'Female', '2 Veith Terrace'),
('FS015', 'Rudd', 'Male', '2 Hermina Park');

-- --------------------------------------------------------

--
-- Struktur dari tabel `msfishtype`
--

CREATE TABLE `msfishtype` (
  `FishTypeID` char(5) NOT NULL CHECK (`FishTypeID` regexp '^FT[0-9]{3}$'),
  `FishTypeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `msfishtype`
--

INSERT INTO `msfishtype` (`FishTypeID`, `FishTypeName`) VALUES
('FT001', 'Bass'),
('FT002', 'Grouper'),
('FT003', 'Tuna'),
('FT004', 'Marlin'),
('FT005', 'Catfish');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactiondetail`
--

CREATE TABLE `transactiondetail` (
  `TransactionID` char(5) NOT NULL,
  `FishID` char(5) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactiondetail`
--

INSERT INTO `transactiondetail` (`TransactionID`, `FishID`, `Quantity`) VALUES
('TR001', 'FI011', 9),
('TR001', 'FI015', 2),
('TR002', 'FI006', 4),
('TR002', 'FI016', 23),
('TR003', 'FI007', 2),
('TR003', 'FI015', 27),
('TR004', 'FI001', 6),
('TR004', 'FI014', 27),
('TR005', 'FI003', 28),
('TR005', 'FI014', 21),
('TR006', 'FI002', 9),
('TR006', 'FI015', 4),
('TR007', 'FI004', 16),
('TR007', 'FI015', 26),
('TR008', 'FI005', 20),
('TR008', 'FI007', 17),
('TR009', 'FI002', 17),
('TR009', 'FI005', 20),
('TR010', 'FI004', 15),
('TR010', 'FI010', 9),
('TR011', 'FI012', 14),
('TR011', 'FI014', 8),
('TR012', 'FI009', 24),
('TR012', 'FI016', 5),
('TR013', 'FI004', 3),
('TR013', 'FI005', 26),
('TR014', 'FI010', 2),
('TR014', 'FI014', 27),
('TR015', 'FI002', 21),
('TR015', 'FI005', 26);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactionheader`
--

CREATE TABLE `transactionheader` (
  `TransactionID` char(5) NOT NULL CHECK (`TransactionID` regexp '^TR[0-9]{3}$'),
  `CustomerID` char(5) NOT NULL,
  `FishermanID` char(5) NOT NULL,
  `TransactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactionheader`
--

INSERT INTO `transactionheader` (`TransactionID`, `CustomerID`, `FishermanID`, `TransactionDate`) VALUES
('TR001', 'CU004', 'FS002', '2020-09-06'),
('TR002', 'CU015', 'FS013', '2020-06-05'),
('TR003', 'CU015', 'FS007', '2020-12-18'),
('TR004', 'CU015', 'FS011', '2020-12-15'),
('TR005', 'CU012', 'FS010', '2020-08-04'),
('TR006', 'CU005', 'FS005', '2021-02-19'),
('TR007', 'CU011', 'FS006', '2021-01-01'),
('TR008', 'CU013', 'FS009', '2021-04-28'),
('TR009', 'CU001', 'FS001', '2020-06-22'),
('TR010', 'CU009', 'FS012', '2020-06-13'),
('TR011', 'CU007', 'FS005', '2020-06-04'),
('TR012', 'CU001', 'FS003', '2020-07-28'),
('TR013', 'CU008', 'FS015', '2021-03-18'),
('TR014', 'CU001', 'FS006', '2020-08-22'),
('TR015', 'CU013', 'FS003', '2020-05-31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mscustomer`
--
ALTER TABLE `mscustomer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `msfish`
--
ALTER TABLE `msfish`
  ADD PRIMARY KEY (`FishID`),
  ADD KEY `FishTypeID` (`FishTypeID`);

--
-- Indeks untuk tabel `msfisherman`
--
ALTER TABLE `msfisherman`
  ADD PRIMARY KEY (`FishermanID`);

--
-- Indeks untuk tabel `msfishtype`
--
ALTER TABLE `msfishtype`
  ADD PRIMARY KEY (`FishTypeID`);

--
-- Indeks untuk tabel `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD PRIMARY KEY (`TransactionID`,`FishID`),
  ADD KEY `FishID` (`FishID`);

--
-- Indeks untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `FishermanID` (`FishermanID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `msfish`
--
ALTER TABLE `msfish`
  ADD CONSTRAINT `msfish_ibfk_1` FOREIGN KEY (`FishTypeID`) REFERENCES `msfishtype` (`FishTypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD CONSTRAINT `transactiondetail_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactionheader` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactiondetail_ibfk_2` FOREIGN KEY (`FishID`) REFERENCES `msfish` (`FishID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD CONSTRAINT `transactionheader_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `mscustomer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionheader_ibfk_2` FOREIGN KEY (`FishermanID`) REFERENCES `msfisherman` (`FishermanID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
