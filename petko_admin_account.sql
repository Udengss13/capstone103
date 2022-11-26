-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 09:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petko_admin_account`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_carousel_homepage`
--

CREATE TABLE `admin_carousel_homepage` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_carousel_homepage`
--

INSERT INTO `admin_carousel_homepage` (`id`, `image_path`) VALUES
(80, 'asset/sliderimage/cares.png');

-- --------------------------------------------------------

--
-- Table structure for table `admin_category`
--

CREATE TABLE `admin_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_category`
--

INSERT INTO `admin_category` (`category_id`, `category_name`, `category_details`) VALUES
(21, 'Dog Product', 'for dog'),
(35, 'Cat Food', 'for Cat');

-- --------------------------------------------------------

--
-- Table structure for table `admin_content_homepage`
--

CREATE TABLE `admin_content_homepage` (
  `Image_id` int(11) NOT NULL,
  `Image_title` varchar(255) NOT NULL,
  `Image_subtitle` varchar(255) NOT NULL,
  `Image_body` longtext NOT NULL,
  `Image_dir` varchar(1000) NOT NULL,
  `Image_filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_content_homepage`
--

INSERT INTO `admin_content_homepage` (`Image_id`, `Image_title`, `Image_subtitle`, `Image_body`, `Image_dir`, `Image_filename`) VALUES
(57, 'Free Anti Rabies', 'Hello Petco ', 'We are now here to announce that petco are now ', '../asset/homepage/freeantirabies.jpg', 'freeantirabies.jpg'),
(58, 'sasa', 'sas', 'sasa', '../asset/homepage/easter.jpg', 'easter.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`username`, `password`) VALUES
('petko', 'adminpassword');

-- --------------------------------------------------------

--
-- Table structure for table `admin_quicktips`
--

CREATE TABLE `admin_quicktips` (
  `id` int(11) NOT NULL,
  `info` longtext NOT NULL,
  `image_dir` varchar(100) NOT NULL,
  `image_filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `seen` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `admin` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `employee_id`, `message`, `seen`, `created_at`, `sender_name`, `receiver_name`, `sender_id`, `admin`) VALUES
