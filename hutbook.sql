-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2018 at 08:52 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hutbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `hut` int(11) NOT NULL,
  `on_date` date NOT NULL,
  `is_day` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `hut`, `on_date`, `is_day`) VALUES
(1, 1, '2018-03-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `huts`
--

CREATE TABLE `huts` (
  `id` int(11) NOT NULL,
  `pic` int(11) DEFAULT NULL,
  `is_hut` tinyint(1) NOT NULL,
  `city` int(11) NOT NULL,
  `area` varchar(200) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT '0',
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `huts`
--

INSERT INTO `huts` (`id`, `pic`, `is_hut`, `city`, `area`, `capacity`, `name`, `rating`, `description`) VALUES
(2, 3, 0, 0, NULL, 12, 'Hut1', 0, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis.'),
(3, 5, 1, 0, NULL, 21, 'Hut2', 0, 'Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.');

-- --------------------------------------------------------

--
-- Table structure for table `hut_media`
--

CREATE TABLE `hut_media` (
  `id` int(11) NOT NULL,
  `url` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hut_media`
--

INSERT INTO `hut_media` (`id`, `url`) VALUES
(5, 'http://www.abc.net.au/news/image/8458242-3x2-940x627.jpg'),
(1, 'https://i.redd.it/jsnlg9kwvtxx.jpg'),
(3, 'https://lintvwpri.files.wordpress.com/2017/04/pic-of-the-day-april-26-2017.jpg?w=650'),
(4, 'https://steemitimages.com/DQmc35LtUTgAyWXK3DGUZs64SaEN1h3ksSFmejPKDsVzBjW/14monsoonpics3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `hut` int(11) NOT NULL,
  `on_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `on_day` date NOT NULL,
  `is_day` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `hut`, `on_date`, `on_day`, `is_day`) VALUES
(1, 2, '2018-03-12 19:00:00', '2018-03-15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `huts`
--
ALTER TABLE `huts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_HM` (`pic`);

--
-- Indexes for table `hut_media`
--
ALTER TABLE `hut_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_HR` (`hut`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `huts`
--
ALTER TABLE `huts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hut_media`
--
ALTER TABLE `hut_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `huts`
--
ALTER TABLE `huts`
  ADD CONSTRAINT `FK_HM` FOREIGN KEY (`pic`) REFERENCES `hut_media` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_HR` FOREIGN KEY (`hut`) REFERENCES `huts` (`id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `del_resrv` ON SCHEDULE EVERY 1 DAY STARTS '2018-03-12 00:00:00' ON COMPLETION PRESERVE ENABLE DO DELETE FROM `reservation` WHERE `reservation`.on_date <= DATE_SUB(NOW(), INTERVAL 1 DAY)$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
