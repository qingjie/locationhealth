-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 01, 2013 at 04:00 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`id`, `userId`, `name`, `value`, `currentTime`, `description`) VALUES
(1, '1', 'Angry', '6', '2012-12-31 21:47:23', 'This is the description'),
(2, '2', 'Angry', '6', '2012-12-31 21:47:29', 'This is the description'),
(3, '2', 'Stressed', '5', '2012-12-31 21:47:53', 'This is the description'),
(4, '1', 'Angry', '6', '2012-12-31 21:47:35', 'This is the description'),
(5, '2', 'Angry', '6', '2012-12-31 21:47:39', 'This is the description'),
(6, '2', 'Stressed', '5', '2012-12-31 21:47:57', 'This is the description'),
(7, '1', 'Shy', '7', '2012-12-31 23:00:01', 'This is the description'),
(8, '1', 'Smile', '8', '2012-12-31 23:00:01', 'This is the description');

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

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `emotion_selected` varchar(45) DEFAULT NULL,
  `currentTime` timestamp NULL DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `latitude`, `longitude`, `emotion_selected`, `currentTime`, `description`) VALUES
(1, 'latitude1', 'longitude1', '6', '2012-12-21 22:19:15', 'description1'),
(2, 'latitude1', 'longitude1', '6', '2012-12-21 22:19:58', 'description1'),
(3, 'latitude1', 'longitude1', '5', '2012-12-21 23:05:37', 'description1'),
(4, '43.023255', '-76.135493', '7', '2012-12-31 08:55:01', NULL),
(5, '43.023255', '-76.135493', '8', '2012-12-31 08:55:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE IF NOT EXISTS `month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `currentTime` timestamp NULL DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `month`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `currentTime` timestamp NULL DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `gender`, `age`, `email`, `currentTime`, `description`) VALUES
(1, 'zhaoqingjie', '666666', 'male', '100', 'zhaoqingjie@gmail.com', '2012-12-21 19:27:04', 'descriptionTest'),
(2, 'zhaoqingjie1', '666666', 'male', '100', 'zhaoqingjie@gmail.com', '2012-12-21 21:03:50', 'descriptionTest'),
(3, 'huangyun', '666666', 'female', '100', 'zhaoqingjie@gmail.com', '2012-12-21 21:02:08', 'descriptionTest');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_location`
--

CREATE TABLE IF NOT EXISTS `user_has_location` (
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`location_id`),
  KEY `fk_user_has_location_location1` (`location_id`),
  KEY `fk_user_has_location_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_has_location`
--

INSERT INTO `user_has_location` (`user_id`, `location_id`) VALUES
(1, 1),
(2, 2),
(2, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `week`
--

CREATE TABLE IF NOT EXISTS `week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `currentTime` timestamp NULL DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `week`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_has_location`
--
ALTER TABLE `user_has_location`
  ADD CONSTRAINT `fk_user_has_location_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_location_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
