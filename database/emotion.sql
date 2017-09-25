-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 12, 2012 at 09:15 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emotionmap`
--

-- --------------------------------------------------------

--
-- Table structure for table `emotion`
--

CREATE TABLE IF NOT EXISTS `emotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `emotion`
--

INSERT INTO `emotion` (`id`, `name`, `value`, `description`) VALUES
(1, 'VeryHappy', '1', 'VeryHappyDescription'),
(2, 'ExcitingHappy', '2', 'ExcitingDescription'),
(3, 'NotSoBad', '3', 'NotSoBadDescription'),
(4, 'Frustrated', '4', 'FrustratedDescription'),
(5, 'Stressed', '5', 'StressedDescription'),
(6, 'Angry', '6', 'AngryDescription'),
(7, 'Shy', '7', 'ShyDescription'),
(8, 'Smile', '8', 'SmileDescription');
