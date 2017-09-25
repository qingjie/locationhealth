-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2013 at 02:13 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`id`, `userId`, `name`, `value`, `currentTime`, `description`) VALUES
(1, '1', 'Angry', '6', '2013-01-01 02:47:23', 'This is the description'),
(2, '2', 'Angry', '6', '2013-01-01 02:47:29', 'This is the description'),
(3, '2', 'Stressed', '5', '2013-01-01 02:47:53', 'This is the description'),
(4, '1', 'Angry', '6', '2013-01-01 02:47:35', 'This is the description'),
(5, '2', 'Angry', '6', '2013-01-01 02:47:39', 'This is the description'),
(6, '2', 'Stressed', '5', '2013-01-01 02:47:57', 'This is the description'),
(7, '1', 'Shy', '7', '2013-01-01 04:00:01', 'This is the description'),
(8, '1', 'Smile', '8', '2013-01-01 04:00:01', 'This is the description'),
(9, '1', 'Angry', '6', '2013-01-05 04:00:00', 'This is the description'),
(10, '1', 'Angry', '6', '2013-01-22 04:15:59', 'This is the description'),
(11, '2', 'Angry', '6', '2013-01-22 04:15:59', 'This is the description'),
(12, '2', 'Stressed', '5', '2013-01-22 04:15:59', 'This is the description'),
(13, '1', 'Angry', '6', '2013-02-05 04:15:59', 'This is the description'),
(14, '1', 'ExcitingHappy', '2', '2013-02-05 04:15:59', 'This is the description'),
(15, '1', 'Angry', '6', '2013-02-22 04:15:59', 'This is the description'),
(16, '2', 'Angry', '6', '2013-02-22 04:15:59', 'This is the description'),
(17, '2', 'Stressed', '5', '2013-02-22 04:15:59', 'This is the description'),
(18, '1', 'Angry', '6', '2013-02-22 04:15:59', 'This is the description'),
(19, '1', 'Angry', '6', '2013-02-24 04:15:59', 'This is the description'),
(20, '1', 'Shy', '7', '2013-02-24 04:15:59', 'This is the description'),
(21, '1', 'Angry', '6', '2013-02-24 04:15:59', 'This is the description'),
(22, '1', 'Shy', '7', '2013-02-24 04:15:59', 'This is the description'),
(23, '1', 'Angry', '6', '2013-02-24 04:15:59', 'This is the description'),
(24, '1', 'Shy', '7', '2013-02-24 04:15:59', 'This is the description'),
(25, '1', 'ExcitingHappy', '2', '2013-04-04 03:15:59', 'This is the description'),
(26, '1', 'Angry', '6', '2013-04-05 03:15:59', 'This is the description'),
(27, '1', 'ExcitingHappy', '2', '2013-04-05 03:15:59', 'This is the description'),
(28, '1', 'Angry', '6', '2013-04-10 03:15:59', 'This is the description'),
(29, '1', 'VeryHappy', '1', '2013-04-15 03:15:59', 'This is the description'),
(30, '1', 'ExcitingHappy', '2', '2013-04-15 03:15:59', 'This is the description'),
(31, '1', 'Angry', '6', '2013-04-22 03:15:59', 'This is the description'),
(32, '2', 'Angry', '6', '2013-04-22 03:15:59', 'This is the description'),
(33, '2', 'Stressed', '5', '2013-04-22 03:15:59', 'This is the description'),
(34, '1', 'Angry', '6', '2013-04-22 03:15:59', 'This is the description'),
(35, '1', 'Angry', '6', '2013-04-24 03:15:59', 'This is the description'),
(36, '1', 'Shy', '7', '2013-04-24 03:15:59', 'This is the description'),
(37, '1', 'Angry', '6', '2013-04-24 03:15:59', 'This is the description'),
(38, '1', 'Shy', '7', '2013-04-24 03:15:59', 'This is the description'),
(39, '1', 'Angry', '6', '2013-04-24 03:15:59', 'This is the description'),
(40, '1', 'Shy', '7', '2013-04-24 03:15:59', 'This is the description'),
(41, '1', 'ExcitingHappy', '2', '2013-05-04 03:15:59', 'This is the description');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `latitude`, `longitude`, `emotion_selected`, `currentTime`, `description`) VALUES
(1, '43.023255', '-76.135493', '6', '2012-12-22 03:19:15', 'description12'),
(2, '43.038293', '-76.133217', '6', '2012-12-22 03:19:58', 'description1'),
(3, '37.785834', '-122.406417', '5', '2012-12-22 04:05:37', 'description1'),
(4, '43.023255', '-76.135493', '7', '2012-12-31 13:55:01', 'description1'),
(5, '43.023255', '-76.135493', '8', '2012-12-31 13:55:03', 'description1'),
(6, '43.038293', '-76.133217', '6', '2013-01-04 16:44:58', 'description1'),
(7, '37.785834', '-122.406417', '6', '2013-01-23 15:14:07', 'description1'),
(8, '37.785834', '-122.406417', '7', '2013-01-23 15:14:07', 'description1'),
(9, '37.785834', '-122.406417', '6', '2013-01-23 18:16:27', 'description1'),
(10, '37.785834', '-122.406417', '7', '2013-01-23 18:16:27', 'description1'),
(11, '37.785834', '-122.406417', '6', '2013-01-23 18:37:15', 'description1'),
(12, '37.785834', '-122.406417', '7', '2013-01-23 18:37:15', 'description1'),
(13, '43.038182', '-76.132390', '2', '2013-02-04 18:05:22', 'description1'),
(14, '37.785834', '-122.406417', '1', '2013-02-14 18:12:58', 'description1'),
(15, '37.785834', '-122.406417', '2', '2013-02-14 18:12:58', 'description1'),
(16, '37.785834', '-122.406417', '6', '2013-02-21 20:16:42', 'description1'),
(17, '40.607903', '-74.001891', '2', '2013-04-03 20:10:00', 'description1'),
(18, '40.754040', '-73.990351', '6', '2013-04-09 20:54:49', 'description1'),
(19, '(null)', '(null)', '7', '2013-05-09 03:21:07', NULL);

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
(1, 'zhaoqingjie', '666666', 'male', '50', 'qzhao02@syr.edu', '2012-12-22 00:27:04', 'descriptionTest'),
(2, 'zhaoqingjie1', '666666', 'male', '100', 'zhaoqingjie@gmail.com', '2012-12-22 02:03:50', 'descriptionTest'),
(3, 'huangyun', '666666', 'female', '100', 'yhuang@syr.edu', '2012-12-22 02:02:08', 'descriptionTest');

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
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19);

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
-- Constraints for dumped tables
--

--
-- Constraints for table `user_has_location`
--
ALTER TABLE `user_has_location`
  ADD CONSTRAINT `fk_user_has_location_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_location_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
