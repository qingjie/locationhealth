-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2012 at 06:00 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emotionmap`
--

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE IF NOT EXISTS `day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `currentTime` timestamp NULL DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`id`, `userId`, `name`, `value`, `currentTime`, `description`) VALUES
(1, '1', '6', '6', '2012-12-26 04:00:00', 'This is the description'),
(2, '2', '6', '6', '2012-12-26 04:00:00', 'This is the description'),
(3, '2', '5', '5', '2012-12-26 04:00:00', 'This is the description'),
(4, '1', '6', '6', '2012-12-28 04:00:00', 'This is the description'),
(5, '2', '6', '6', '2012-12-28 04:00:00', 'This is the description'),
(6, '2', '5', '5', '2012-12-28 04:00:00', 'This is the description');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
