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
-- Database: `petko_userform`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `Menu_id` int(11) NOT NULL,
  `Menu_name` varchar(255) NOT NULL,
  `Menu_description` varchar(255) NOT NULL,
  `Menu_price` double NOT NULL,
  `Menu_category` varchar(255) NOT NULL,
  `Menu_dir` varchar(255) NOT NULL,
  `Menu_filename` varchar(255) NOT NULL,
  `expiration` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`Menu_id`, `Menu_name`, `Menu_description`, `Menu_price`, `Menu_category`, `Menu_dir`, `Menu_filename`, `expiration`) VALUES
(58, 'Tuna Flavor Cat Food', 'Cat Food', 455, ' Cat Food', '../asset/menu/tunacat.jpg', 'tunacat.jpg', '2022-11-01'),
(59, 'Dog Leash', 'For Dog', 89, ' Dog Product', '../asset/menu/dogleash.jpg', 'dogleash.jpg', '2023-01-12'),
(60, 'snack Dog', 'Snack dog ', 234, ' Dog Product', '../asset/menu/snackdog.jpg', 'snackdog.jpg', '2023-04-13'),
(61, 'FUR', 'SHAMPOO', 111, ' Dog Product', '../asset/menu/furmagic dog.jpg', 'furmagic dog.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `available_appointment`
--

CREATE TABLE `available_appointment` (
  `id` int(11) NOT NULL,
  `date_appointment` date DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `available_appointment`
--

INSERT INTO `available_appointment` (`id`, `date_appointment`, `service`, `time`) VALUES
(1, '2022-11-18', ' surgery', '08:00:00'),
(2, '2022-11-18', ' consultation', '11:00:00'),
(3, '2022-11-18', ' vaccination', '08:00:00'),
(4, '2022-11-19', ' deworming', '08:00:00'),
(5, '2022-11-23', ' grooming', '16:01:00'),
(6, '2022-11-30', ' vaccination', '14:48:00'),
(7, '2022-11-28', ' surgery', '08:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_id` int(255) NOT NULL,
  `Cart_user_id` int(100) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `Cart_name` varchar(255) NOT NULL,
  `Cart_price` varchar(255) NOT NULL,
  `Cart_image` varchar(255) NOT NULL,
  `Cart_quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Cart_id`, `Cart_user_id`, `product_id`, `Cart_name`, `Cart_price`, `Cart_image`, `Cart_quantity`) VALUES
(442, 90, '57', 'Chicken Turkey', '150', 'Chickenturkeycat.jpg', 4),
(466, 104, '59', 'Dog Leash', '89', 'dogleash.jpg', 3),
(470, 49, '59', 'Dog Leash', '89', 'dogleash.jpg', 8),
(472, 93, '59', 'Dog Leash', '89', 'dogleash.jpg', 1),
(473, 124, '59', 'Dog Leash', '89', 'dogleash.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `client_appointment`
--

CREATE TABLE `client_appointment` (
  `id` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `appoint_no` varchar(255) NOT NULL,
  `appoint_date` date NOT NULL,
  `appoint_time` time NOT NULL,
  `petname` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` enum('pending','approved','served','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_appointment`
--

INSERT INTO `client_appointment` (`id`, `service`, `appoint_no`, `appoint_date`, `appoint_time`, `petname`, `user_id`, `status`) VALUES
(19, ' surgery', 'PETCO-636ccad014bc3', '2022-11-23', '07:56:00', 'as ', '120', 'pending'),
(20, ' confinement', 'PETCO-636ccb4fea7d4', '2022-11-23', '08:58:00', 'as ', '120', 'pending'),
(21, ' surgery', 'PETCO-636ccb6f7e39f', '2022-11-16', '08:01:00', 'as ', '120', 'pending'),
(22, ' confinement', 'PETCO-636ccf5f0cf5e', '2022-11-14', '10:15:00', 'as ', '120', 'pending'),
(23, ' confinement', 'PETCO-636ccfd6dbf7d', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(24, ' confinement', 'PETCO-636cd159cfc8e', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(25, ' confinement', 'PETCO-636cd16ec5867', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(26, ' confinement', 'PETCO-636cd17940680', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(27, ' confinement', 'PETCO-636cd192e69ca', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(28, ' confinement', 'PETCO-636cd19f40e8b', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(29, ' confinement', 'PETCO-636cd1f7c7f59', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(30, ' confinement', 'PETCO-636cd220c97a7', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(31, ' confinement', 'PETCO-636cd27c44108', '2022-11-23', '10:17:00', 'as ', '120', 'pending'),
(32, ' deworming', 'PETCO-636cd2d437134', '2022-11-22', '04:30:00', 'as ', '120', 'pending'),
(33, ' deworming', 'PETCO-636cd2d996bc8', '2022-11-22', '04:30:00', 'as ', '120', 'pending'),
(34, ' laboratory', 'PETCO-636dbdc216a96', '1970-01-01', '01:14:00', 'as ', '120', 'pending'),
(35, ' treatment', 'PETCO-636dbde250c25', '2022-11-15', '02:13:00', 'as ', '120', 'pending'),
(36, ' confinement', 'PETCO-636dc036c455e', '1970-01-01', '01:23:00', 'as ', '93', 'served'),
(40, ' confinement', 'PETCO-636fa497a24df', '2022-11-17', '01:52:00', 'Molly ', '93', 'cancelled'),
(41, ' consultation', 'PETCO-6375bbfdad502', '2022-11-18', '11:00:00', 'molly ', '49', 'approved'),
(42, ' vaccination', 'PETCO-637607f1ce5c6', '2022-11-18', '08:00:00', 'molly ', '49', 'served'),
(43, ' deworming', 'PETCO-6376e851a7d46', '2022-11-19', '08:00:00', 'Molly ', '93', 'cancelled'),
(44, ' deworming', 'PETCO-63776788bf28b', '2022-11-19', '08:00:00', 'molly ', '49', 'approved'),
(45, ' deworming', 'PETCO-637769ac75bde', '2022-11-19', '08:00:00', 'molly ', '49', 'cancelled'),
(46, ' deworming', 'PETCO-63776a2d3edc0', '2022-11-19', '08:00:00', 'molly ', '49', 'cancelled'),
(47, ' deworming', 'PETCO-63776a4d1e41b', '2022-11-19', '08:00:00', 'molly ', '49', 'pending'),
(48, ' grooming', 'PETCO-637afb59442d3', '2022-11-23', '04:01:00', ' ', '124', 'served'),
(49, ' grooming', 'PETCO-637b02d1d2ec8', '2022-11-23', '04:01:00', '', '125', 'pending'),
(50, ' grooming', 'PETCO-637b031c1b1d3', '2022-11-23', '04:01:00', ' polka', '125', 'pending'),
(51, ' vaccination', 'PETCO-637b034c8415a', '2022-11-30', '02:48:00', ' chuchu', '125', 'approved'),
(52, ' surgery', 'PETCO-637b211668586', '2022-11-28', '08:48:00', ' Polka', '126', 'approved'),
(53, ' grooming', 'PETCO-637b7908bf659', '2022-11-23', '04:01:00', ' Molly', '126', 'cancelled'),
(54, ' surgery', 'PETCO-637b7974c9265', '2022-11-28', '08:48:00', ' Polka', '126', 'pending'),
(55, ' grooming', 'PETCO-637c3eded5c6f', '2022-11-23', '04:01:00', ' Molly', '126', 'cancelled');

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
(151, 126, 'HEllo Petko', 1, '2022-11-21 15:08:43', 'Charlize Marfil ', 'Administrator', '126', 'petko'),
(152, 126, 'Hello Charlize!', 1, '2022-11-21 15:10:03', 'Charlize Marfil ', 'Charlize Marfil ', 'petko', 'petko'),
(153, 101, 'hello Melody,  Welcome to Petco Animal Clinic ', 1, '2022-11-21 21:36:45', 'alexandra saba ', 'Administrator', '101', 'petko'),
(154, 101, 'UYY', 1, '2022-11-21 21:37:03', 'alexandra saba ', 'alexandra saba ', 'petko', 'petko'),
(155, 101, 'hello Melody,  Welcome to Petco Animal Clinic ', 1, '2022-11-21 21:37:12', 'alexandra saba ', 'Administrator', '101', 'petko'),
(156, 101, 'hello Melody,  Welcome to Petco Animal Clinic ', 1, '2022-11-21 21:37:18', 'alexandra saba ', 'Administrator', '101', 'petko'),
(157, 101, 'sasasa', 1, '2022-11-21 21:37:29', 'alexandra saba ', 'alexandra saba ', 'petko', 'petko'),
(158, 93, 'hello', 1, '2022-11-22 16:04:09', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(159, 93, 'Melody gumagana na ba?', 1, '2022-11-22 16:04:26', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(160, 93, 'hello', 1, '2022-11-22 16:04:37', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(161, 93, 'hello Melody,  Welcome to Petco Animal Clinic ', 1, '2022-11-22 16:04:48', 'Melody Santiago ', 'Melody Santiago ', 'petko', 'petko'),
(162, 93, 'kamusta po', 1, '2022-11-22 16:05:03', 'Melody Santiago ', 'Administrator', '93', 'petko'),
(163, 101, 'hala what happen ', 0, '2022-11-22 16:07:04', 'alexandra saba ', 'alexandra saba ', 'petko', 'petko'),
(164, 104, 'saasa', 1, '2022-11-22 16:10:16', 'Alexandra Bautista ', 'Administrator', '104', 'petko'),
(165, 104, 'hello alex', 1, '2022-11-22 16:10:33', 'Alexandra Bautista ', 'Alexandra Bautista ', 'petko', 'petko'),
(166, 93, 'hello', 1, '2022-11-22 16:19:46', 'Melody Santiago ', 'Administrator', '93', 'petko');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order_user_id`, `first_name`, `last_name`, `contact`, `email`, `address`, `payment_method`, `order_status`) VALUES
(322, 49, 'Melody', 'Santiago', '09358504939', 'melody@gmail.com', 'hagonoy', 'For pick up', 'confirmed'),
(323, 49, 'Melody', 'Santiago', '09358504939', 'melody@gmail.com', 'hagonoy', 'For pick up', 'confirmed'),
(324, 90, 'Melody', 'Santiago', '', 'melody13santiago@gmail.com', 'San Agustin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, ', 'For pick up', 'pickup'),
(325, 90, 'Melody', 'Santiago', '', 'melody13santiago@gmail.com', 'San Agustin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, Bulacanin Hagonoy, ', 'For pick up', 'confirmed'),
(326, 49, 'Melody', 'Santiago', '09358504939', 'melody@gmail.com', 'San Agustin Hagonoy, Bulacan', 'For pick up', 'pickup'),
(327, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For pick up', 'pickup'),
(328, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For pick up', 'pickup'),
(329, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For pick up', 'pickup'),
(330, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For pick up', 'pickup'),
(331, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For pick up', 'pickup'),
(332, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For pick up', 'pickup'),
(333, 120, 'Melody', 'Santiago', '09358504939', 'melody13santiago@gmail.com', 'san agustin', 'For Pick Up', 'pickedup'),
(334, 120, 'Melody', 'Santiago', '09358504939', 'melody13santiago@gmail.com', 'san agustin', 'For Pick Up', 'pickedup'),
(335, 120, 'Melody', 'Santiago', '09358504939', 'melody13santiago@gmail.com', 'san agustin', 'For Pick Up', 'pickup'),
(336, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For Pick Up', ''),
(337, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For Pick Up', ''),
(338, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For Pick Up', ''),
(339, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For Pick Up', ''),
(340, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For Pick Up', ''),
(341, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For Pick Up', ''),
(342, 49, 'Melody', 'marfil', '09358504939', 'melody@gmail.com', 'San Agustin HAgonoy, BulcanaSan Agustin HAgonoy, BulcanaSan Agustin HAgonoy, BulcanaSan Agustin HAgonoy, BulcanaSan Agustin HAgonoy, Bulcana', 'For Pick Up', ''),
(343, 49, 'Melody', 'marfil', '09358504939', 'melody@gmail.com', 'San Agustin HAgonoy, BulcanaSan Agustin HAgonoy, BulcanaSan Agustin HAgonoy, BulcanaSan Agustin HAgonoy, BulcanaSan Agustin HAgonoy, Bulcana', 'For Pick Up', 'pickedup'),
(344, 93, 'Melody', 'Santiago', '23333', 'santiago.melody.b.5355@gmail.com', 'cxcx', 'For Pick Up', 'confirmed'),
(345, 126, 'Charlize', 'Marfil', '', 'melody13santiago@gmail.com', 'Sta Maria', 'For Pick Up', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `product_price` int(30) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `qty`, `product_price`, `user_id`) VALUES
(302, 322, 57, 1, 150, ''),
(303, 322, 56, 1, 67, ''),
(304, 322, 58, 1, 455, ''),
(305, 323, 58, 1, 455, ''),
(306, 323, 56, 1, 67, ''),
(307, 323, 55, 1, 123, ''),
(308, 324, 57, 1, 150, ''),
(309, 324, 56, 1, 67, ''),
(310, 324, 58, 1, 455, ''),
(311, 325, 58, 1, 455, ''),
(312, 325, 57, 1, 150, ''),
(313, 326, 56, 1, 67, ''),
(314, 326, 57, 1, 150, ''),
(315, 326, 58, 1, 455, ''),
(316, 327, 57, 2, 0, ''),
(317, 327, 58, 1, 0, ''),
(318, 328, 57, 2, 0, ''),
(319, 329, 57, 2, 150, ''),
(320, 330, 58, 1, 455, ''),
(321, 331, 57, 1, 150, ''),
(322, 331, 58, 1, 455, ''),
(323, 331, 59, 1, 89, ''),
(324, 331, 56, 2, 67, ''),
(325, 332, 59, 3, 89, ''),
(326, 332, 58, 1, 455, ''),
(327, 333, 59, 1, 89, ''),
(328, 334, 59, 1, 89, ''),
(329, 335, 60, 1, 234, ''),
(330, 335, 59, 1, 89, ''),
(331, 336, 59, 1, 89, ''),
(332, 337, 59, 1, 89, '93'),
(333, 338, 58, 1, 455, '93'),
(334, 338, 59, 1, 89, '93'),
(335, 339, 58, 1, 455, ''),
(336, 339, 59, 1, 89, ''),
(337, 341, 59, 1, 89, '93'),
(338, 342, 57, 1, 0, '49'),
(339, 342, 60, 2, 234, '49'),
(340, 342, 59, 2, 89, '49'),
(341, 343, 59, 3, 89, '49'),
(342, 344, 59, 4, 89, '93'),
(343, 345, 59, 8, 89, '126');

-- --------------------------------------------------------

--
-- Table structure for table `pettable`
--

CREATE TABLE `pettable` (
  `pet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pettype` varchar(100) NOT NULL,
  `petbreed` varchar(100) NOT NULL,
  `petname` varchar(255) NOT NULL,
  `petsex` varchar(100) NOT NULL,
  `petbday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pettable`
--

INSERT INTO `pettable` (`pet_id`, `user_id`, `pettype`, `petbreed`, `petname`, `petsex`, `petbday`) VALUES
(1, 74, 'dog', 'frenchbulldog', 'Molly', '', '0000-00-00'),
(2, 75, 'dog', 'chowchow', 'Molly', '', '0000-00-00'),
(3, 83, 'dog', 'corgi', 'sasa', '', '0000-00-00'),
(4, 49, 'cat', 'siamese', 'molly', 'female', '2022-09-30'),
(5, 85, 'dog', 'siberianhusky', 'Max', 'male', '2014-05-21'),
(6, 86, '', '', 's', 'male', '1970-01-01'),
(7, 87, 'Dog', 'siberianhusky', 'Coco', 'male', '2022-02-17'),
(8, 88, 'Cat', 'siamese', 'Molly', 'female', '2022-10-12'),
(9, 89, 'Dog', 'shittzu', 'Molly', 'female', '2021-05-19'),
(10, 90, 'Dog', 'siberianhusky', 'Molly', 'female', '2022-10-02'),
(11, 92, 'Dog', 'corgi', 'wewe', 'female', '2022-10-13'),
(12, 93, 'Dog', 'corgi', 'Molly', 'female', '2022-11-18'),
(13, 94, 'Cat', 'siamese', 'sasa', 'male', '2022-11-17'),
(14, 95, 'Dog', 'chowchow', 'sasa', 'male', '2022-11-23'),
(15, 96, 'Dog', 'chowchow', 'coco', 'male', '2022-11-09'),
(16, 97, 'Cat', 'siamese', 'sas', 'male', '2022-11-10'),
(17, 98, 'Cat', 'siamese', 'sas', 'male', '2022-10-19'),
(18, 102, 'Dog', 'corgi', 'sasa', 'male', '2022-11-07'),
(19, 103, 'Dog', 'englishbulldog', 'Molly', 'female', '2022-11-07'),
(20, 105, 'Cat', 'siamese', 'melly', 'female', '2022-11-01'),
(21, 106, 'Cat', 'siamese', 'polka', 'female', '2022-11-09'),
(22, 107, 'Cat', 'siamese', 'moly', 'female', '2022-11-09'),
(23, 108, 'Cat', 'siamese', 'sasa', 'female', '2022-11-09'),
(24, 109, 'Cat', 'abyssinian', 'Moly', 'female', '2022-11-09'),
(25, 110, 'Dog', 'siberianhusky', 'kitchie', 'male', '2022-06-09'),
(26, 111, 'Cat', 'siamese', 'eewew', 'female', '2022-06-09'),
(27, 112, 'Cat', 'siamese', 'wqwq', 'female', '2022-11-22'),
(28, 113, 'Cat', 'siamese', 'wqwq', 'female', '2022-11-22'),
(29, 114, 'Dog', 'shittzu', 'sasa', 'female', '2022-11-23'),
(30, 115, 'Dog', 'siberianhusky', 'sasa', 'female', '2022-11-09'),
(31, 116, 'Dog', 'pug', 'sasa', 'female', '2022-11-08'),
(32, 117, 'Dog', 'siberianhusky', 'sasasa', 'female', '2022-11-07'),
(33, 118, 'Dog', 'chowchow', 'sasa', 'female', '2022-11-01'),
(34, 119, 'Dog', 'chowchow', 'sasa', 'female', '2022-11-09'),
(35, 120, 'Dog', 'poodle', 'as', 'female', '2022-11-10'),
(36, 121, 'Dog', 'Opera', 'molly', 'female', '2022-11-14'),
(37, 122, 'Dog', 'frenchbulldog', 'Polly', 'female', '0000-00-00'),
(38, 122, 'Dog', 'poodle', 'sasa', 'male', '0000-00-00'),
(39, 123, 'Dog', 'shittzu', 'Brownie', 'male', '0000-00-00'),
(40, 123, 'Cat', 'abyssinian', 'Catty', 'female', '0000-00-00'),
(41, 124, '', '', '', '', '1970-01-01'),
(42, 125, 'Cat', 'abyssinian', 'polka', 'female', '0000-00-00'),
(43, 125, 'Dog', 'american bully', 'chuchu', 'male', '0000-00-00'),
(44, 126, 'Dog', 'shittzu', 'Molly', 'female', '0000-00-00'),
(45, 126, 'Cat', 'siamese', 'Polka', 'female', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `quicktips`
--

CREATE TABLE `quicktips` (
  `id` int(11) UNSIGNED NOT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quicktips`
--

INSERT INTO `quicktips` (`id`, `link`) VALUES
(2, 'https://www.youtube.com/watch?v=iXlyfdCfyoU'),
(3, 'https://www.youtube.com/watch?v=XZxRGkxTf2Y'),
(4, 'https://www.youtube.com/watch?v=PI5W2Stv0Ik'),
(5, 'https://www.youtube.com/watch?v=YHzcAt5sulE');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `service_name`) VALUES
(1, 'vaccination'),
(2, 'confinement'),
(3, 'consultation'),
(4, 'surgery'),
(5, 'treatment'),
(6, 'deworming'),
(7, 'grooming'),
(8, 'laboratory');

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(10) NOT NULL,
  `position` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` mediumint(50) NOT NULL,
  `status` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `image_dir` varchar(255) NOT NULL,
  `image_filename` varchar(255) NOT NULL,
  `user_level` varchar(255) NOT NULL,
  `archive` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`id`, `first_name`, `middle_name`, `last_name`, `suffix`, `position`, `address`, `email`, `password`, `code`, `status`, `contact`, `image_dir`, `image_filename`, `user_level`, `archive`) VALUES
(93, 'Melody', 'Balaba', 'Santiago', '', '', 'cxcx', 'santiago.melody.b.5355@gmail.com', 'qwqw', 487449, 'verified', '23333', '../asset/profiles/cha.jpg', 'cha.jpg', 'client', ''),
(98, 'xzxzxz', 'xzxzxz', 'zxzz', '', '', 'xz', 'melody121s@gand.ca', 'qqq', 225701, 'verified', 'xzxz', '../asset/profiles/dectsuit.png', 'dectsuit.png', 'client', 'archive'),
(99, 'sasa', 'sa', 'sa', 'sa', 'veterinarian', 'assa', 'asa@mm.com', '111', 276514, 'verified', 'sa', '', '', 'employee', ''),
(100, 'Charlize', 'F', 'Marfil', '', 'receptionist', 'ssasassa', 'cha@gmail.com', '111', 383075, 'verified', '0903289832929', '', '', 'employee', ''),
(101, 'alexandra', 'F', 'saba', '', 'veterinarian', 'a', 'sasas@gmail.com', '1111', 471111, 'verified', '212121', '', '', 'employee', 'archive'),
(104, 'Alexandra', 'Figueras', 'Bautista', '', 'veterinarian', 'Sta Maria Bulacan', 'Alexandrabautista1000@gmail.com', 'qwerty', 777303, 'verified', '09155222500', '', '', 'employee', ''),
(126, 'Melody', 'De Guzman', 'Marfil', '', '', 'Sta Maria', 'melody13santiago@gmail.com', '111', 0, 'verified', '', '../asset/profiles/melody.png', 'melody.png', 'client', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`Menu_id`);

--
-- Indexes for table `available_appointment`
--
ALTER TABLE `available_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_id`);

--
-- Indexes for table `client_appointment`
--
ALTER TABLE `client_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pettable`
--
ALTER TABLE `pettable`
  ADD PRIMARY KEY (`pet_id`);

--
-- Indexes for table `quicktips`
--
ALTER TABLE `quicktips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `Menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `available_appointment`
--
ALTER TABLE `available_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=481;

--
-- AUTO_INCREMENT for table `client_appointment`
--
ALTER TABLE `client_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `pettable`
--
ALTER TABLE `pettable`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `quicktips`
--
ALTER TABLE `quicktips`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
