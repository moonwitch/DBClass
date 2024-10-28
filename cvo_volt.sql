-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Serverversie: 10.4.11-MariaDB
-- PHP-versie: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cvo_volt`
--
CREATE DATABASE IF NOT EXISTS `cvo_volt`;
USE `cvo_volt`;
-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_students` int(2) DEFAULT 20
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `description`, `max_students`) VALUES
(1, 'databasebeheer', 'Maak kennis met de wereld van MySQL.', 20),
(2, 'websiteproductie 1', 'Maak kennis met HTML en CSS.', 10),
(3, 'clientside-scripting', 'Maak kennis met Javascript.', 15),
(4, 'serverside-scripting 1', 'Maak kennis met PHP.', 20),
(5, 'webanimatie 1', 'Maak kennis met animate CC.', 20),
(6, '3D-tekenen 1', 'Maak kennis met Cinema 4D ', 8);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `enrollments`
--

CREATE TABLE `enrollments` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `passed` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `registered_since` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `email`, `birth_date`, `registered_since`) VALUES
(1, 'Peter', 'De Vriendt', 'peter.de.vriendt@telenet.be', '1987-02-24', '2018-09-01 09:02:05'),
(2, 'Margot', 'Liefsoens', 'maggy@gmail.com', '2001-08-04', '2018-09-01 12:40:09'),
(3, 'Ann', 'van der Linden', 'anni64@hotmail.com', '1964-11-19', '2018-09-01 07:12:04'),
(4, 'Marcel', 'De Donker', 'marcel.de.donker@skynet.be', '1979-10-03', '2019-09-01 16:02:31'),
(5, 'Mohamed', 'Bormha', 'moh97@outlook.com', '1997-05-27', '2019-09-01 15:34:12'),
(6, 'Phedra', 'Lambrechts', 'toshi@gmail.com', '2003-12-07', '2020-09-01 11:21:35'),
(7, 'Jeroen', 'Van Groenenberg', 'van.groenenberg.jeroen@gmail.com', '2000-03-21', '2020-09-01 10:59:36'),
(8, 'Sofie', 'Van Den Heuvel', 'sof-van-den-heuvel@telenet.be', '1998-07-30', '2020-09-01 08:46:31'),
(9, 'Levi', 'Vanderpoel', 'lev.vdp@gmail.com', '2002-09-09', '2021-02-01 09:08:09');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexen voor tabel `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`student_id`,`course_id`),
  ADD KEY `fk_student_has_course_course1_idx` (`course_id`),
  ADD KEY `fk_student_has_course_student_idx` (`student_id`);

--
-- Indexen voor tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `fk_student_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_course_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
