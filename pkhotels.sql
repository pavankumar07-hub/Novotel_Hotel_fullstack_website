-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2025 at 11:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pkhotels`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_contact_details`
--

CREATE TABLE `admin_contact_details` (
  `sl_no` int(11) NOT NULL,
  `cd_address` varchar(50) NOT NULL,
  `cd_map` varchar(100) NOT NULL,
  `phone_no_1` bigint(20) NOT NULL,
  `phone_no_2` bigint(20) NOT NULL,
  `cd_email` varchar(100) NOT NULL,
  `cd_fb` varchar(100) NOT NULL,
  `cd_insta` varchar(100) NOT NULL,
  `cd_tw` varchar(100) NOT NULL,
  `cd_iframe` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_contact_details`
--

INSERT INTO `admin_contact_details` (`sl_no`, `cd_address`, `cd_map`, `phone_no_1`, `phone_no_2`, `cd_email`, `cd_fb`, `cd_insta`, `cd_tw`, `cd_iframe`) VALUES
(1, 'Eluru Road,VijayawadaAndhra pradesh', 'https://maps.app.goo.gl/uYXrkNpRQNPTVSUr5', 919391099709, 917989012428, 'bitra.bharat29@gmail.com', 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://x.com/', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d116465.04356981508!2d80.434519!3d16.323571!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a4a755cb1787785:0x9f7999dd90f1e694!2sGuntur, Andhra Pradesh!5e1!3m2!1sen!2sin!4v1749911428329!5m2!1sen!2sin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `sl_no` int(11) NOT NULL,
  `admin_username` varchar(150) NOT NULL,
  `admin_password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`sl_no`, `admin_username`, `admin_password`) VALUES
(1, 'bharat123', '2005'),
(2, 'nabeel', '2005');

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `sl_no` int(11) NOT NULL,
  `site_title` varchar(50) NOT NULL,
  `site_about` varchar(250) NOT NULL,
  `shutdown` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`sl_no`, `site_title`, `site_about`, `shutdown`) VALUES
(1, 'Novotel', 'This is the platform to easily check-into our hotel by booking it early', 0);

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `sl_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `room_no` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `phone_num` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`sl_no`, `booking_id`, `room_name`, `price`, `total_pay`, `room_no`, `user_name`, `phone_num`, `address`) VALUES
(18, 18, 'Non AC Room', 250, 500, 'b1', 'bharat', '7889874589', 'guntur'),
(19, 19, 'AC room', 500, 1500, '', 'bharat', '7889874589', 'guntur'),
(20, 20, 'Non AC Room', 250, 500, 'a8', 'bharat', '7889874589', 'guntur'),
(21, 21, 'Non AC Room', 250, 500, 'A1', 'Thug', '7989012428', 'fcfrdrtdttfrdesr'),
(22, 22, 'Deluxe', 1500, 1500, '', 'Thug', '7989012428', 'fcfrdrtdttfrdesr'),
(23, 23, 'Superior Room', 3999, 3999, 'A1', 'Thug', '7989012428', 'fcfrdrtdttfrdesr'),
(24, 24, 'Executive Suite', 4999, 9998, 'A2', 'Thug', '7989012428', 'Mangalgiri'),
(25, 25, 'Deluxe Room', 2250, 18000, 'A10', 'Thug', '7989012428', 'fcfrdrtdttfrdesr'),
(26, 26, 'Superior Room', 3999, 3999, '', 'Thug', '7989012428', 'vijayawada Ap');

-- --------------------------------------------------------

--
-- Table structure for table `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `arrival` int(11) NOT NULL DEFAULT 0,
  `booking_status` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `trans_status` varchar(100) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `refund` varchar(100) DEFAULT NULL,
  `rate_review` int(11) DEFAULT NULL,
  `total_pay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `arrival`, `booking_status`, `order_id`, `trans_status`, `order_date`, `refund`, `rate_review`, `total_pay`) VALUES
(18, 6, 5, '2025-07-07', '2025-07-09', 1, 'booked', 'BK_45219', 'success', '2025-07-06 09:34:52', NULL, 0, 500),
(19, 6, 6, '2025-07-08', '2025-07-11', 0, 'cancelled', 'BK_74025', 'success', '2025-07-06 09:35:08', '1', NULL, 1500),
(20, 6, 5, '2025-07-16', '2025-07-18', 1, 'booked', 'BK_49309', 'success', '2025-07-06 16:07:24', NULL, 0, 500),
(21, 9, 5, '2025-07-07', '2025-07-09', 1, 'booked', 'BK_52895', 'success', '2025-07-06 22:05:44', NULL, 0, 500),
(22, 9, 7, '2025-07-08', '2025-07-09', 0, 'cancelled', 'BK_13837', 'success', '2025-07-07 13:15:07', '1', NULL, 1500),
(23, 9, 11, '2025-07-08', '2025-07-09', 1, 'booked', 'BK_85866', 'success', '2025-07-08 10:03:13', NULL, 1, 3999),
(24, 9, 10, '2025-07-08', '2025-07-10', 1, 'booked', 'BK_28258', 'success', '2025-07-08 10:06:30', NULL, 1, 9998),
(25, 9, 9, '2025-07-08', '2025-07-16', 1, 'booked', 'BK_75167', 'success', '2025-07-08 10:09:18', NULL, 1, 18000),
(26, 9, 11, '2025-07-08', '2025-07-09', 0, 'booked', 'BK_16155', 'success', '2025-07-08 14:26:04', NULL, NULL, 3999);

-- --------------------------------------------------------

--
-- Table structure for table `carousel_images`
--

CREATE TABLE `carousel_images` (
  `sl_no` int(11) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel_images`
