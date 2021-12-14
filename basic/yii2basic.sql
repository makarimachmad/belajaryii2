-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 10:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2basic`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `title`, `body`, `post_id`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'contoh', 'ini isi dari contoh', NULL, NULL, NULL, NULL),
(2, 'contoh', 'ini isi dari contoh', 2, NULL, NULL, NULL),
(3, 'contoh', 'ini isi dari contoh', 2, NULL, NULL, 1),
(4, 'contoh', 'ini isi dari contoh', 2, 1639457153, 1639457153, NULL),
(5, 'contoh', 'ini isi dari contoh', 2, 1639457246, 1639457246, 1),
(6, 'judul sedang dirubah', 'isi mengikuti judul', 7, 1639458071, 1639458130, 1),
(7, 'data analysts fundamental', 'basic knowledge about visualization', 4, 1639458086, 1639458086, 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`code`, `name`, `population`) VALUES
('AU', 'Australia', 24016400),
('BR', 'Brazil', 205722000),
('CA', 'Canada', 35985751),
('DE', 'Germany', 81459000),
('FR', 'France', 64513242),
('HK', 'Hongkong', 2000000),
('ID', 'Indonesia', 265000000),
('IN', 'India', 1285400000),
('JP', 'Japan', 456456),
('RU', 'Russia', 146519759),
('SG', 'singapore', 4000000),
('TL', 'Timor Leste', 400000),
('US', 'U.S.A', 322976000);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1639367984),
('m211213_025413_create_post_table', 1639367988),
('m211213_030615_create_comment_table', 1639367988);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `body`, `created_at`, `updated_at`, `created_by`) VALUES
(2, 'rubah isi data science fundamental', 'basic knowledge about statistic and programming for data science isi dirubah', 1639371501, 1639377247, 1),
(3, 'data science fundamental', 'basic knowledge about statistic and programming for data science', 1639371514, 1639371514, NULL),
(4, 'data science fundamental update', 'update basic knowledge about statistic and programming for data science', 1639371606, 1639377399, NULL),
(5, 'judul sedang dirubah', 'isi mengikuti judul', 1639371617, 1639455476, 1),
(7, 'data analysts fundamental', 'basic knowledge about visualization', 1639453731, 1639453731, NULL),
(8, 'data analysts fundamental', 'basic knowledge about visualization', 1639454745, 1639454745, NULL),
(9, 'data analysts fundamental', 'basic knowledge about visualization', 1639454775, 1639454775, NULL),
(10, 'data analysts fundamental', 'basic knowledge about visualization', 1639455361, 1639455361, NULL),
(11, 'data analysts fundamental', 'basic knowledge about visualization', 1639457298, 1639457298, 1),
(12, 'data analysts fundamental', 'basic knowledge about visualization', 1639457887, 1639457887, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `authkey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `authkey`) VALUES
(1, 'pagi', 'pagi', 'papagigi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comment_user_created_by` (`created_by`),
  ADD KEY `FK_comment_post_post_id` (`post_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_post_user_created_by` (`created_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_post_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_comment_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_post_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
