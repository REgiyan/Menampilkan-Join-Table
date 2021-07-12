-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 08:49 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_BARANG` int(11) NOT NULL,
  `NAMA_BARANG` varchar(100) DEFAULT NULL,
  `HARGA_BARANG` int(11) DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_BARANG`, `NAMA_BARANG`, `HARGA_BARANG`, `QTY`) VALUES
(111, 'Detergent', 15000, 4),
(123, 'Shampo', 12000, 2),
(124, 'Pasta Gigi', 12000, 2),
(126, 'Minyak Goreng', 25000, 2),
(127, 'Sabun Mandi', 5000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID_CUSTOMER` int(11) NOT NULL,
  `NAMA_CUSTOMER` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID_CUSTOMER`, `NAMA_CUSTOMER`) VALUES
(1, 'Miya'),
(2, 'Hana'),
(3, 'Nick');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `ID_KASIR` int(11) NOT NULL,
  `NAMA_KASIR` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`ID_KASIR`, `NAMA_KASIR`) VALUES
(11, 'Lyn'),
(12, 'Dean');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_KASIR` int(11) DEFAULT NULL,
  `ID_CUSTOMER` int(11) DEFAULT NULL,
  `ID_BARANG` int(11) DEFAULT NULL,
  `TGL_TRANSAKSI` datetime DEFAULT NULL,
  `TOTAL_HARGA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_TRANSAKSI`, `ID_KASIR`, `ID_CUSTOMER`, `ID_BARANG`, `TGL_TRANSAKSI`, `TOTAL_HARGA`) VALUES
(1212, 11, 1, 111, '2021-07-06 00:00:00', 60000),
(1213, 11, 2, 126, '2021-07-07 00:00:00', 50000),
(1214, 12, 3, 124, '2021-07-11 00:00:00', 24000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_barang`
--

CREATE TABLE `transaksi_barang` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_BARANG`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_CUSTOMER`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`ID_KASIR`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `FK_CUSTOMER_TRANSAKSI` (`ID_CUSTOMER`),
  ADD KEY `FK_KASIR_TRANSAKSI` (`ID_KASIR`);

--
-- Indexes for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD PRIMARY KEY (`ID_TRANSAKSI`,`ID_BARANG`),
  ADD KEY `FK_TRANSAKSI_BARANG` (`ID_BARANG`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_CUSTOMER_TRANSAKSI` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`),
  ADD CONSTRAINT `FK_KASIR_TRANSAKSI` FOREIGN KEY (`ID_KASIR`) REFERENCES `kasir` (`ID_KASIR`);

--
-- Constraints for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD CONSTRAINT `FK_TRANSAKSI_BARANG` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`),
  ADD CONSTRAINT `transaksi_barang_ibfk_1` FOREIGN KEY (`ID_TRANSAKSI`) REFERENCES `transaksi` (`ID_TRANSAKSI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
