SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `digitech`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `employees`
--

CREATE DATABASE IF NOT EXISTS `digitech`;

USE `digitech`;

CREATE TABLE IF NOT EXISTS `employees` (
`id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `company_email` varchar(45) NOT NULL,
  `personal_email` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `recruit_date` date DEFAULT NULL,
  `monthly_wages` double(7,2) NOT NULL,
  `last_performance_interview` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Gegevens worden geëxporteerd voor tabel `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `company_email`, `personal_email`, `date_of_birth`, `recruit_date`, `monthly_wages`, `last_performance_interview`) VALUES
(1, 'Sarah', 'Peeters', 'sarah.peeters@digitech.com', 'sarah178@gmail.com', '1978-05-07', '2001-02-21', 2704.32, '2021-11-04 12:45:00'),
(2, 'Kato', 'Verbruggen', 'kato.verbruggen@digitech.com', 'kato-verbruggen@telenet.be', '1981-05-11', '2022-01-21', 1700.53, '2019-07-04 13:00:00'),
(3, 'Lisa', 'Looyen', 'lisa.looyen@digitech.com', 'lisalooy@hotmail.com', '1983-12-01', '2017-12-04', 2078.45, '2021-11-04 13:15:00'),
(4, 'Mark', 'Van Krieken', 'mark.van.krieken@digitech.com', 'kriekenmark@outlook.com', '1991-03-15', '2018-03-12', 4200.99, '2020-04-05 15:45:00'),
(5, 'Ilan', 'Boeykens', 'ilan.boeykens@digitech.com', 'boeykensilan@gmail.com', '1995-08-20', '2014-08-18', 2109.05, '2022-02-05 17:00:00'),
(6, 'Philip', 'Laetens', 'philip.laetens@digitech.com', 'philip1975@outlook.com', '1975-02-04', '2016-09-06', 2047.12, '2021-11-05 13:15:00'),
(7, 'Ali', 'Maniers', 'ali.maniers@digitech.com', 'ali.maniers@proximus.be', '1988-07-22', '2005-02-17', 2175.95, '2021-11-05 13:30:00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `employee_roles`
--

CREATE TABLE IF NOT EXISTS `employee_roles` (
  `employee_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `employee_roles`
--

INSERT INTO `employee_roles` (`employee_id`, `role_id`) VALUES
(2, 2),
(6, 2),
(4, 3),
(3, 4),
(5, 6),
(7, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Gegevens worden geëxporteerd voor tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Junior frontend developer', 'Frontend ontwikkelaar met minder dan 5 jaar e'),
(2, 'Senior frontend developer', 'Frontend ontwikkelaar met meer dan 5 jaar erv'),
(3, 'Junior backend developer', 'Backend ontwikkelaar met minder dan 5 jaar er'),
(4, 'Senior backend developer', 'Backend ontwikkelaar met meer dan 5 jaar erva'),
(5, 'Full Stack developer', 'Ontwikkelaar met meer dan 2 jaar ervaring.'),
(6, 'Creative director', 'Creatief directeur.'),
(7, 'Administrative assistant', 'Administratief medewerker.'),
(8, 'General director', 'Algemeen directeur');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `employees`
--
ALTER TABLE `employees`
 ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `employee_roles`
--
ALTER TABLE `employee_roles`
 ADD PRIMARY KEY (`employee_id`,`role_id`), ADD KEY `fk_employees_has_functions_functions1_idx` (`role_id`), ADD KEY `fk_employees_has_functions_employees_idx` (`employee_id`);

--
-- Indexen voor tabel `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `employees`
--
ALTER TABLE `employees`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT voor een tabel `roles`
--
ALTER TABLE `roles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `employee_roles`
--
ALTER TABLE `employee_roles`
ADD CONSTRAINT `fk_employees_has_functions_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_employees_has_functions_functions1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