(2, 49, 'Hello', 1, '2022-11-08 21:45:51', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(4, 49, 'Sample message!', 1, '2022-11-08 21:53:16', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(5, 49, 'heyy', 1, '2022-11-09 08:50:52', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(6, 49, 'are we good ? ', 1, '2022-11-09 08:51:20', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(8, 49, 'heyyy', 1, '2022-11-09 10:26:32', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(9, 49, 'good', 1, '2022-11-09 10:26:53', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(10, 49, 'heyyy', 1, '2022-11-09 10:26:59', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(11, 49, 'sample', 1, '2022-11-09 10:27:06', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(12, 49, 'good', 1, '2022-11-09 10:27:11', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(13, 49, 'sample', 1, '2022-11-09 10:27:35', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(14, 49, 'test', 1, '2022-11-09 10:28:01', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(15, 49, 'sample', 1, '2022-11-09 10:28:18', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(16, 93, 'saasa', 1, '2022-11-09 11:57:45', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(17, 93, 'xxzxz', 1, '2022-11-09 11:57:52', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(18, 93, 'heloo', 1, '2022-11-09 12:04:29', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(20, 93, 'dsds', 1, '2022-11-09 12:07:24', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(21, 93, 'Melody gumagana na ba?', 1, '2022-11-09 12:09:15', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(22, 93, 'alex ok na kaya?', 1, '2022-11-09 12:10:03', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(23, 93, 'Melody gumagana na ba?', 1, '2022-11-09 12:10:07', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(24, 93, 'alex ok na kaya?', 1, '2022-11-09 12:10:48', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(25, 93, 'baka', 1, '2022-11-09 12:11:01', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(26, 49, 'hello admin', 1, '2022-11-09 12:15:18', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(27, 49, 'Melody gumagana na ba?', 1, '2022-11-09 12:15:42', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(28, 49, 'hello admin', 1, '2022-11-09 12:15:46', 'Melody Santiago ', 'Administrator', '49', 'petko'),
(29, 49, 'hello', 1, '2022-11-09 12:19:39', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(30, 49, 'Melody gumagana na ba?', 1, '2022-11-09 12:19:44', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(31, 49, 'cahrlize', 1, '2022-11-09 12:20:41', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(32, 49, 'hello', 1, '2022-11-09 12:20:51', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(33, 49, 'Melody gumagana na ba?', 1, '2022-11-09 12:21:08', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(34, 49, 'cahrlize', 1, '2022-11-09 12:21:21', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(35, 49, 'oo', 1, '2022-11-09 12:22:59', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(36, 49, 'cahrlize', 1, '2022-11-09 12:23:07', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(37, 49, 'heloo', 1, '2022-11-09 12:24:37', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(38, 49, 'cahrlize', 1, '2022-11-09 12:24:49', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(39, 49, 'heloo', 1, '2022-11-09 12:26:17', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(41, 49, 'cahrlize', 1, '2022-11-09 12:28:02', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(42, 49, 'heloo', 1, '2022-11-09 12:29:08', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(43, 49, 'heloo', 1, '2022-11-09 12:30:16', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(44, 49, 'cahrlize', 1, '2022-11-09 12:30:21', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(45, 49, 'cahrlize', 1, '2022-11-09 12:31:24', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(46, 49, 'cahrlize', 1, '2022-11-09 12:32:10', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(47, 49, 'sasasa', 1, '2022-11-09 12:40:18', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(48, 49, 'adminn', 1, '2022-11-09 12:40:53', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(49, 49, 'sasasa', 1, '2022-11-09 12:41:00', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(50, 49, 'adminn', 1, '2022-11-09 12:42:06', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(51, 49, 'adminn', 1, '2022-11-09 12:43:15', 'Charlize marfil ', 'Administrator', '49', 'petko'),
(52, 49, 'sasasa', 1, '2022-11-09 12:43:41', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(53, 49, 'heloo charlize', 1, '2022-11-09 12:44:59', 'Charlize marfil ', 'Charlize marfil ', 'petko', 'petko'),
(54, 49, 'hello melody', 1, '2022-11-09 13:13:53', 'Melody marfil ', 'Melody marfil ', 'petko', 'petko'),
(55, 49, 'hello melody', 1, '2022-11-09 13:34:40', 'Melody marfil ', 'Melody marfil ', 'petko', 'petko'),
(56, 93, 'helllo Admin', 1, '2022-11-09 13:37:07', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(57, 93, 'dsdsds', 1, '2022-11-09 13:39:08', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(58, 93, 'hello melody Balaba Santiago', 1, '2022-11-09 13:54:32', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(59, 93, 'sasaa', 1, '2022-11-09 13:56:01', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(60, 93, 'huy', 1, '2022-11-09 14:00:30', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(65, 93, 'hello Melody,  Welcome to Petco Animal Clinic ', 1, '2022-11-09 16:21:44', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(66, 93, 'hello Melody,  Welcome to Petco Animal Clinic ', 1, '2022-11-09 16:21:54', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(67, 93, 'dsdsd', 1, '2022-11-09 16:22:20', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(68, 93, 'test', 1, '2022-11-09 16:23:31', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(69, 93, 'dsdsd', 1, '2022-11-09 16:23:35', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(70, 93, 'dsdsd', 1, '2022-11-09 16:23:48', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(71, 93, 'dsdsd', 1, '2022-11-09 16:24:58', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(72, 93, 'test', 1, '2022-11-09 16:26:46', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(73, 93, 'test', 1, '2022-11-09 16:27:02', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(74, 93, 'dsdsd', 1, '2022-11-09 16:28:46', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(75, 93, 'hello', 1, '2022-11-09 16:29:02', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(76, 93, 'test', 1, '2022-11-09 16:29:08', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(77, 93, 'test', 1, '2022-11-09 16:29:16', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(78, 93, 'hello', 1, '2022-11-09 16:31:03', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(79, 93, 'hello', 1, '2022-11-09 16:32:33', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(80, 93, 'hello', 1, '2022-11-09 16:33:49', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(81, 93, 'hello', 1, '2022-11-09 16:34:27', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(82, 93, 'hello', 1, '2022-11-09 16:35:10', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(83, 93, 'Hello, Petco Animal Clinic', 1, '2022-11-09 18:44:30', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(84, 119, 'sasasa', 1, '2022-11-09 22:00:19', 'adelaida Santiago ', 'Administrator', '119', 'petko'),
(85, 119, 'hello', 1, '2022-11-09 22:03:53', 'adelaida Santiago ', 'Administrator', '119', 'petko'),
(86, 119, 'wqwqwq', 1, '2022-11-09 22:04:23', 'adelaida Santiago ', 'adelaida Santiago ', '119', 'petko'),
(87, 119, 'aa', 1, '2022-11-09 22:05:41', 'adelaida Santiago ', 'adelaida Santiago ', '119', 'petko'),
(88, 119, 'wwqwq', 1, '2022-11-09 22:06:21', 'adelaida Santiago ', 'Administrator', '119', 'petko'),
(89, 119, 'ewewew', 1, '2022-11-09 22:06:28', 'adelaida Santiago ', 'Administrator', '119', 'petko'),
(90, 119, 'ewewew', 0, '2022-11-09 22:12:41', 'adelaida Santiago ', 'Administrator', '119', 'petko'),
(91, 119, 'sasasa', 0, '2022-11-09 22:24:40', 'adelaida Santiago ', 'Administrator', '119', 'petko'),
(92, 104, 'sasasa', 1, '2022-11-09 22:26:43', 'Alexandra Bautista ', 'Administrator', '104', 'petko'),
(93, 119, 'heloo', 0, '2022-11-09 22:33:40', 'adelaida Santiago ', 'Administrator', '119', 'petko'),
(94, 119, 'wqwq', 0, '2022-11-09 22:33:52', 'adelaida Santiago ', 'Administrator', '119', 'petko');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_carousel_homepage`
--
ALTER TABLE `admin_carousel_homepage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_category`
--
ALTER TABLE `admin_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `admin_content_homepage`
--
ALTER TABLE `admin_content_homepage`
  ADD PRIMARY KEY (`Image_id`);

--
-- Indexes for table `admin_quicktips`
--
ALTER TABLE `admin_quicktips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_carousel_homepage`
--
ALTER TABLE `admin_carousel_homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `admin_category`
--
ALTER TABLE `admin_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `admin_content_homepage`
--
ALTER TABLE `admin_content_homepage`
  MODIFY `Image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `admin_quicktips`
--
ALTER TABLE `admin_quicktips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
