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
-- Database: `ladrive`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `extra_driver_promo_view`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `extra_driver_promo_view` (
`transaction_id` char(5)
,`rented` varchar(112)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `extra_payment_for_weekend_view`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `extra_payment_for_weekend_view` (
`staff_id` char(5)
,`extra_payment` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_car`
--

CREATE TABLE `ms_car` (
  `car_id` char(5) NOT NULL,
  `car_name` varchar(100) NOT NULL,
  `car_brand` varchar(100) NOT NULL,
  `car_rent_price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ms_car`
--

INSERT INTO `ms_car` (`car_id`, `car_name`, `car_brand`, `car_rent_price`) VALUES
('CA001', 'Calya G 1.2 2020', 'Toyota', 500000),
('CA002', 'Yaris S 1.5 2020', 'Toyota', 800000),
('CA003', 'Raize GR Sport TSS 1.0 2021', 'Toyota', 1375000),
('CA004', 'Avanza Veloz 1.3 2021', 'Toyota', 500000),
('CA005', 'City RS Hatchback 1.5', 'Honda', 965000),
('CA006', 'Brio Satya E 1.2 2021', 'Honda', 410000),
('CA007', 'Brio RS 1.2 2019', 'Honda', 400000),
('CA008', 'HR-V E Prestige 1.8 2017', 'Honda', 975000),
('CA009', 'HR-V E Prestige 1.8 2020', 'Honda', 1030000),
('CA010', 'XPander Sport 1.5 2018', 'Mitsubishi', 1350000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_customer`
--

CREATE TABLE `ms_customer` (
  `customer_id` char(5) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_dob` date NOT NULL,
  `customer_gender` varchar(10) NOT NULL,
  `customer_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ms_customer`
--

INSERT INTO `ms_customer` (`customer_id`, `customer_name`, `customer_phone`, `customer_dob`, `customer_gender`, `customer_address`) VALUES
('CU001', 'Jessica Aurella', '08222143325', '2000-02-19', 'Female', '68307 Manufacturers Way'),
('CU002', 'Kelsie Roth', '08277765435', '1980-12-07', 'Female', '0 Brickson Park Place'),
('CU003', 'Harper Mcclure', '08988752456', '2001-02-27', 'Male', '040 4th Court'),
('CU004', 'Ethen Poole', '0844375643534', '1999-09-07', 'Male', '26973 Duke Park'),
('CU005', 'Stephanie Sheppard', '089543525839', '2000-03-16', 'Female', '1 Eliot Crossing'),
('CU006', 'Jewel Riggs', '086422355311', '2000-06-25', 'Male', '8429 Jackson Hill'),
('CU007', 'Virginia Oneill', '0812336435', '1995-02-27', 'Female', '41045 Hollow Ridge Road'),
('CU008', 'Trevor Hart', '081123452634', '1994-04-14', 'Male', '4 Elmside Parkway'),
('CU009', 'Dwayne Conrad', '08145377509', '1992-02-20', 'Male', '561 Golf View Way'),
('CU010', 'Alannah Ramos', '08200694325', '1998-08-20', 'Female', '3314 Graceland Lane');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ms_staff`
--

INSERT INTO `ms_staff` (`staff_id`, `staff_name`, `staff_phone`, `staff_dob`, `staff_gender`, `staff_address`) VALUES
('ST001', 'Michella Johanna', '087676432009', '2000-09-04', 'Female', '017 Debra Park'),
('ST002', 'Dominique Dennis', '08950121345', '1996-06-18', 'Female', '16 Victoria Lane'),
('ST003', 'Adolfo Nash', '08298455312', '2000-06-11', 'Male', '33 Ridge Oak Junction'),
('ST004', 'Cullen Huff', '080898644506', '2000-02-10', 'Male', '07865 Everett Center'),
('ST005', 'Natasha Alerra', '082090654325', '1998-04-24', 'Female', '38 1st Alley'),
('ST006', 'Elle Ibarra', '08987453025', '1994-12-29', 'Female', '07416 Scofield Terrace'),
('ST007', 'Brice Williams', '08098061205', '2000-07-29', 'Male', '90 Manitowish Way'),
('ST008', 'Celia Huynh', '0822876234566', '1996-04-13', 'Female', '54199 Lakeland Pass'),
('ST009', 'Alaina Nicholson', '082775677349', '2000-03-22', 'Female', '8 Union Center'),
('ST010', 'Mercedes Manning', '0829812453097', '2002-04-10', 'Male', '79 Westend Drive');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `transaction_id` char(5) NOT NULL,
  `car_id` char(5) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction_detail`
--

INSERT INTO `transaction_detail` (`transaction_id`, `car_id`, `duration`) VALUES
('TR001', 'CA002', 3),
('TR001', 'CA007', 2),
('TR002', 'CA003', 1),
('TR002', 'CA010', 1),
('TR003', 'CA005', 3),
('TR004', 'CA007', 2),
('TR005', 'CA009', 1),
('TR006', 'CA001', 4),
('TR006', 'CA004', 3),
('TR006', 'CA010', 3),
('TR007', 'CA004', 3),
('TR008', 'CA010', 6),
('TR009', 'CA003', 3),
('TR009', 'CA004', 3),
('TR009', 'CA005', 3),
('TR010', 'CA002', 5),
('TR010', 'CA007', 5),
('TR011', 'CA002', 1),
('TR012', 'CA007', 2),
('TR013', 'CA010', 4),
('TR014', 'CA001', 2),
('TR014', 'CA005', 2),
('TR014', 'CA007', 2),
('TR015', 'CA002', 1),
('TR015', 'CA007', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_header`
--

CREATE TABLE `transaction_header` (
  `transaction_id` char(5) NOT NULL,
  `transaction_date` date NOT NULL,
  `staff_id` char(5) NOT NULL,
  `customer_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction_header`
--

INSERT INTO `transaction_header` (`transaction_id`, `transaction_date`, `staff_id`, `customer_id`) VALUES
('TR001', '2022-01-30', 'ST006', 'CU001'),
('TR002', '2022-01-30', 'ST001', 'CU010'),
('TR003', '2022-01-31', 'ST002', 'CU002'),
('TR004', '2022-01-31', 'ST005', 'CU003'),
('TR005', '2022-02-02', 'ST009', 'CU001'),
('TR006', '2022-02-03', 'ST010', 'CU004'),
('TR007', '2022-02-03', 'ST010', 'CU010'),
('TR008', '2022-02-04', 'ST006', 'CU005'),
('TR009', '2022-08-12', 'ST001', 'CU007'),
('TR010', '2022-09-13', 'ST005', 'CU009'),
('TR011', '2022-09-14', 'ST002', 'CU010'),
('TR012', '2022-09-14', 'ST010', 'CU003'),
('TR013', '2022-09-16', 'ST005', 'CU007'),
('TR014', '2022-09-16', 'ST009', 'CU001'),
('TR015', '2022-09-17', 'ST006', 'CU010');

-- --------------------------------------------------------

--
-- Struktur untuk view `extra_driver_promo_view`
--
DROP TABLE IF EXISTS `extra_driver_promo_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `extra_driver_promo_view`  AS SELECT `th`.`transaction_id` AS `transaction_id`, concat(`mc`.`car_name`,'extra driver') AS `rented` FROM ((`transaction_header` `th` join `transaction_detail` `td` on(`th`.`transaction_id` = `td`.`transaction_id`)) join `ms_car` `mc` on(`td`.`car_id` = `mc`.`car_id`)) WHERE `td`.`duration` * `mc`.`car_rent_price` > 2000000 AND monthname(`th`.`transaction_date`) = 'September' AND year(`th`.`transaction_date`) = 2022 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `extra_payment_for_weekend_view`
--
DROP TABLE IF EXISTS `extra_payment_for_weekend_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `extra_payment_for_weekend_view`  AS SELECT `ms`.`staff_id` AS `staff_id`, concat('Rp.',`td`.`duration` + 10000) AS `extra_payment` FROM ((`transaction_header` `th` join `ms_staff` `ms` on(`th`.`staff_id` = `ms`.`staff_id`)) join `transaction_detail` `td` on(`th`.`transaction_id` = `td`.`transaction_id`)) WHERE dayname(`th`.`transaction_date`) = 'Sunday' ;

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
  ADD KEY `transaction_id` (`transaction_id`),
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
  ADD CONSTRAINT `transaction_detail_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_header` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_detail_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `ms_car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaction_header`
--
ALTER TABLE `transaction_header`
  ADD CONSTRAINT `transaction_header_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `ms_staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_header_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ms_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
