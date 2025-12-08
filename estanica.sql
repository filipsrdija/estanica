-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2025 at 03:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estanica`
--

-- --------------------------------------------------------

--
-- Table structure for table `autobusi`
--

CREATE TABLE `autobusi` (
  `id` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `broj_sjedista` int(11) DEFAULT NULL,
  `vozac_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karte`
--

CREATE TABLE `karte` (
  `id` int(11) NOT NULL,
  `korisnik_id` int(11) DEFAULT NULL,
  `linija_id` int(11) DEFAULT NULL,
  `tip_karte` enum('jednosmjerna','povratna','mjesecna') DEFAULT NULL,
  `datum_kupovine` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) DEFAULT NULL,
  `prezime` varchar(50) DEFAULT NULL,
  `korisnicko_ime` varchar(50) DEFAULT NULL,
  `lozinka` varchar(255) DEFAULT NULL,
  `tip` enum('putnik','admin','prevoznik') DEFAULT 'putnik'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `linije`
--

CREATE TABLE `linije` (
  `id` int(11) NOT NULL,
  `polaziste` varchar(100) DEFAULT NULL,
  `odrediste` varchar(100) DEFAULT NULL,
  `vrijeme_polaska` time DEFAULT NULL,
  `cijena` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stajalista`
--

CREATE TABLE `stajalista` (
  `id` int(11) NOT NULL,
  `linija_id` int(11) DEFAULT NULL,
  `naziv_stajalista` varchar(100) DEFAULT NULL,
  `redoslijed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vozaci`
--

CREATE TABLE `vozaci` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) DEFAULT NULL,
  `prezime` varchar(50) DEFAULT NULL,
  `broj_dozvole` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autobusi`
--
ALTER TABLE `autobusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vozac_id` (`vozac_id`);

--
-- Indexes for table `karte`
--
ALTER TABLE `karte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `korisnik_id` (`korisnik_id`),
  ADD KEY `linija_id` (`linija_id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `linije`
--
ALTER TABLE `linije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stajalista`
--
ALTER TABLE `stajalista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linija_id` (`linija_id`);

--
-- Indexes for table `vozaci`
--
ALTER TABLE `vozaci`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autobusi`
--
ALTER TABLE `autobusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karte`
--
ALTER TABLE `karte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linije`
--
ALTER TABLE `linije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stajalista`
--
ALTER TABLE `stajalista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vozaci`
--
ALTER TABLE `vozaci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `autobusi`
--
ALTER TABLE `autobusi`
  ADD CONSTRAINT `autobusi_ibfk_1` FOREIGN KEY (`vozac_id`) REFERENCES `vozaci` (`id`);

--
-- Constraints for table `karte`
--
ALTER TABLE `karte`
  ADD CONSTRAINT `karte_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`id`),
  ADD CONSTRAINT `karte_ibfk_2` FOREIGN KEY (`linija_id`) REFERENCES `linije` (`id`);

--
-- Constraints for table `stajalista`
--
ALTER TABLE `stajalista`
  ADD CONSTRAINT `stajalista_ibfk_1` FOREIGN KEY (`linija_id`) REFERENCES `linije` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
