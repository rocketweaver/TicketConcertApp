-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2023 at 03:43 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket_concert`
--

-- --------------------------------------------------------

--
-- Table structure for table `topup_history`
--

CREATE TABLE `topup_history` (
  `id_topup` int(10) NOT NULL,
  `numbers_phone` varchar(255) NOT NULL,
  `balance` int(10) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` int(10) NOT NULL,
  `numbers_phone` varchar(255) NOT NULL,
  `class` varchar(8) NOT NULL,
  `passcode` varchar(8) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `stat` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `phone_numbers` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `fullname`, `nickname`, `phone_numbers`, `password`) VALUES
(10, 'Admin', 'Admin', '081573135056', 'admin666'),
(13, 'Ikram', 'Ikram', '081234567891', 'ikram');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id_wallet` int(10) NOT NULL,
  `numbers_phone` varchar(255) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id_wallet`, `numbers_phone`, `balance`) VALUES
(8, '081234567891', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `topup_history`
--
ALTER TABLE `topup_history`
  ADD PRIMARY KEY (`id_topup`),
  ADD KEY `numbers_topup` (`numbers_phone`) USING BTREE;

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD UNIQUE KEY `passcode` (`passcode`),
  ADD KEY `numbers_transaction` (`numbers_phone`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`phone_numbers`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id_wallet`),
  ADD KEY `numbers_wallet` (`numbers_phone`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `topup_history`
--
ALTER TABLE `topup_history`
  MODIFY `id_topup` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id_transaction` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id_wallet` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `topup_history`
--
ALTER TABLE `topup_history`
  ADD CONSTRAINT `topup_history_ibfk_1` FOREIGN KEY (`numbers_phone`) REFERENCES `users` (`phone_numbers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`numbers_phone`) REFERENCES `users` (`phone_numbers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `pk_wallet_users` FOREIGN KEY (`numbers_phone`) REFERENCES `users` (`phone_numbers`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