--

INSERT INTO `carousel_images` (`sl_no`, `img`) VALUES
(18, 'IMG_43346.png');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_facilities`
--

CREATE TABLE `hotel_facilities` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_facilities`
--

INSERT INTO `hotel_facilities` (`id`, `icon`, `name`, `description`) VALUES
(15, 'IMG_34478.svg', 'Television', 'Experience ultimate comfort and convenience with our in-room entertainment system.  Our TVs offer a premium viewing experience, with access to a variety of channels, streaming apps, and interactive features.'),
(16, 'IMG_17528.svg', 'Air conditioner', 'Indulge in a luxurious experience with our state-of-the-art air conditioning system, featuring individual temperature control and quiet operation, ensuring a peaceful and restful night&#039;s sleep'),
(17, 'IMG_97456.svg', 'Heater', '&quot;Enjoy instant and gentle warmth with our energy-efficient infrared panel heaters. These sleek, wall-mounted panels provide silent and evenly distributed heat, allowing you to customize the temperature in your room and enjoy a comfortable, energ'),
(18, 'IMG_20977.svg', 'Oven', 'Our hotel kitchen is equipped with a state-of-the-art convection oven, designed for optimal heat distribution and consistent baking. With advanced temperature controls and preset cooking programs'),
(19, 'IMG_12522.svg', 'WIFI', 'Enjoy complimentary high-speed WiFi throughout the hotel. Connect easily in your room, the lobby, or by the pool, and stay connected with loved ones or get work done');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_features`
--

CREATE TABLE `hotel_features` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_features`
--

INSERT INTO `hotel_features` (`id`, `name`) VALUES
(13, 'balcony'),
(14, 'Kitchen'),
(17, 'Living Area'),
(18, 'Meeting Hall');

-- --------------------------------------------------------

--
-- Table structure for table `management_team_details`
--

