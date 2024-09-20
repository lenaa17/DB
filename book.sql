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
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `author`
--

CREATE TABLE `author` (
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `ISBN` varchar(255) NOT NULL,
  `PublisherName` varchar(255) NOT NULL,
  `AuthorName` varchar(255) NOT NULL,
  `AuthorAddress` varchar(255) NOT NULL,
  `Year` int(11) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Price` decimal(19,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `Email` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publisher`
--

CREATE TABLE `publisher` (
  `NAME` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `URL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shoppingbasket`
--

CREATE TABLE `shoppingbasket` (
  `ID` int(11) NOT NULL,
  `CustomerEmail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shoppingbasket_book`
--

CREATE TABLE `shoppingbasket_book` (
  `ShoppingBasketID` int(11) NOT NULL,
  `BookISBN` varchar(255) NOT NULL,
  `Count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse`
--

CREATE TABLE `warehouse` (
  `kode` int(11) NOT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse_book`
--

CREATE TABLE `warehouse_book` (
  `WarehouseCode` int(11) NOT NULL,
  `BookISBN` varchar(255) NOT NULL,
  `Count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`Name`,`Address`);

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `PublisherName` (`PublisherName`),
  ADD KEY `AuthorName` (`AuthorName`,`AuthorAddress`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Email`);

--
-- Indeks untuk tabel `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`NAME`);

--
-- Indeks untuk tabel `shoppingbasket`
--
ALTER TABLE `shoppingbasket`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CustomerEmail` (`CustomerEmail`);

--
-- Indeks untuk tabel `shoppingbasket_book`
--
ALTER TABLE `shoppingbasket_book`
  ADD KEY `ShoppingBasketID` (`ShoppingBasketID`),
  ADD KEY `BookISBN` (`BookISBN`);

--
-- Indeks untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `warehouse_book`
--
ALTER TABLE `warehouse_book`
  ADD KEY `WarehouseCode` (`WarehouseCode`),
  ADD KEY `BookISBN` (`BookISBN`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`PublisherName`) REFERENCES `publisher` (`NAME`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`AuthorName`,`AuthorAddress`) REFERENCES `author` (`Name`, `Address`);

--
-- Ketidakleluasaan untuk tabel `shoppingbasket`
--
ALTER TABLE `shoppingbasket`
  ADD CONSTRAINT `shoppingbasket_ibfk_1` FOREIGN KEY (`CustomerEmail`) REFERENCES `customer` (`Email`);

--
-- Ketidakleluasaan untuk tabel `shoppingbasket_book`
--
ALTER TABLE `shoppingbasket_book`
  ADD CONSTRAINT `shoppingbasket_book_ibfk_1` FOREIGN KEY (`ShoppingBasketID`) REFERENCES `shoppingbasket` (`ID`),
  ADD CONSTRAINT `shoppingbasket_book_ibfk_2` FOREIGN KEY (`BookISBN`) REFERENCES `books` (`ISBN`);

--
-- Ketidakleluasaan untuk tabel `warehouse_book`
--
ALTER TABLE `warehouse_book`
  ADD CONSTRAINT `warehouse_book_ibfk_1` FOREIGN KEY (`WarehouseCode`) REFERENCES `warehouse` (`kode`),
  ADD CONSTRAINT `warehouse_book_ibfk_2` FOREIGN KEY (`BookISBN`) REFERENCES `books` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
