-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 11:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(50) DEFAULT NULL,
  `harga` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_brg`, `nama_brg`, `harga`) VALUES
('b001', 'lemari', 13000000),
('b002', 'kulkas', 23000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`) VALUES
('c001', 'Ryan'),
('c002', 'Mozez');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_brg`
--

CREATE TABLE `detail_penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `qty_penjualan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan_brg`
--

INSERT INTO `detail_penjualan_brg` (`no_jual`, `kode_brg`, `qty_penjualan`) VALUES
('j001', 'b001', 1),
('j001', 'b002', 2),
('j002', 'b001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` date DEFAULT NULL,
  `id_customer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan_brg`
--

INSERT INTO `penjualan_brg` (`no_jual`, `tgl_jual`, `id_customer`) VALUES
('j001', '2020-02-03', 'c001'),
('j002', '2020-02-13', 'c002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD PRIMARY KEY (`no_jual`,`kode_brg`),
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `no_jual` (`no_jual`);

--
-- Indexes for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD PRIMARY KEY (`no_jual`),
  ADD UNIQUE KEY `no_jual_2` (`no_jual`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `no_jual` (`no_jual`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD CONSTRAINT `detail_penjualan_brg_ibfk_1` FOREIGN KEY (`no_jual`) REFERENCES `penjualan_brg` (`no_jual`),
  ADD CONSTRAINT `detail_penjualan_brg_ibfk_2` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`);

--
-- Constraints for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