CREATE TABLE `management_team_details` (
  `sl_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `picture` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `management_team_details`
--

INSERT INTO `management_team_details` (`sl_no`, `name`, `picture`) VALUES
(6, 'Bharat', 'IMG_57661.jpg'),
(7, 'Nabeel', 'IMG_23580.jpg'),
(8, 'Pavan', 'IMG_66043.jpg'),
(9, 'Srinadh', 'IMG_55991.jpg'),
(10, 'Mahaboob', 'IMG_64965.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `sl_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(200) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `date_and_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`sl_no`, `booking_id`, `room_id`, `user_id`, `rating`, `review`, `seen`, `date_and_time`) VALUES
(3, 23, 11, 9, 5, 'The Vibe of the hotel was very positive  and i was provided with very good services', 0, '2025-07-08 10:05:08'),
(4, 24, 10, 9, 4, 'I recommend everyone prefer this hotel if you are coming to vijayawada this  was the best experience i had', 0, '2025-07-08 10:07:46'),
(5, 25, 9, 9, 5, 'Good', 0, '2025-07-08 10:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `area` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `description` varchar(350) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `removed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `price`, `quantity`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(1, 'fvjnvn', 123, 1233, 321, 23, 23, 'gfdgreg', 1, 1),
(2, 'dchb', 1, 12, 12, 32, 1, 'wbchbcw', 1, 1),
(3, 'tftyft', 1, 62, 1, 551, 1, 'ggygyg', 1, 1),
(4, 'cbecn', 1, 1, 1, 1, 2, 'wdjnjjnxjnn', 1, 1),
(5, 'Non AC Room', 159, 250, 5, 6, 5, 'tv and single bedroom', 1, 1),
(6, 'AC room', 250, 500, 4, 8, 4, 'ac , geyser and tv', 1, 1),
(7, 'Deluxe', 500, 1500, 2, 10, 6, 'ac tv geyser kitchen balcony', 1, 1),
(8, 'Standard Room', 120, 1250, 7, 2, 2, 'Lavish bathrooms with upscale features such as heated floors and soaking tubs. High-end, lush linens and towels. Deluxe pillows and mattresses so your sleeping hours are as blissful as your waking ones. Beautiful views in every direction – inside and out.', 1, 0),
(9, 'Deluxe Room', 150, 2250, 9, 4, 3, 'King Sized Bed Easily comfortable and a balcony with a Sea view ,High-end, lush linens and towels. Deluxe pillows and mattresses so your sleeping hours are as blissful as your waking ones. Beautiful views in every direction – inside and out.', 1, 0),
(10, 'Executive Suite', 210, 4999, 7, 8, 10, 'Exclusively for Business Personalities and it is also equipped with work area and a meeting Hall', 1, 0),
(11, 'Superior Room', 180, 3999, 7, 7, 9, 'To give the Customers a Memorable experience with  a superior view of the neighbouring Places', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_facilities`
--

CREATE TABLE `room_facilities` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_facilities`
--

INSERT INTO `room_facilities` (`sr_no`, `room_id`, `facilities_id`) VALUES
(56, 8, 15),
(57, 8, 17),
(58, 8, 19),
(59, 9, 15),
(60, 9, 16),
(61, 9, 17),
(62, 9, 18),
(63, 9, 19),
(64, 10, 15),
(65, 10, 16),
(66, 10, 17),
(67, 10, 18),
(68, 10, 19),
(69, 11, 15),
(70, 11, 16),
(71, 11, 17),
(72, 11, 18),
(73, 11, 19);

-- --------------------------------------------------------

--
-- Table structure for table `room_features`
--

CREATE TABLE `room_features` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `features_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_features`
--

INSERT INTO `room_features` (`sr_no`, `room_id`, `features_id`) VALUES
(44, 8, 14),
(45, 9, 13),
(46, 9, 14),
(47, 10, 13),
(48, 10, 14),
(49, 10, 17),
(50, 10, 18),
(51, 11, 13),
(52, 11, 14),
(53, 11, 17);

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `thumb` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`sr_no`, `room_id`, `image`, `thumb`) VALUES
(19, 9, 'IMG_58745.jpg', 1),
(20, 11, 'IMG_89755.jpg', 1),
(21, 10, 'IMG_60121.jpg', 0),
(22, 10, 'IMG_57476.jpg', 1),
(23, 8, 'IMG_47778.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `token` varchar(200) DEFAULT NULL,
  `t_expire` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date_and_time` datetime NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `email`, `address`, `phone_num`, `pincode`, `dob`, `password`, `is_verified`, `token`, `t_expire`, `status`, `date_and_time`, `profile`) VALUES
(6, 'bharat', 'bharat_bitra@srmap.edu.in', 'guntur', '7889874589', 522503, '2025-07-04', '$2y$10$uyfRslRZ/eiR0PQtDGK.R.lZKmOIQVm9z/HNPXzrUG6IXQABUatLS', 1, NULL, NULL, 1, '2025-07-04 12:11:08', ''),
(7, 'bh', 'bitra.bharat29@gmail.com', 'dsfghj', '78', 522503, '2025-07-02', '$2y$10$xKMdjktD/JIIZBNrjYtrv.q6bySnoWjg4GC5srTJvFl0NdNHihZ2e', 1, '5346f74872b8a0a75835e945fdddff0d', NULL, 1, '2025-07-06 16:06:21', 'IMG_99102.jpeg'),
(9, 'Thug', 'thugisop@gmail.com', 'fcfrdrtdttfrdesr', '7989012428', 521225, '2005-08-04', '$2y$10$cpAVO1pd..PxCe5ltK8IWeSf2lJINZK3d6ZhTm1lsS57cJ24NYlDu', 1, '5f94abaf9e40e9e526a71b6e75ae8660', NULL, 1, '2025-07-06 21:55:07', 'jpeg_not_supported'),
(10, 'b', 'nabeelhisham2005@gmail.com', 'bhbhb', '789', 123456, '2025-07-02', '$2y$10$HF/w.fv3/yE3rq8SycNN2.2OpaA2v0N.e27Cpy8tEzJ.eG67e6fGW', 1, '1d5bede3c9e584bf539c83ca6ff76afa', NULL, 1, '2025-07-06 22:01:43', 'jpeg_not_supported');

-- --------------------------------------------------------

--
-- Table structure for table `user_reviews`
--

CREATE TABLE `user_reviews` (
  `sl_no` int(11) NOT NULL,
  `ur_name` varchar(50) NOT NULL,
  `ur_email` varchar(150) NOT NULL,
  `ur_subject` varchar(200) NOT NULL,
  `ur_message` varchar(500) NOT NULL,
  `ur_date` datetime NOT NULL DEFAULT current_timestamp(),
  `ur_seen` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_reviews`
--

INSERT INTO `user_reviews` (`sl_no`, `ur_name`, `ur_email`, `ur_subject`, `ur_message`, `ur_date`, `ur_seen`) VALUES
(10, 'sdf', 'bbb@gmail.com', 'wergthyj', 'sadfghj', '2025-07-03 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_contact_details`
--
ALTER TABLE `admin_contact_details`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`sl_no`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `carousel_images`
--
ALTER TABLE `carousel_images`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `hotel_facilities`
--
ALTER TABLE `hotel_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_features`
--
ALTER TABLE `hotel_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management_team_details`
--
ALTER TABLE `management_team_details`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`sl_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `facilities id` (`facilities_id`),
  ADD KEY `room id` (`room_id`);

--
-- Indexes for table `room_features`
--
ALTER TABLE `room_features`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `features id` (`features_id`),
  ADD KEY `rm id` (`room_id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD PRIMARY KEY (`sl_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_contact_details`
--
ALTER TABLE `admin_contact_details`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `carousel_images`
--
ALTER TABLE `carousel_images`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `hotel_facilities`
--
ALTER TABLE `hotel_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hotel_features`
--
ALTER TABLE `hotel_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `management_team_details`
--
ALTER TABLE `management_team_details`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `room_facilities`
--
ALTER TABLE `room_facilities`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `room_features`
--
ALTER TABLE `room_features`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_reviews`
--
ALTER TABLE `user_reviews`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Constraints for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD CONSTRAINT `rating_review_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`),
  ADD CONSTRAINT `rating_review_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `rating_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
