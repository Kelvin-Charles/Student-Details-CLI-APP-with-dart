-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 21, 2024 at 08:11 AM
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
-- Database: `jaribu`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `f_name` varchar(20) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('mkuu','kawaida','registrar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`f_name`, `l_name`, `gender`, `username`, `password`, `role`) VALUES
('Anna', 'Kurambe', 'FEMALE', 'ameku', '78781508', 'kawaida'),
('kaka', 'yangu', 'MALE', 'bro', '547548988', 'registrar'),
('hunter', 'japhari', 'MALE', 'cityhunter', '12345', 'kawaida'),
('israel', 'alex', 'MALE', 'israelalex', '170066622', 'kawaida'),
('Kylian', 'Mbappe', 'MALE', 'jini', '691359889', 'mkuu'),
('joshua', 'kadoshi', 'MALE', 'kadoshijoshua', '156570499', 'kawaida'),
('kensia', 'john', 'FEMALE', 'kensiajohn', '699981744', 'registrar'),
('Laurine', 'Charles', 'FEMALE', 'laura', '691554663', 'registrar'),
('petro', 'lukuba', 'MALE', 'lukubamasanja', '227238406', 'mkuu'),
('Mwampoko', 'Mwenda', 'MALE', 'mimi', '11281726353', 'mkuu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
