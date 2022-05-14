-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 12:35 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogrid`
--

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `ConCode` int(11) NOT NULL,
  `AccountNum` char(5) NOT NULL,
  `LineNum` char(5) NOT NULL,
  `ClientName` varchar(40) NOT NULL,
  `NIC` varchar(10) NOT NULL,
  `ConnecType` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `WiringType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`ConCode`, `AccountNum`, `LineNum`, `ClientName`, `NIC`, `ConnecType`, `Email`, `Address`, `WiringType`) VALUES
(6, 'AS094', 'LB983', 'Omala Vishmini', '900104322V', 'Building', 'omala@gmail.com', 'Jaffna 23/1', '1 pharse'),
(7, 'AD994', 'LL323', 'Sisini Ninawa', '943234122V', 'Residennce', 'sisini@gmail.com', 'Maharagama 23/1', '3 pharse'),
(8, 'M1214', 'LB983', 'Chamodi kaveendhya', '452010432V', 'Hotel', 'sanduni@gmail.com', 'Colombo 23/1', '3 pharse'),
(10, 'AK123', 'LL345', 'Nihara ekanayaka', '993623123V', 'residence', 'sugath@gmail.com', '34/2 Mathara', '2 pharse'),
(12, 'AM345', 'LL002', 'ekanayaka', '993623123V', 'residence', 'sugath@gmail.com', '34/2 Mathara', '2 pharse');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`ConCode`),
  ADD UNIQUE KEY `AccountNum` (`AccountNum`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `connections`
--
ALTER TABLE `connections`
  MODIFY `ConCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
