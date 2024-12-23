CREATE DATABASE  IF NOT EXISTS `rising_sun` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rising_sun`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rising_sun
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guests` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(65) NOT NULL,
  `mobile_phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'Peeters','Philip','philip.peeters@gmail.com','$2a$07$FpAAIUQUBJp9Fd8UHzou5eZURve7u9XnIvdwlPEo1CoCfL5GIWARm',NULL),(2,'Liefsoens','Ilse','ilse.liefsoens@skynet.be','$2a$07$gVVA3OnLCV54PHt5BI42ieJzLXNn/hWndgwVw7uHoCPDJhUSpDAj6','+32 4 45 31 95'),(3,'De Donker','Kyran','kyran.de.donker@telenet.be','$2a$07$d2EulhKRh4dt5nJUtljAYelCUy52uu8UA36YH1Br0QXd7ep..9kSC',NULL),(4,'Jacobs','Patricia','patricia.jacobs@telenet.be','$2a$07$EsyJcvhvcQZ0PoAG8sdTc.TPn3M0PApD93fae5eBYMXpB.0jGZO2S',NULL),(5,'Janssens','Sarah','sarah.janssens@outlook.com','$2a$07$VVmMmrlLZfvQ4cKbe1ta7.vBIbjnmm4GWAPCF1yjrKX2OC.vxbZbK','+32 4 22 73 68'),(6,'Hendriks','Tobi','tobi.hendriks@gmail.com','$2a$07$U0reMzMubBztQT3Z4x7Mpe87egAjB0YMenchyhXVc5lC8lMTT8.OC',NULL),(7,'Sanders','Patrick','patrick.sanders@proximus.be','$2a$07$mOiiAk7jcZYHppo75Az1kegKBD0Xe2PVOtVyFrbPmbIMjznU.4bH.',NULL),(8,'Vandeput','Anouk','anouk.vandeput@yahoo.com','$2a$07$sxH7OicSkjKcjIuxbt78Cu0ZFew8FULPDq9xQ3bkJgFiJnphVK.E6',NULL);
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Mastercard'),(2,'Visa card'),(3,'PayPal'),(4,'Bank transfer'),(5,'Cash on site');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guest` int(4) NOT NULL,
  `room` int(2) NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `adults` int(2) NOT NULL,
  `childs` int(2) DEFAULT NULL,
  `payment_method` int(2) NOT NULL,
  `reservation_date` datetime NOT NULL,
  `grand_total` double(6,2) NOT NULL,
  PRIMARY KEY (`id`,`guest`,`room`,`payment_method`),
  KEY `fk_reservations_users_idx` (`guest`),
  KEY `fk_reservations_payment_methods1_idx` (`payment_method`),
  KEY `fk_reservations_rooms1_idx` (`room`),
  CONSTRAINT `fk_reservations_payment_methods1` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservations_rooms1` FOREIGN KEY (`room`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservations_users` FOREIGN KEY (`guest`) REFERENCES `guests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,4,2,'2023-09-05','2023-09-07',2,0,1,'2023-01-21 14:02:14',340.00),(2,1,4,'2023-08-02','2023-08-10',2,1,2,'2023-02-10 17:45:23',1687.60),(3,2,4,'2023-10-05','2023-10-06',2,2,2,'2018-12-02 11:52:10',210.95),(4,3,3,'2023-12-28','2023-12-29',2,0,4,'2018-03-24 08:32:47',149.99),(5,6,1,'2023-10-01','2023-10-03',2,1,1,'2023-02-19 16:34:02',411.98),(6,3,2,'2020-04-02','2020-04-06',1,0,2,'2018-06-05 22:09:45',680.00),(7,5,4,'2023-08-16','2023-08-17',2,1,5,'2017-12-29 13:18:25',210.95),(8,8,3,'2023-09-22','2023-09-26',1,0,1,'2023-02-07 12:04:36',599.96),(9,7,2,'2023-11-11','2023-11-13',2,0,5,'2018-12-15 15:00:04',340.00),(10,2,2,'2020-02-27','2020-02-28',1,0,1,'2023-03-25 10:43:08',170.00);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `double_beds` int(1) NOT NULL,
  `single_beds` int(1) NOT NULL,
  `price` double(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Da vinci Suite',1,2,205.99),(2,'Picasso Suite',1,0,170.00),(3,'Michelangelo Room',1,0,149.99),(4,'Dali Suite',1,2,210.95),(5,'Monet Room',1,0,179.95);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
