-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zoo`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `animals`
--
CREATE DATABASE IF NOT EXISTS `zoo`;
USE `zoo`;
CREATE TABLE `animals` (
  `id` int(4) NOT NULL,
  `name` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(1) NOT NULL,
  `weight` double(5,2) NOT NULL,
  `species_id` int(11) NOT NULL,
  `parkzone_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `animals`
--

INSERT INTO `animals` (`id`, `name`, `date_of_birth`, `gender`, `weight`, `species_id`, `parkzone_id`) VALUES
(1, 'Casper', '2017-02-05', 'm', 180.52, 2, 3),
(2, 'Paplou', '2013-05-12', 'v', 51.95, 9, 3),
(3, 'Tara', '2016-07-14', 'v', 5.91, 10, 6),
(4, 'Ili', '2015-04-09', 'v', 475.96, 6, 2),
(5, 'Pasta', '2012-01-23', 'v', 60.85, 3, 1),
(6, 'Kipa', '2011-08-06', 'v', 32.45, 14, 4),
(7, 'Roko', '2018-03-30', 'm', 842.75, 8, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `parkzones`
--

CREATE TABLE `parkzones` (
  `id` int(2) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `parkzones`
--

INSERT INTO `parkzones` (`id`, `name`) VALUES
(1, 'Amfibie centrum'),
(2, 'Aqua place'),
(3, 'Afrika'),
(4, 'Azië'),
(5, 'Amerika'),
(6, 'Europa');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `species`
--

CREATE TABLE `species` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `species`
--

INSERT INTO `species` (`id`, `name`) VALUES
(1, 'Aap'),
(2, 'Leeuw'),
(3, 'Kikker'),
(4, 'Slang'),
(5, 'Tijger'),
(6, 'nijlpaard'),
(7, 'Zebra'),
(8, 'Giraf'),
(9, 'Olifant'),
(10, 'Buizerd'),
(11, 'Schildpad'),
(12, 'Flamingo'),
(13, 'Luipaard'),
(14, 'Koala'),
(15, 'Ijsbeer');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`,`species_id`,`parkzone_id`);

--
-- Indexen voor tabel `parkzones`
--
ALTER TABLE `parkzones`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `parkzones`
--
ALTER TABLE `parkzones`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `species`
--
ALTER TABLE `species`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
