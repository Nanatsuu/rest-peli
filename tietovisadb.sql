-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 11:55 PM
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
-- Database: `tietovisadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `kysymykset`
--

CREATE TABLE `kysymykset` (
  `id` int(11) NOT NULL,
  `kysymys` varchar(255) NOT NULL,
  `vastaus` varchar(255) NOT NULL
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `kysymykset`
--

INSERT INTO `kysymykset` (`id`, `kysymys`, `vastaus`) VALUES
(1, 'Mikä on Suomen pääkaupunki?', 'Helsinki'),
(2, 'Mikä on maailman suurin valtio?', 'Venäjä'),
(3, 'Kuka kirjoitti \"Romeo ja Julia\"?', 'William Shakespeare');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kysymykset`
--
ALTER TABLE `kysymykset`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kysymykset`
--
ALTER TABLE `kysymykset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
