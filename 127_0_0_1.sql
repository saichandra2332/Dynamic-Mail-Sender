-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2024 at 11:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atm_project`
--
CREATE DATABASE IF NOT EXISTS `atm_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `atm_project`;

-- --------------------------------------------------------

--
-- Table structure for table `acc_details`
--

CREATE TABLE `acc_details` (
  `a_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `a_name` varchar(20) NOT NULL,
  `a_no` bigint(20) DEFAULT NULL,
  `a_bal` decimal(11,0) DEFAULT NULL,
  `a_wd` decimal(11,0) DEFAULT NULL,
  `a_dp` decimal(11,0) DEFAULT NULL,
  `a_status` int(1) DEFAULT NULL,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `acc_details`
--

INSERT INTO `acc_details` (`a_id`, `u_id`, `a_name`, `a_no`, `a_bal`, `a_wd`, `a_dp`, `a_status`, `c_d_t`) VALUES
(1, 1, 'sai', 6552566622, 2645, 1000, 1200000, 1, '2023-11-16 07:12:09'),
(2, 2, 'demudu', 5468987622, 34000, 3000, NULL, 1, '2023-10-26 07:03:32'),
(3, 3, 'devi', 6544556622, 44000, 1000, NULL, 1, '2023-10-22 16:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `atmbal_details`
--

CREATE TABLE `atmbal_details` (
  `atm_id` int(11) NOT NULL,
  `atm_tbal` bigint(11) DEFAULT NULL,
  `n_2000` int(10) DEFAULT NULL,
  `n_500` int(10) DEFAULT NULL,
  `n_200` int(10) DEFAULT NULL,
  `n_100` int(10) DEFAULT NULL,
  `atm_status` int(1) DEFAULT NULL,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `atmbal_details`
--

INSERT INTO `atmbal_details` (`atm_id`, `atm_tbal`, `n_2000`, `n_500`, `n_200`, `n_100`, `atm_status`, `c_d_t`) VALUES
(1, 999000, 200, 572, 500, 1004, 1, '2023-11-16 07:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `rec_details`
--

CREATE TABLE `rec_details` (
  `r_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `r_name` varchar(20) DEFAULT NULL,
  `r_accno` bigint(11) DEFAULT NULL,
  `r_bal` decimal(11,0) NOT NULL,
  `r_dp` decimal(11,0) NOT NULL,
  `r_status` int(1) DEFAULT NULL,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rec_details`
--

INSERT INTO `rec_details` (`r_id`, `u_id`, `r_name`, `r_accno`, `r_bal`, `r_dp`, `r_status`, `c_d_t`) VALUES
(1, 1, 'pavankumar', 6756456622, 1000, 1000, 1, '2023-10-26 06:44:21'),
(2, 2, 'mahesh', 5432809811, 10000, 10000, 1, '2023-10-26 07:01:28'),
(3, 3, 'rohith', 2345897711, 0, 0, 1, '2023-10-26 06:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `tra_details`
--

CREATE TABLE `tra_details` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(20) DEFAULT NULL,
  `t_accno` bigint(11) DEFAULT NULL,
  `t_wd` decimal(11,0) NOT NULL,
  `t_dp` decimal(11,0) NOT NULL,
  `t_tbal` decimal(11,0) DEFAULT NULL,
  `t_status` enum('1','0') DEFAULT '1',
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tra_details`
--

INSERT INTO `tra_details` (`t_id`, `t_name`, `t_accno`, `t_wd`, `t_dp`, `t_tbal`, `t_status`, `c_d_t`) VALUES
(1, 'pavan', 6552566622, 1000, 0, 18000, '1', '2023-10-20 06:19:16'),
(2, 'mani', 5468987622, 5000, 0, 50000, '1', '2023-10-20 06:20:36'),
(3, 'anandh', 6544556622, 5000, 0, 50000, '1', '2023-10-20 06:24:50'),
(4, 'pavan', 6552566622, 1000, 0, 17000, '1', '2023-10-20 06:47:44'),
(5, 'pavan', 6552566622, 1000, 0, 16000, '1', '2023-10-20 06:51:58'),
(6, 'anandh', 6544556622, 3000, 0, 47000, '1', '2023-10-20 07:18:24'),
(7, 'anandh', 6544556622, 1000, 0, 46000, '1', '2023-10-20 07:22:23'),
(8, 'anandh', 6544556622, 1000, 0, 45000, '1', '2023-10-20 07:22:58'),
(9, 'anandh', 6544556622, 1000, 0, 44000, '1', '2023-10-20 07:23:59'),
(10, 'mani', 5468987622, 3000, 0, 47000, '1', '2023-10-20 15:54:30'),
(11, 'mani', 5468987622, 2000, 0, 45000, '1', '2023-10-22 16:01:54'),
(12, 'demudu', 5468987622, 5000, 0, 40000, '1', '2023-10-22 16:10:17'),
(13, 'demudu', 5468987622, 1000, 0, 39000, '1', '2023-10-23 16:45:28'),
(14, 'demudu', 5468987622, 1000, 0, 38000, '1', '2023-10-24 16:39:40'),
(15, 'sai', 6552566622, 1000, 0, 15000, '1', '2023-10-25 06:16:14'),
(16, 'sai', 6552566622, 3000, 0, 12000, '1', '2023-10-25 07:03:39'),
(17, 'sai', 6552566622, 1000, 0, 11000, '1', '2023-10-25 07:32:06'),
(18, 'demudu', 5468987622, 1000, 0, 37000, '1', '2023-10-25 07:33:42'),
(19, '', 0, 0, 1000, 1000, '1', '2023-10-25 16:16:11'),
(20, 'sai', 6552566622, 0, 10000, 21000, '1', '2023-10-26 06:05:07'),
(21, 'sai', 6552566622, 0, 10000, 31000, '1', '2023-10-26 06:07:36'),
(22, 'sai', 6552566622, 0, 55, 31055, '1', '2023-10-26 06:08:40'),
(23, 'sai', 6552566622, 0, 555, 31610, '1', '2023-10-26 06:11:24'),
(24, 'sai', 6552566622, 0, 5555, 36610, '1', '2023-10-26 06:11:56'),
(25, 'pavankumar', 6756456622, 0, 1000, 1000, '1', '2023-10-26 06:44:20'),
(26, 'sai', 6552566622, 0, 1000, 37610, '1', '2023-10-26 06:45:38'),
(27, 'sai', 6552566622, 1000, 0, 36610, '1', '2023-10-26 06:53:13'),
(28, 'sai', 6552566622, 0, 1000, 37610, '1', '2023-10-26 06:59:20'),
(29, 'sai', 6552566622, 0, 30, 37640, '1', '2023-10-26 06:59:44'),
(30, '', 0, 0, 10000, 10000, '1', '2023-10-26 07:00:22'),
(31, 'mahesh', 5432809811, 0, 10000, 10000, '1', '2023-10-26 07:01:28'),
(32, 'sai', 6552566622, 0, 55, 37695, '1', '2023-10-26 07:02:13'),
(33, 'demudu', 5468987622, 3000, 0, 34000, '1', '2023-10-26 07:03:32'),
(34, 'sai', 6552566622, 30000, 0, 7695, '1', '2023-10-26 07:43:48'),
(35, 'sai', 6552566622, 50, 0, 7645, '1', '2023-10-26 07:48:16'),
(36, 'sai', 6552566622, 2000, 0, 5645, '1', '2023-10-26 07:49:55'),
(37, 'sai', 6552566622, 2000, 0, 3645, '1', '2023-10-26 07:52:20'),
(38, 'sai', 6552566622, 0, 1200000, 1203645, '1', '2023-11-02 06:48:44'),
(39, 'sai', 6552566622, 1200000, 0, 3645, '1', '2023-11-02 06:49:42'),
(40, 'sai', 6552566622, 1000, 0, 2645, '1', '2023-11-16 07:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(20) DEFAULT NULL,
  `u_mail` varchar(30) DEFAULT NULL,
  `u_pwd` varchar(20) DEFAULT NULL,
  `u_con` bigint(12) DEFAULT NULL,
  `u_status` int(1) DEFAULT NULL,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`u_id`, `u_name`, `u_mail`, `u_pwd`, `u_con`, `u_status`, `c_d_t`) VALUES
(1, 'saichandra', 'saichandra2332@gmail.com', '1111', 7386606346, 1, '2023-10-25 07:04:21'),
(2, 'demudu', 'sdemudu2332@gmail.com', '2332', 9949646346, 1, '2023-10-14 08:02:11'),
(3, 'devi', 'sdevi5252@gmail.com', '5252', 9160498404, 1, '2023-10-14 08:04:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_details`
--
ALTER TABLE `acc_details`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `atmbal_details`
--
ALTER TABLE `atmbal_details`
  ADD PRIMARY KEY (`atm_id`);

--
-- Indexes for table `rec_details`
--
ALTER TABLE `rec_details`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `tra_details`
--
ALTER TABLE `tra_details`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_details`
--
ALTER TABLE `acc_details`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `atmbal_details`
--
ALTER TABLE `atmbal_details`
  MODIFY `atm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rec_details`
--
ALTER TABLE `rec_details`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tra_details`
--
ALTER TABLE `tra_details`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `college_db`
--
CREATE DATABASE IF NOT EXISTS `college_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `college_db`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_otp_check`
--

CREATE TABLE `tbl_otp_check` (
  `id` int(10) NOT NULL,
  `otp` int(10) NOT NULL,
  `is_expired` varchar(30) NOT NULL,
  `create_at` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` int(12) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`id`, `name`, `dob`, `email`, `mobile`, `entry_date`) VALUES
(1, 'Vulcan', '2002-05-10', 'saichandra2332@gmail.com', 2147483647, '2023-12-14 03:55:35'),
(2, 'Vulcan', '2002-05-10', 'vulcan@gmail.com', 2147483647, '2023-12-14 03:54:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_otp_check`
--
ALTER TABLE `tbl_otp_check`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_otp_check`
--
ALTER TABLE `tbl_otp_check`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `dbase_per`
--
CREATE DATABASE IF NOT EXISTS `dbase_per` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbase_per`;

-- --------------------------------------------------------

--
-- Table structure for table `persondata`
--

CREATE TABLE `persondata` (
  `p_id` int(11) NOT NULL,
  `p_fname` varchar(20) DEFAULT NULL,
  `p_lname` varchar(20) DEFAULT NULL,
  `p_contact` bigint(11) DEFAULT NULL,
  `p_mail` varchar(20) DEFAULT NULL,
  `p_img` blob DEFAULT NULL,
  `p_status` int(1) DEFAULT NULL,
  `CREATE_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persondata`
--

INSERT INTO `persondata` (`p_id`, `p_fname`, `p_lname`, `p_contact`, `p_mail`, `p_img`, `p_status`, `CREATE_date_time`) VALUES
(1, 'sai chandra', 'sabbavarapu', 7386606346, 'saichandra2332@gmail', '', 1, '2023-10-06 07:14:45'),
(2, 'navven', 'pachila', 9533308166, 'naveen02@gmail.com', '', 1, '2023-10-06 07:21:47'),
(3, 'poorna', 'chandra', 7665443333, 'poorna@gmail.com', '', 1, '2023-10-06 07:28:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `persondata`
--
ALTER TABLE `persondata`
  ADD PRIMARY KEY (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `persondata`
--
ALTER TABLE `persondata`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `exam_project`
--
CREATE DATABASE IF NOT EXISTS `exam_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exam_project`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `a_id` int(2) NOT NULL,
  `a_mail` varchar(20) DEFAULT NULL,
  `a_pwd` varchar(20) DEFAULT NULL,
  `a_status` int(2) DEFAULT NULL,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`a_id`, `a_mail`, `a_pwd`, `a_status`, `c_d_t`) VALUES
(1, 'sdevi2332@gmail.com', '2332', 1, '2023-11-23 17:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `answerstable`
--

CREATE TABLE `answerstable` (
  `a_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` varchar(200) NOT NULL,
  `answer_status` int(1) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answerstable`
--

INSERT INTO `answerstable` (`a_id`, `u_id`, `question_id`, `answer_id`, `answer_status`, `c_d_t`) VALUES
(1, 2, 1, 'A', 0, '2023-12-08 05:25:57'),
(2, 2, 2, 'A', 1, '2023-12-08 07:02:25'),
(3, 2, 3, 'A', 1, '2023-12-08 07:02:28'),
(4, 2, 4, 'A', 1, '2023-12-08 07:02:31'),
(5, 2, 5, 'A', 1, '2023-12-08 07:02:33'),
(6, 2, 6, 'A', 1, '2023-12-08 07:02:35'),
(7, 2, 7, 'A', 1, '2023-12-08 07:02:38'),
(8, 2, 8, 'A', 1, '2023-12-08 07:02:40'),
(9, 2, 9, 'A', 1, '2023-12-08 07:02:43'),
(10, 2, 10, 'A', 1, '2023-12-08 07:02:45'),
(11, 2, 11, 'A', 1, '2023-12-08 07:02:47'),
(12, 2, 12, 'A', 1, '2023-12-08 07:02:50'),
(13, 2, 13, 'A', 1, '2023-12-08 07:02:53'),
(14, 2, 14, 'A', 1, '2023-12-08 07:02:56'),
(15, 2, 15, 'A', 1, '2023-12-08 07:02:58'),
(16, 2, 16, 'A', 1, '2023-12-08 07:03:01'),
(17, 2, 17, 'A', 1, '2023-12-08 07:03:04'),
(18, 2, 18, 'A', 1, '2023-12-08 07:03:06'),
(19, 2, 19, 'A', 1, '2023-12-08 07:03:09'),
(20, 2, 20, 'A', 1, '2023-12-08 07:03:11'),
(21, 2, 21, 'A', 1, '2023-12-08 07:03:14'),
(22, 2, 22, 'A', 1, '2023-12-08 07:03:17'),
(23, 2, 23, 'A', 1, '2023-12-08 07:03:20'),
(24, 2, 24, 'A', 1, '2023-12-08 07:03:24'),
(25, 2, 25, 'A', 1, '2023-12-08 07:03:26'),
(26, 2, 26, 'A', 1, '2023-12-08 07:03:30'),
(27, 2, 27, 'A', 1, '2023-12-08 07:03:32'),
(28, 2, 28, 'A', 1, '2023-12-08 07:03:36'),
(29, 2, 29, 'A', 1, '2023-12-08 07:03:39'),
(30, 2, 30, 'A', 1, '2023-12-08 07:03:41'),
(31, 2, 31, 'A', 1, '2023-12-08 07:03:45'),
(32, 2, 32, 'A', 1, '2023-12-08 07:03:48'),
(33, 2, 33, 'A', 1, '2023-12-08 07:03:51'),
(34, 2, 34, 'A', 1, '2023-12-08 07:03:55'),
(35, 2, 35, 'A', 1, '2023-12-08 07:03:58'),
(36, 2, 36, 'A', 1, '2023-12-08 07:04:00'),
(37, 2, 37, 'A', 1, '2023-12-08 07:04:05'),
(38, 2, 38, 'A', 1, '2023-12-08 07:04:07'),
(39, 2, 39, 'A', 1, '2023-12-08 07:04:11'),
(40, 1, 1, '', 1, '2023-12-22 07:35:02'),
(41, 1, 2, '', 1, '2023-12-12 06:23:07'),
(42, 1, 3, 'A', 1, '2024-03-20 10:00:52'),
(43, 1, 4, '', 1, '2023-12-24 07:31:57'),
(44, 1, 5, 'A', 1, '2024-01-11 16:18:47'),
(45, 1, 6, '', 1, '2023-12-11 06:07:31'),
(46, 1, 7, '', 1, '2023-12-11 06:07:41'),
(47, 1, 8, '', 1, '2024-01-02 04:12:35'),
(48, 1, 9, '', 1, '2024-01-02 04:12:35'),
(49, 1, 10, '', 1, '2024-01-11 16:18:50'),
(50, 1, 11, '', 1, '2024-01-11 16:18:50'),
(51, 1, 12, '', 1, '2024-01-02 04:12:48'),
(52, 1, 13, 'A', 1, '2023-12-08 07:10:06'),
(53, 1, 14, 'A', 1, '2023-12-08 07:10:09'),
(54, 1, 15, 'A', 1, '2023-12-08 07:10:12'),
(55, 1, 16, 'A', 1, '2023-12-08 07:10:15'),
(56, 1, 17, 'A', 1, '2023-12-08 07:10:18'),
(57, 1, 18, 'A', 1, '2023-12-08 07:10:20'),
(58, 1, 19, 'A', 1, '2023-12-08 07:10:24'),
(59, 1, 20, 'A', 1, '2023-12-08 07:10:26'),
(60, 1, 21, 'A', 1, '2023-12-08 07:10:29'),
(61, 1, 22, 'A', 1, '2023-12-08 07:10:32'),
(62, 1, 23, 'A', 1, '2023-12-08 07:10:34'),
(63, 1, 24, 'A', 1, '2023-12-08 07:10:37'),
(64, 1, 25, '', 1, '2024-03-20 10:01:30'),
(65, 1, 26, 'A', 1, '2023-12-08 07:10:42'),
(66, 1, 27, 'A', 1, '2023-12-08 07:10:45'),
(67, 1, 28, '', 1, '2024-03-20 10:01:29'),
(68, 1, 29, 'A', 1, '2023-12-08 07:10:51'),
(69, 1, 30, '', 1, '2023-12-12 04:27:05'),
(70, 1, 31, '', 1, '2023-12-12 04:27:18'),
(71, 1, 32, '', 1, '2023-12-12 04:27:17'),
(72, 1, 33, 'A', 1, '2023-12-08 07:11:03'),
(73, 1, 34, 'A', 1, '2023-12-08 07:11:09'),
(74, 1, 35, 'A', 1, '2023-12-08 07:11:14'),
(75, 1, 36, 'A', 1, '2023-12-08 07:11:17'),
(76, 1, 37, '', 1, '2023-12-08 07:11:43'),
(77, 1, 38, 'A', 1, '2023-12-08 07:11:46'),
(78, 1, 39, 'A', 1, '2023-12-08 07:11:54'),
(79, 4, 1, 'A', 1, '2023-12-10 05:24:22'),
(80, 4, 2, 'A', 1, '2023-12-10 05:24:25'),
(81, 4, 3, 'A', 1, '2023-12-10 05:24:27'),
(82, 4, 4, 'A', 1, '2023-12-10 05:24:30'),
(83, 4, 5, 'A', 1, '2023-12-10 05:24:33'),
(84, 4, 6, 'A', 1, '2023-12-10 05:24:35'),
(85, 4, 7, 'A', 1, '2023-12-10 05:24:37'),
(86, 4, 8, '', 1, '2023-12-10 05:24:45'),
(87, 4, 9, 'A', 1, '2023-12-10 05:24:48'),
(88, 4, 10, 'A', 1, '2023-12-10 05:24:51'),
(89, 4, 11, 'A', 1, '2023-12-10 05:24:53'),
(90, 4, 12, 'A', 1, '2023-12-10 05:24:56'),
(91, 4, 13, 'A', 1, '2023-12-10 05:24:58'),
(92, 4, 14, 'A', 1, '2023-12-10 05:25:01'),
(93, 4, 15, 'A', 1, '2023-12-10 05:25:04'),
(94, 4, 16, 'A', 1, '2023-12-10 05:25:07'),
(95, 4, 17, 'A', 1, '2023-12-10 05:25:09'),
(96, 4, 18, 'A', 1, '2023-12-10 05:25:13'),
(97, 4, 19, 'A', 1, '2023-12-10 05:25:16'),
(98, 4, 20, 'A', 1, '2023-12-10 05:25:19'),
(99, 4, 21, '', 1, '2023-12-10 05:25:29'),
(100, 4, 22, 'A', 1, '2023-12-10 05:25:40'),
(101, 4, 23, 'A', 1, '2023-12-10 05:25:43'),
(102, 4, 24, 'A', 1, '2023-12-10 05:25:45'),
(103, 4, 25, 'A', 1, '2023-12-10 05:25:48'),
(104, 4, 26, 'A', 1, '2023-12-10 05:25:51'),
(105, 4, 27, 'A', 1, '2023-12-10 05:25:53'),
(106, 4, 28, 'A', 1, '2023-12-10 05:25:56'),
(107, 4, 29, 'A', 1, '2023-12-10 05:25:59'),
(108, 4, 30, 'A', 1, '2023-12-10 05:26:02'),
(109, 4, 31, 'A', 1, '2023-12-10 05:26:06'),
(110, 4, 32, 'A', 1, '2023-12-10 05:26:09'),
(111, 4, 33, 'A', 1, '2023-12-10 05:26:12'),
(112, 4, 34, 'A', 1, '2023-12-10 05:26:15'),
(113, 4, 35, 'A', 1, '2023-12-10 05:26:18'),
(114, 4, 36, 'A', 1, '2023-12-10 05:26:22'),
(115, 4, 37, 'A', 1, '2023-12-10 05:26:25'),
(116, 4, 38, 'A', 1, '2023-12-10 05:26:29'),
(117, 4, 39, 'A', 1, '2023-12-10 05:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `apptitude`
--

CREATE TABLE `apptitude` (
  `ap_id` int(10) NOT NULL,
  `ap_question` varchar(60) NOT NULL,
  `apo_1` varchar(40) NOT NULL,
  `apo_2` varchar(40) NOT NULL,
  `apo_3` varchar(40) NOT NULL,
  `apo_4` varchar(40) NOT NULL,
  `ap_status` int(1) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apptitude`
--

INSERT INTO `apptitude` (`ap_id`, `ap_question`, `apo_1`, `apo_2`, `apo_3`, `apo_4`, `ap_status`, `c_d_t`) VALUES
(1, ' Look at the series, 46, 44, 40, 38, 34, _, which number sho', '30', '31', '32', '36', 1, '2023-11-26 10:18:08'),
(2, ' CKDL, EKFL, GKHL, _, KKLL, find the missing letters.', 'IJKL', 'IKJL', 'MNOP', 'MNPQ', 1, '2023-11-26 13:25:06'),
(3, ' FRAME: PICTURE', 'Criminal: Crime', 'River: Forest', 'Nail: Hammer', 'Binding: Book', 1, '2023-11-26 13:41:45'),
(4, ' Which word does not belong to others?', 'Inch', 'Kilogram', 'Centimeter', 'Yard', 1, '2023-11-26 13:43:08'),
(5, ' Pointing to a woman, a man said, \"Her father is the only so', 'Brother', 'Grandfather', 'Father', 'Son', 1, '2023-11-26 13:44:21'),
(6, ' If in a certain language, NOIDA is coded as OPJEB, how is D', 'CDKGH', 'EFMIJ', 'FGNJK', 'IHLED', 1, '2023-11-26 13:47:02'),
(7, ' Which number would replace the underline mark in the series', '240', '260', '280', '300', 1, '2023-11-26 13:49:07'),
(8, 'Complete the series 1,6,13,22,33,..', '46', '48', '49', '51', 1, '2023-11-26 13:51:19'),
(9, 'At a conference, 12 members shook hands with each other befo', '100', '122', '132', '145', 1, '2023-11-26 13:52:24'),
(10, 'The day after the day after tomorrow is four days before Mon', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 1, '2023-11-26 13:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `examdetails`
--

CREATE TABLE `examdetails` (
  `ex_id` int(10) NOT NULL,
  `ex_name` varchar(20) NOT NULL,
  `ex_tques` int(20) NOT NULL,
  `ex_time` varchar(10) NOT NULL,
  `ex_secname` varchar(11) NOT NULL,
  `ex_status` int(1) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `examdetails`
--

INSERT INTO `examdetails` (`ex_id`, `ex_name`, `ex_tques`, `ex_time`, `ex_secname`, `ex_status`, `c_d_t`) VALUES
(2, 'Vulcantechs ', 10, '15min', 'Apptitude', 1, '2023-11-26 15:04:44'),
(3, 'Vulcantechs ', 10, '15min', 'Reasoning', 1, '2023-11-26 15:05:14'),
(4, 'Vulcantechs ', 5, '10min', 'Verbal', 1, '2023-11-26 15:05:54'),
(5, 'Vulcantechs ', 3, '20min', 'Technical', 1, '2023-11-26 15:06:19'),
(6, '', 0, '', 'Apptitude', 1, '2023-12-05 04:16:01'),
(7, '', 0, '', 'Apptitude', 1, '2023-12-05 05:20:49'),
(8, '', 0, '', 'Apptitude', 1, '2023-12-05 05:34:08'),
(9, '', 0, '', 'Apptitude', 1, '2023-12-05 05:34:09'),
(10, '', 0, '', 'Apptitude', 1, '2023-12-05 05:43:36'),
(11, '', 0, '', 'Apptitude', 1, '2023-12-05 05:43:40'),
(12, '', 0, '', 'Apptitude', 1, '2023-12-05 05:43:41'),
(13, '', 0, '', 'Apptitude', 1, '2023-12-05 05:44:17'),
(14, '', 0, '', 'Apptitude', 1, '2023-12-05 05:45:13'),
(15, '', 0, '', 'Apptitude', 1, '2023-12-05 05:49:00'),
(16, '', 0, '', 'Apptitude', 1, '2023-12-05 05:49:03'),
(17, '', 0, '', 'Apptitude', 1, '2023-12-05 05:51:28'),
(18, '', 0, '', 'Apptitude', 1, '2023-12-05 05:52:07'),
(19, '', 0, '', 'Apptitude', 1, '2023-12-05 05:58:05'),
(20, '', 0, '', 'Apptitude', 1, '2023-12-05 05:59:30'),
(21, '', 0, '', 'Apptitude', 1, '2023-12-05 05:59:43'),
(22, '', 0, '', 'Apptitude', 1, '2023-12-05 06:29:30'),
(23, '', 0, '', 'Apptitude', 1, '2023-12-05 06:55:19'),
(24, '', 0, '', 'Apptitude', 1, '2023-12-06 04:50:59'),
(25, '', 0, '', 'Apptitude', 1, '2023-12-06 07:58:42'),
(26, '', 0, '', 'Apptitude', 1, '2023-12-06 07:58:45'),
(27, '', 0, '', 'Apptitude', 1, '2023-12-07 06:06:37'),
(28, '', 0, '', 'Apptitude', 1, '2023-12-07 06:06:41'),
(29, '', 0, '', 'Apptitude', 1, '2023-12-07 06:06:55'),
(30, '', 0, '', 'Apptitude', 1, '2023-12-08 05:27:57'),
(31, '', 0, '', 'Apptitude', 1, '2023-12-08 05:59:48'),
(32, '', 0, '', 'Apptitude', 1, '2023-12-11 05:25:05'),
(33, '', 0, '', 'Apptitude', 1, '2023-12-11 05:29:43'),
(34, '', 0, '', 'Apptitude', 1, '2023-12-11 05:38:53'),
(35, '', 0, '', 'Apptitude', 1, '2023-12-11 05:38:55'),
(36, '', 0, '', 'Apptitude', 1, '2023-12-11 05:38:58'),
(37, '', 0, '', 'Apptitude', 1, '2023-12-11 05:39:23'),
(38, '', 0, '', 'Apptitude', 1, '2023-12-11 05:39:25'),
(39, '', 0, '', 'Apptitude', 1, '2023-12-11 05:39:26'),
(40, '', 0, '', 'Apptitude', 1, '2023-12-11 05:39:54'),
(41, '', 0, '', 'Apptitude', 1, '2023-12-11 05:39:56'),
(42, '', 0, '', 'Apptitude', 1, '2023-12-11 05:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `examkey`
--

CREATE TABLE `examkey` (
  `k_id` int(10) NOT NULL,
  `kquestion_id` int(10) NOT NULL,
  `key_ans` varchar(20) NOT NULL,
  `k_status` int(1) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `examkey`
--

INSERT INTO `examkey` (`k_id`, `kquestion_id`, `key_ans`, `k_status`, `c_d_t`) VALUES
(1, 1, 'C', 1, '2023-12-08 06:29:43'),
(2, 2, 'B', 1, '2023-12-08 06:29:50'),
(3, 3, 'A', 1, '2023-12-08 06:29:55'),
(4, 4, 'D', 1, '2023-12-08 06:30:00'),
(5, 5, 'D', 1, '2023-12-08 06:30:06'),
(6, 6, 'A', 1, '2023-12-08 06:30:13'),
(7, 7, 'B', 1, '2023-12-08 06:30:18'),
(8, 8, 'D', 1, '2023-12-08 06:30:25'),
(9, 9, 'C', 1, '2023-12-08 06:30:31'),
(10, 10, 'A', 1, '2023-12-08 06:30:36'),
(11, 11, 'C', 1, '2023-12-08 06:30:41'),
(12, 12, 'D', 1, '2023-12-08 06:30:46'),
(13, 13, 'D', 1, '2023-12-08 06:30:52'),
(14, 14, 'D', 1, '2023-12-08 06:30:58'),
(15, 15, 'D', 1, '2023-12-08 06:31:04'),
(16, 16, 'A', 1, '2023-12-08 06:31:10'),
(17, 17, 'B', 1, '2023-12-08 06:31:17'),
(18, 18, 'C', 1, '2023-12-08 06:31:22'),
(19, 19, 'B', 1, '2023-12-08 06:31:29'),
(20, 20, 'A', 1, '2023-12-08 06:31:33'),
(21, 21, 'A', 1, '2023-12-08 06:31:53'),
(22, 22, 'C', 1, '2023-12-08 06:31:57'),
(23, 23, 'A', 1, '2023-12-08 06:32:04'),
(24, 24, 'D', 1, '2023-12-08 06:32:09'),
(25, 25, 'B', 1, '2023-12-08 06:32:15'),
(26, 26, 'B', 1, '2023-12-08 06:32:21'),
(27, 27, 'B', 1, '2023-12-08 06:32:26'),
(28, 28, 'A', 1, '2023-12-08 06:32:32'),
(29, 29, 'D', 1, '2023-12-08 06:32:39'),
(30, 30, 'C', 1, '2023-12-08 06:32:45'),
(31, 31, 'B', 1, '2023-12-08 06:32:51'),
(32, 32, 'B', 1, '2023-12-08 06:32:57'),
(33, 33, 'A', 1, '2023-12-08 06:33:02'),
(34, 34, 'B', 1, '2023-12-08 06:33:19'),
(35, 35, 'C', 1, '2023-12-08 06:33:24'),
(36, 36, 'D', 1, '2023-12-08 06:33:29'),
(37, 37, 'A', 1, '2023-12-08 06:33:35'),
(38, 38, 'D', 1, '2023-12-08 06:33:41'),
(39, 39, 'A', 1, '2023-12-08 06:33:47'),
(40, 40, 'A', 1, '2023-12-08 06:33:53'),
(41, 0, '', 1, '2023-12-11 05:29:57'),
(42, 0, '', 1, '2023-12-11 05:38:51'),
(43, 0, '', 1, '2023-12-11 05:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `reasoning`
--

CREATE TABLE `reasoning` (
  `r_id` int(10) NOT NULL,
  `re_question` varchar(60) NOT NULL,
  `reo_1` varchar(40) NOT NULL,
  `reo_2` varchar(40) NOT NULL,
  `reo_3` varchar(40) NOT NULL,
  `reo_4` varchar(40) NOT NULL,
  `re_status` int(1) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reasoning`
--

INSERT INTO `reasoning` (`r_id`, `re_question`, `reo_1`, `reo_2`, `reo_3`, `reo_4`, `re_status`, `c_d_t`) VALUES
(11, ' How many times the hands of a clock coincide in a day?', '21', '22', '23', '24', 1, '2023-12-04 05:54:54'),
(12, 'Today it is Thursday.After 132 days,it will be', 'Monday', 'Sunday', 'Wednesday', 'Thursday', 1, '2023-12-04 05:54:50'),
(13, 'A train 120 meters long is running with a speed of 60 km/hr.', '6.54 sec', '44.32 sec', '55 sec', '30.2 sec', 1, '2023-12-04 05:54:42'),
(14, 'Devesh can cover a certain distance in 1 hour 24 minutes by ', '8 km', '9 km', '6 km', '7/5 km', 1, '2023-12-04 05:54:37'),
(15, 'Find the H.C.F, if the numbers are in the ratio of 4 : 5 : 6', '35', '20', '40', '67', 1, '2023-12-04 05:54:33'),
(16, 'What is the value of c , If 8 is 4% of a, and 4 is 8% of b. ', '12', '1/4', '0.155', 'None of these', 1, '2023-12-04 05:54:28'),
(17, 'P and Q take part in 100 m race. P runs at 6kmph. P gives Q ', '6.14 kmph', '15.2 kmph', '5 kmph', '4.86 kmph', 1, '2023-12-04 05:54:24'),
(18, 'Find the speed of the boat in still water, if a boat covers ', '12 kmph', '18 kmph', '21 kmph', '24 kmph', 1, '2023-12-04 05:54:19'),
(19, 'The rate at which a sum becomes four times of itself in 25 y', '30', '25', '12', '49', 1, '2023-12-04 05:53:59'),
(20, ' A mother is twice as old as her son. If 20 years ago, the a', '38 years', '40 years', '43 years', '45 years', 1, '2023-12-04 05:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `tech`
--

CREATE TABLE `tech` (
  `te_id` int(20) NOT NULL,
  `te_question` varchar(500) NOT NULL,
  `teo_1` varchar(400) NOT NULL,
  `teo_2` varchar(400) NOT NULL,
  `teo_3` varchar(400) NOT NULL,
  `teo_4` varchar(400) NOT NULL,
  `te_status` int(1) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tech`
--

INSERT INTO `tech` (`te_id`, `te_question`, `teo_1`, `teo_2`, `teo_3`, `teo_4`, `te_status`, `c_d_t`) VALUES
(31, 'The correct sequence of HTML tags for starting a webpage is -', 'Head, Title, HTML, body', 'HTML, Body, Title, Head', 'h', 'HTML, Head, Title, Body', 1, '2023-12-04 05:56:59'),
(32, 'Which of the following tag is used to insert a line-break in HTML?', '<br>', '<a>', '<pre>', '<b>', 1, '2023-12-04 05:57:06'),
(33, 'How to insert an image in HTML?', '<img href = \"jtp.png\" />', '<img url = \"jtp.png\" />', '<img link = \"jtp.png\" />', '<img src = \"jtp.png\" />', 1, '2023-12-04 05:57:10'),
(34, ' Which of the following is the correct syntax for referring the external style sheet?', '<style src = example.css>', '<style src = \"example.css\" >', '<stylesheet> example.css </stylesheet>', '<link rel=\"stylesheet\" type=\"text/css\" href=\"example.css\">', 1, '2023-12-04 05:57:16'),
(35, ' The HTML attribute used to define the inline styles is -', 'style', 'styles', 'class', 'None of the above', 1, '2023-12-04 05:57:22'),
(36, ' Which type of JavaScript language is ___', 'Object-Oriented', 'Object-Based', 'Assembly-language', 'High-level', 1, '2023-12-04 05:57:29'),
(37, 'Which one of the following also known as Conditional Expression:', 'Alternative to if-else', 'Switch statement', 'If-then-else statement', 'immediate if', 1, '2023-12-04 05:57:36'),
(38, ' When interpreter encounters an empty statements, what it will do:', 'Shows a warning', 'Prompts to complete the statement', 'Throws an error', 'Ignores the statements', 1, '2023-12-04 05:57:42'),
(39, ' Variable name in PHP starts with -', '! (Exclamation)', '$ (Dollar)', '& (Ampersand)', '# (Hash)', 1, '2023-12-04 05:57:49'),
(40, ' Which of the following is not a variable scope in PHP?', 'Extern', 'Local', 'Static', 'Global', 1, '2023-12-04 05:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `technical`
--

CREATE TABLE `technical` (
  `te_id` int(10) NOT NULL,
  `te_question` varchar(500) NOT NULL,
  `teo_1` varchar(300) NOT NULL,
  `teo_2` varchar(300) NOT NULL,
  `teo_3` varchar(300) NOT NULL,
  `teo_4` varchar(300) NOT NULL,
  `te_status` int(1) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technical`
--

INSERT INTO `technical` (`te_id`, `te_question`, `teo_1`, `teo_2`, `teo_3`, `teo_4`, `te_status`, `c_d_t`) VALUES
(2, 'Why do we use the word “debugger” in javascript?', '', '', '', '', 1, '2023-11-26 15:02:06'),
(3, ' What are callbacks?', '', '', '', '', 1, '2023-11-26 15:02:50'),
(4, 'What is the use of promises in javascript?', '', '', '', '', 1, '2023-11-26 15:03:22'),
(5, '', '', '', '', '', 1, '2023-11-27 06:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `u_id` int(2) NOT NULL,
  `u_name` varchar(39) NOT NULL,
  `u_mail` varchar(20) DEFAULT NULL,
  `u_pwd` varchar(20) DEFAULT NULL,
  `STATUS` int(2) DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`u_id`, `u_name`, `u_mail`, `u_pwd`, `STATUS`, `c_d_t`) VALUES
(1, 'Sai Chandra', 'saichandra@gmail.com', '1111', 1, '2023-12-08 07:08:18'),
(2, 'Demudu', 'sdemudu@gmail.com', 'demudu', 1, '2023-12-10 03:24:54'),
(3, 'Devi', 'sdevi@gmail.com', 'devi', 1, '2023-12-10 05:18:29'),
(4, 'Pavan', 'spavan@gmail.com', 'pavan123', 1, '2023-12-10 05:23:32'),
(5, 'venkatesh', 'venkateshgmail.com', '12345', 1, '2023-12-12 04:23:05'),
(11, 'sai2332', 'sdevi@gmail.com', '2222', 1, '2023-12-12 05:59:04'),
(12, 'sai', 'venkatesh@gmail.com', '3333', 1, '2023-12-12 06:06:54'),
(13, 'm@gmai.com', 'm@gmai.com', 'jbhj', 1, '2024-01-02 04:09:50'),
(14, 'kalyan', 'kalyankumar@123gmail', '1234', 1, '2024-01-11 16:15:20'),
(15, 'sai123', 'saichandra232@gmail.', '1111', 1, '2024-03-18 05:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `verbal`
--

CREATE TABLE `verbal` (
  `ve_id` int(10) NOT NULL,
  `ve_question` varchar(400) NOT NULL,
  `veo_1` varchar(400) NOT NULL,
  `veo_2` varchar(400) NOT NULL,
  `veo_3` varchar(400) NOT NULL,
  `veo_4` varchar(400) NOT NULL,
  `veo_status` varchar(2) NOT NULL DEFAULT '1',
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verbal`
--

INSERT INTO `verbal` (`ve_id`, `ve_question`, `veo_1`, `veo_2`, `veo_3`, `veo_4`, `veo_status`, `c_d_t`) VALUES
(21, ' While flying over (1) India we had (2) glimpses of (3) Himalayas and Ganges. (4) No error (5)', '1', '2', '4', '5', '1', '2023-12-04 05:55:37'),
(22, 'Choose one of the following options that means the opposite of the given word; Copious:', 'Reverse', 'Scarce', 'Abundant', 'Short', '1', '2023-12-04 05:55:43'),
(23, 'Choose the synonym of Adversity', 'Failure', 'Crisis', 'Misfortune', 'illness', '1', '2023-12-04 05:55:53'),
(24, ' She lived ____ the expectations.', 'as per', 'up to', 'on', 'at', '1', '2023-12-04 05:55:57'),
(25, ' Can you (1) repair my (2) car until (3) Friday? (4) No error (5)', '1', '2', '3', '4', '1', '2023-12-04 05:56:02'),
(26, '2) Either Tom (1) or Peter forgot (2) to take (3) their pen. (4) No error (5)', '1', '2', '3', '4', '1', '2023-12-04 05:56:09'),
(27, 'Brief', 'Partial', 'Short', 'Limited', 'Little', '1', '2023-12-04 05:56:14'),
(28, 'Vent', 'Wet', 'Dent', 'End', 'Opening', '1', '2023-12-04 05:56:19'),
(29, '2) The Himalayas are located ____ the northern frontier of India.', 'along', 'aside', 'in', 'above', '1', '2023-12-04 05:56:25'),
(30, '4) She is sitting ____ a big stone.', 'over', 'on', 'at', 'above', '1', '2023-12-04 05:56:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `answerstable`
--
ALTER TABLE `answerstable`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `apptitude`
--
ALTER TABLE `apptitude`
  ADD PRIMARY KEY (`ap_id`);

--
-- Indexes for table `examdetails`
--
ALTER TABLE `examdetails`
  ADD PRIMARY KEY (`ex_id`);

--
-- Indexes for table `examkey`
--
ALTER TABLE `examkey`
  ADD PRIMARY KEY (`k_id`);

--
-- Indexes for table `reasoning`
--
ALTER TABLE `reasoning`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `tech`
--
ALTER TABLE `tech`
  ADD PRIMARY KEY (`te_id`);

--
-- Indexes for table `technical`
--
ALTER TABLE `technical`
  ADD PRIMARY KEY (`te_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `verbal`
--
ALTER TABLE `verbal`
  ADD PRIMARY KEY (`ve_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `a_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answerstable`
--
ALTER TABLE `answerstable`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `apptitude`
--
ALTER TABLE `apptitude`
  MODIFY `ap_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `examdetails`
--
ALTER TABLE `examdetails`
  MODIFY `ex_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `examkey`
--
ALTER TABLE `examkey`
  MODIFY `k_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `reasoning`
--
ALTER TABLE `reasoning`
  MODIFY `r_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tech`
--
ALTER TABLE `tech`
  MODIFY `te_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `technical`
--
ALTER TABLE `technical`
  MODIFY `te_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `u_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `verbal`
--
ALTER TABLE `verbal`
  MODIFY `ve_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Database: `form`
--
CREATE DATABASE IF NOT EXISTS `form` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `form`;

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `f_ad` varchar(200) NOT NULL,
  `f_dob` varchar(40) NOT NULL,
  `f_status` int(2) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`f_id`, `f_name`, `l_name`, `f_ad`, `f_dob`, `f_status`, `c_d_t`) VALUES
(1, 'Sai Chandra', 'sabbavarapu gfrhtyjkl', 'AKKIREDDY PALEMasdfghjk,', '2024-01-12', 1, '2024-04-16 09:09:31'),
(2, 'pavan', 'kumarss', 'zx', '2024-01-20', 1, '2024-04-16 09:09:18'),
(4, 'pavan', '😂❤️', 'xc', '2024-01-03', 1, '2024-01-22 07:40:09'),
(5, 'sai', 'chandra', 'aaa', '2024-01-12', 1, '2024-01-23 11:05:35'),
(7, 'Anitha', 'Reddi', 'dairy quarters akkireddypalem visakhapatnam', '2024-01-13', 1, '2024-01-23 11:12:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`f_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `fruit_market`
--
CREATE DATABASE IF NOT EXISTS `fruit_market` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fruit_market`;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `c_id` int(11) NOT NULL,
  `f_color` varchar(30) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`c_id`, `f_color`, `status`, `create_date_time`) VALUES
(1, 'Red', 1, '2023-10-10 14:13:14'),
(2, 'Yellow', 1, '2023-10-10 14:14:56'),
(3, 'Green', 1, '2023-10-10 14:17:57'),
(4, 'Black', 1, '2023-10-10 14:19:56'),
(5, 'Orange', 1, '2023-10-10 14:22:19'),
(6, 'Lightgreen', 1, '2023-10-10 14:28:30'),
(7, 'Red', 1, '2024-01-02 13:34:59'),
(8, 'yellow', 1, '2024-01-02 13:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `fruits`
--

CREATE TABLE `fruits` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fruits`
--

INSERT INTO `fruits` (`f_id`, `f_name`, `status`, `create_date_time`) VALUES
(1, 'Apple', 1, '2023-10-10 14:12:48'),
(2, 'Banana', 1, '2023-10-10 14:14:39'),
(3, 'Green apple', 1, '2023-10-10 14:17:46'),
(4, 'Grapes', 1, '2023-10-10 14:19:44'),
(5, 'Orange', 1, '2023-10-10 14:22:01'),
(6, 'Kiwi', 1, '2023-10-10 14:23:20'),
(7, 'Mango', 1, '2023-10-10 14:24:02'),
(8, 'Strawberry', 1, '2023-10-10 14:25:12'),
(9, 'Pineapple', 1, '2023-10-10 14:26:27'),
(10, 'Custardapple', 1, '2023-10-10 14:28:18'),
(11, 'Lemon', 1, '2023-10-10 14:33:06'),
(12, 'dan', 1, '2024-01-02 17:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--
-- Error reading structure for table fruit_market.price: #1932 - Table &#039;fruit_market.price&#039; doesn&#039;t exist in engine
-- Error reading data for table fruit_market.price: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fruit_market`.`price`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `price1`
--

CREATE TABLE `price1` (
  `p_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `ta_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price1`
--

INSERT INTO `price1` (`p_id`, `f_id`, `c_id`, `ta_id`, `t_id`, `price`, `status`, `c_d_t`) VALUES
(1, 1, 1, 1, 1, 20, '1', '2023-10-10 14:29:14'),
(2, 6, 3, 2, 1, 25, '1', '2023-10-10 14:30:22'),
(3, 2, 2, 1, 2, 10, '1', '2023-10-10 14:30:39'),
(4, 10, 6, 3, 1, 30, '1', '2023-10-10 14:30:54'),
(5, 8, 1, 3, 1, 15, '1', '2023-10-10 14:31:16'),
(6, 9, 2, 3, 1, 40, '1', '2023-10-10 14:32:01'),
(7, 5, 5, 1, 0, 13, '1', '2023-10-10 14:32:55'),
(8, 11, 2, 2, 2, 8, '1', '2023-10-10 14:34:39'),
(9, 3, 3, 2, 1, 25, '1', '2023-10-10 14:35:18'),
(10, 4, 4, 3, 1, 20, '1', '2023-10-10 14:35:48'),
(11, 4, 4, 3, 1, 30, '1', '2023-10-10 14:40:24'),
(12, 7, 2, 1, 1, 28, '1', '2023-10-10 14:41:14'),
(13, 1, 1, 3, 1, 35, '1', '2023-10-11 05:45:43'),
(14, 2, 3, 1, 2, 15, '1', '2023-10-11 05:46:09'),
(15, 7, 3, 2, 1, 22, '1', '2023-10-11 05:55:55'),
(16, 4, 3, 3, 1, 45, '1', '2023-10-11 05:56:38'),
(17, 11, 3, 2, 2, 6, '1', '2023-10-11 06:09:57'),
(18, 10, 5, 3, 2, 11, '1', '2024-01-02 13:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `taste`
--

CREATE TABLE `taste` (
  `ta_id` int(11) NOT NULL,
  `f_taste` varchar(30) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taste`
--

INSERT INTO `taste` (`ta_id`, `f_taste`, `status`, `create_date_time`) VALUES
(1, 'Sweet', 1, '2023-10-10 14:17:02'),
(2, 'Sour', 1, '2023-10-10 14:18:06'),
(3, 'Super Sweet', 1, '2023-10-10 14:24:20'),
(4, 'vb', 0, '2024-03-25 05:49:26'),
(5, 'vb', 0, '2024-03-25 05:49:29'),
(6, 'vb', 1, '2024-03-25 05:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `t_id` int(11) NOT NULL,
  `f_type` varchar(30) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`t_id`, `f_type`, `status`, `create_date_time`) VALUES
(1, 'Seasonal', 1, '2023-10-10 14:13:47'),
(2, 'General', 1, '2023-10-10 14:15:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `fruits`
--
ALTER TABLE `fruits`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `price1`
--
ALTER TABLE `price1`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `taste`
--
ALTER TABLE `taste`
  ADD PRIMARY KEY (`ta_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fruits`
--
ALTER TABLE `fruits`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `price1`
--
ALTER TABLE `price1`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `taste`
--
ALTER TABLE `taste`
  MODIFY `ta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `gme`
--
CREATE DATABASE IF NOT EXISTS `gme` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gme`;

-- --------------------------------------------------------

--
-- Table structure for table `gme_data`
--

CREATE TABLE `gme_data` (
  `g_id` int(11) NOT NULL,
  `Employee_name` varchar(255) NOT NULL,
  `CDSID` varchar(255) NOT NULL,
  `FTE _Actual` varchar(255) NOT NULL,
  `Grade` varchar(255) NOT NULL,
  `Region` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `Level_1` varchar(255) NOT NULL,
  `Level_2` varchar(255) NOT NULL,
  `Level_3` varchar(255) NOT NULL,
  `g_status` int(2) NOT NULL DEFAULT 1,
  `C_D_T` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gme_data`
--

INSERT INTO `gme_data` (`g_id`, `Employee_name`, `CDSID`, `FTE _Actual`, `Grade`, `Region`, `Country`, `Level_1`, `Level_2`, `Level_3`, `g_status`, `C_D_T`) VALUES
(1, 'Sai Chandra', 'Sai Chandra', '1', 'LL2', 'North America - (1905)', 'India', 'Global Manufacturing Engineering', 'Global Manufacturing Strategy and Advanced planning', 'MSAP China', 1, '2024-04-16 11:53:30'),
(2, 'Pavan Kumar', 'Pavan Kumar', '1', 'LL5', 'China - (121)', 'India', 'Global Manufacturing Engineering', 'Global Ford Planning Manufacturing Engineering', 'MSAP Europe', 1, '2024-04-16 11:53:45'),
(3, 'Rohith', 'Rohith', '1', 'LL3', 'South America - (52)', 'India', 'Global Manufacturing Engineering', 'Global Vehicle Manufacturing Engineering', 'MSAP IMG', 1, '2024-04-16 11:54:14'),
(4, 'Anitha', 'Anitha', '1', 'LL6', 'Europe', 'India', 'Global Manufacturing Engineering', 'Global Manufacturing Strategy and Advanced Planning', 'NA Body Manufacturing Engineering', 1, '2024-04-16 10:54:35'),
(5, 'Dinesh', 'Dinesh', '1', 'LL4', 'IMG', 'India', 'Global Manufacturing Engineering', 'Global ford Planning Manufacturing Engineering', 'VME China', 1, '2024-04-16 10:55:55'),
(6, 'Jagadesh', 'Jagadesh', '1', 'GSR', '', 'India', 'Global Manufacturing Engineering', 'Global Vehicle Manufacturing Engineering', 'VME Europe', 1, '2024-04-16 11:39:13'),
(7, 'Mohan', 'Mohan', '1', 'Agency', '', 'India', 'Global Manufacturing Engineering', 'Global Manufacturing Strategy and Advanced planning', 'VME IMG', 1, '2024-04-16 13:02:15'),
(8, 'Venky', 'Venky', '1', 'LL3', '', 'India', 'Global Manufacturing Engineering', 'Global ford planning Manufacturing Engineering', 'NA Daint', 1, '2024-04-16 11:39:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gme_data`
--
ALTER TABLE `gme_data`
  ADD PRIMARY KEY (`g_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gme_data`
--
ALTER TABLE `gme_data`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `invoice`
--
CREATE DATABASE IF NOT EXISTS `invoice` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `invoice`;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `c_inno` varchar(50) NOT NULL,
  `c_status` int(2) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`c_id`, `c_name`, `c_inno`, `c_status`, `c_d_t`) VALUES
(1, 'Ford Motors PVT', 'IN-001', 1, '2024-01-04 10:32:08'),
(2, 'BENZ', 'IN-002', 1, '2024-01-04 11:14:33'),
(3, 'Arrow', 'IN-003', 1, '2024-01-04 10:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `invoicetable`
--

CREATE TABLE `invoicetable` (
  `in_id` int(11) NOT NULL,
  `client_name` varchar(30) NOT NULL,
  `in_no` varchar(50) NOT NULL,
  `project_name` varchar(30) NOT NULL,
  `ac_date` varchar(50) NOT NULL,
  `due_date` varchar(50) NOT NULL,
  `in_type` varchar(40) NOT NULL,
  `qty` int(10) NOT NULL,
  `unitprice` int(10) NOT NULL,
  `in_gst` varchar(30) NOT NULL,
  `g_total` varchar(50) NOT NULL,
  `price_words` varchar(70) NOT NULL,
  `in_lb` varchar(50) NOT NULL,
  `note` varchar(70) NOT NULL,
  `in_status` int(2) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoicetable`
--

INSERT INTO `invoicetable` (`in_id`, `client_name`, `in_no`, `project_name`, `ac_date`, `due_date`, `in_type`, `qty`, `unitprice`, `in_gst`, `g_total`, `price_words`, `in_lb`, `note`, `in_status`, `c_d_t`) VALUES
(1, 'FORD', '1256', 'Full stack', '2024-01-04', '2024-01-25', 'GST', 1, 222, '39.96', '261.96', '', ' sc', 'cs', 1, '2024-01-04 11:11:02'),
(2, 'BENZ', 'IN-002', 'Full stack', '2024-01-04', '2024-01-25', 'GST', 2, 1000, '180', '1180', '', 'dc', 'jcc', 1, '2024-01-04 11:32:03'),
(3, 'Ford Motors PVT', 'IN-001', 'Full stack', '2024-01-11', '2024-01-31', 'CGST', 1, 1000, '180', '1180', '', 'gvbn', 'gfn', 1, '2024-01-11 16:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `u_id` int(11) NOT NULL,
  `u_mail` varchar(40) NOT NULL,
  `u_pwd` varchar(40) NOT NULL,
  `STATUS` int(2) NOT NULL DEFAULT 1,
  `C_D_T` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`u_id`, `u_mail`, `u_pwd`, `STATUS`, `C_D_T`) VALUES
(1, 'sai123', '1111', 1, '2024-01-03 11:28:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `invoicetable`
--
ALTER TABLE `invoicetable`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoicetable`
--
ALTER TABLE `invoicetable`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `mail_sender`
--
CREATE DATABASE IF NOT EXISTS `mail_sender` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mail_sender`;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_status` int(2) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `client_name`, `client_status`, `c_d_t`) VALUES
(1, 'Vulcantechs', 1, '2024-04-03 06:27:33'),
(2, 'CY4', 1, '2024-04-03 06:27:42'),
(3, 'Ford', 1, '2024-04-03 17:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `client_names`
--
-- Error reading structure for table mail_sender.client_names: #1932 - Table &#039;mail_sender.client_names&#039; doesn&#039;t exist in engine
-- Error reading data for table mail_sender.client_names: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `mail_sender`.`client_names`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `cy4 mail`
--
-- Error reading structure for table mail_sender.cy4 mail: #1932 - Table &#039;mail_sender.cy4 mail&#039; doesn&#039;t exist in engine
-- Error reading data for table mail_sender.cy4 mail: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `mail_sender`.`cy4 mail`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `cy4_mail`
--
-- Error reading structure for table mail_sender.cy4_mail: #1932 - Table &#039;mail_sender.cy4_mail&#039; doesn&#039;t exist in engine
-- Error reading data for table mail_sender.cy4_mail: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `mail_sender`.`cy4_mail`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `ford`
--

CREATE TABLE `ford` (
  `sno` int(11) NOT NULL,
  `Name` varchar(400) NOT NULL,
  `Mail` varchar(500) NOT NULL,
  `c_status` int(2) NOT NULL DEFAULT 1,
  `C_D_T` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ford`
--

INSERT INTO `ford` (`sno`, `Name`, `Mail`, `c_status`, `C_D_T`) VALUES
(1, 'Sai', 'saichandra2332gmail.com', 1, '2024-04-07 08:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `go_prayan`
--
-- Error reading structure for table mail_sender.go_prayan: #1932 - Table &#039;mail_sender.go_prayan&#039; doesn&#039;t exist in engine
-- Error reading data for table mail_sender.go_prayan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `mail_sender`.`go_prayan`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_pwd` varchar(50) NOT NULL,
  `user_status` int(2) NOT NULL DEFAULT 1,
  `C_D_T` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `user_name`, `user_mail`, `user_pwd`, `user_status`, `C_D_T`) VALUES
(1, 'sai123', 'saichandra2332@gmail.com', '1111', 1, '2024-03-19 05:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL,
  `Company` varchar(255) NOT NULL,
  `mail_body` varchar(14000) NOT NULL,
  `mail_status` int(2) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`mail_id`, `Company`, `mail_body`, `mail_status`, `c_d_t`) VALUES
(1, '1', 'Hello [Client/Partner Name],\r\nI trust this message finds you well. I am excited to introduce an exciting opportunity that could elevate our collaboration and drive success. We\'ve carefully crafted a project proposal that aligns seamlessly with your objectives. It aims to briefly describe the project\'s key goal and benefits.\r\nAttached, you\'ll find the detailed proposal outlining the project\'s scope, timeline, and expected outcomes. I\'d appreciate the chance to discuss this further and explore how this project can be a game-changer for both of us.\r\nLet\'s embark on this journey toward mutual success. Please feel free to reach out to arrange a call or share your thoughts.\r\nWarm regards,\r\n[Your Name]', 1, '2024-04-03 09:33:14'),
(2, '2', 'Dear Hiring Manager\'s Name,\nI am writing to express my interest in the amazing opportunity for the Job Title position at Company Name that was posted on Job Board/Company Website on X Date. I believe that my skills and experience make me a strong candidate for this position within your organization.', 1, '2024-04-03 10:57:01'),
(3, '3', 'sdfghgfdsasdfghjgfsdfgyfdsdf', 1, '2024-04-07 08:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `sss`
--
-- Error reading structure for table mail_sender.sss: #1932 - Table &#039;mail_sender.sss&#039; doesn&#039;t exist in engine
-- Error reading data for table mail_sender.sss: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `mail_sender`.`sss`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--
-- Error reading structure for table mail_sender.templates: #1932 - Table &#039;mail_sender.templates&#039; doesn&#039;t exist in engine
-- Error reading data for table mail_sender.templates: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `mail_sender`.`templates`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `vulcantechs`
--

CREATE TABLE `vulcantechs` (
  `sno` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Mail` varchar(255) DEFAULT NULL,
  `c_status` int(2) NOT NULL DEFAULT 1,
  `c_d_t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vulcantechs`
--

INSERT INTO `vulcantechs` (`sno`, `Name`, `Mail`, `c_status`, `c_d_t`) VALUES
(1, 'Sai Chandra', 'saichandra2332@gmail.com', 1, '2024-03-25 05:59:48'),
(2, 'Pavan Kumar', 'sidagampavankumar@gmail.com', 1, '2024-03-25 05:59:48'),
(3, 'Sai', 'saisabbavarapu2002@gmail.com', 1, '2024-03-26 04:54:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `ford`
--
ALTER TABLE `ford`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mail_id`);

--
-- Indexes for table `vulcantechs`
--
ALTER TABLE `vulcantechs`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ford`
--
ALTER TABLE `ford`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vulcantechs`
--
ALTER TABLE `vulcantechs`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"project\",\"table\":\"admin\"},{\"db\":\"project\",\"table\":\"admin_details\"},{\"db\":\"project\",\"table\":\"user_details\"},{\"db\":\"exam_project\",\"table\":\"admin_details\"},{\"db\":\"exam_project\",\"table\":\"table_name\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-04-26 09:10:44', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"en_GB\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `Task_name` varchar(255) NOT NULL,
  `Deadline` varchar(255) NOT NULL,
  `Add_member` varchar(255) NOT NULL,
  `Grade` varchar(255) NOT NULL,
  `task_details` varchar(255) NOT NULL,
  `a_status` int(2) NOT NULL DEFAULT 1,
  `C_D_T` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `Task_name`, `Deadline`, `Add_member`, `Grade`, `task_details`, `a_status`, `C_D_T`) VALUES
(1, 'Invoice', '2024-04-20', 'Sai', 'medium', 'sdfghnjm,', 1, '2024-04-18 16:49:28');

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `a_id` int(11) NOT NULL,
  `a_username` varchar(255) NOT NULL,
  `a_pwd` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `a_status` varchar(2) NOT NULL DEFAULT '1',
  `C_D_T` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`a_id`, `a_username`, `a_pwd`, `category`, `a_status`, `C_D_T`) VALUES
(1, 'sai', '1111', 'user', '1', '2024-04-18 11:26:54'),
(2, 'Pavan', '1111', 'admin', '1', '2024-04-18 11:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `u_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `U_status` int(2) NOT NULL DEFAULT 1,
  `C_D_T` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`u_id`, `user_name`, `user_pwd`, `U_status`, `C_D_T`) VALUES
(1, 'admin@gmail.com', '1111', 1, '2024-04-18 10:32:59'),
(2, 'users@gmail.com', '1111', 1, '2024-04-18 09:48:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `stock_replenishment`
--
CREATE DATABASE IF NOT EXISTS `stock_replenishment` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `stock_replenishment`;

-- --------------------------------------------------------

--
-- Table structure for table `lines_`
--

CREATE TABLE `lines_` (
  `line_id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `line_name` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lines_`
--

INSERT INTO `lines_` (`line_id`, `plant_id`, `line_name`, `status`) VALUES
(1, 9, 'Line 1', '1'),
(2, 9, 'Line 2', '1'),
(3, 11, 'Line 1', '1'),
(4, 9, 'Line 3', '1'),
(5, 10, 'Line 1', '1'),
(6, 11, 'Line 2', '1'),
(7, 10, 'Line 2', '1'),
(8, 9, 'Line 4', '1'),
(9, 9, 'Line 5', '1'),
(10, 17, 'Line 1', '1'),
(11, 18, 'Line 1', '1'),
(12, 18, 'Line 2', '1'),
(13, 19, 'Line 1', '1'),
(14, 19, 'Line 2', '1'),
(15, 9, 'Line 6', '1'),
(16, 20, 'Line 1', '1'),
(17, 20, 'Line 2', '1'),
(18, 22, 'Line 1', '1'),
(19, 22, 'Line 2', '1'),
(20, 23, '777', '1'),
(21, 24, 'Line 1', '1'),
(22, 26, 'Line 1', '1'),
(23, 35, 'line 1', '1'),
(24, 24, 'Line 2', '1'),
(26, 38, 'line 1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `machine_id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `machine_number` varchar(50) NOT NULL,
  `part_number` varchar(100) NOT NULL DEFAULT '2W000000000000259',
  `part_name` varchar(50) NOT NULL DEFAULT 'O Ring-027',
  `machine_hexnumber` varchar(30) NOT NULL,
  `machine_status` varchar(30) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`machine_id`, `plant_id`, `line_id`, `machine_number`, `part_number`, `part_name`, `machine_hexnumber`, `machine_status`, `status`) VALUES
(1, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(2, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(3, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(4, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(5, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(6, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(7, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(8, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(9, 11, 6, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(10, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(11, 10, 5, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(12, 10, 5, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(13, 10, 5, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(14, 10, 5, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(15, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(16, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(17, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(18, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(19, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(20, 10, 7, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(21, 10, 7, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(22, 10, 7, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(23, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(24, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(25, 11, 6, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(26, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(27, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(28, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(29, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(30, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(31, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(32, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(33, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(34, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(35, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(36, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(37, 9, 8, 'CM 01 (250T)777', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(38, 10, 5, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(39, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(40, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(41, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(42, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(43, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(44, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(45, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(46, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(47, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(48, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(49, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(50, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(51, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(52, 9, 8, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(53, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(54, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(55, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(56, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(57, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(58, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(59, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(60, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(61, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(62, 17, 10, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(63, 17, 10, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(64, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(65, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(66, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(67, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(68, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(69, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(70, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(71, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(72, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(73, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(74, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(75, 18, 11, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(76, 19, 13, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#EF2B2B8C', 'EMPTY', '1'),
(77, 19, 13, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#EF2B2B8C', 'EMPTY', '1'),
(78, 19, 13, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#EF2B2B8C', 'EMPTY', '1'),
(79, 19, 14, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#EF2B2B8C', 'EMPTY', '1'),
(80, 19, 14, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#EF2B2B8C', 'EMPTY', '1'),
(81, 19, 13, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#EF2B2B8C', 'EMPTY', '1'),
(82, 19, 13, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#EF2B2B8C', 'EMPTY', '1'),
(83, 11, 6, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(84, 11, 6, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(85, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(86, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(87, 20, 17, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(88, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(89, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(90, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(91, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(92, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(93, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(94, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(95, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(96, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(97, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(98, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(99, 20, 16, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#d7ec6f', 'HOLD', '1'),
(100, 22, 18, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(101, 22, 18, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(102, 22, 18, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(103, 22, 18, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(104, 22, 18, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(105, 22, 18, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(106, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(107, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(108, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(109, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(110, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(111, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(112, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(113, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(114, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(115, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(116, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(117, 22, 19, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'LOADED', '1'),
(118, 23, 20, '77777', '2W000000000000259', 'O Ring-027', '#955b5b', 'HOLD', '1'),
(119, 23, 20, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#955b5b', 'HOLD', '1'),
(120, 23, 20, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#955b5b', 'HOLD', '1'),
(121, 23, 20, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#955b5b', 'HOLD', '1'),
(122, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(123, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(124, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(125, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(126, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(127, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(128, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(129, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(130, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(131, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(132, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(133, 24, 21, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#FAFF7E8C', 'HOLD', '1'),
(134, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(135, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(136, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(137, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(138, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(139, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(140, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(141, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(142, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(143, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(144, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(145, 9, 15, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(146, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(147, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(148, 9, 4, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(149, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(150, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(151, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(152, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(153, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(154, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(155, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(156, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(157, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(158, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(159, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(160, 9, 9, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(161, 0, 0, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '', '', '1'),
(162, 0, 0, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '', '', '1'),
(163, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(164, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(165, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(166, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(167, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(168, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(169, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(170, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(171, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(172, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(173, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(174, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(175, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(176, 11, 3, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(177, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(178, 10, 5, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(179, 10, 5, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(180, 9, 2, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(181, 11, 6, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '0'),
(182, 11, 6, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(183, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(184, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(185, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(186, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(187, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(188, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(189, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(190, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(191, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(192, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(193, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '1'),
(194, 26, 22, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#8c4545', 'HOLD', '0'),
(195, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(196, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(197, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(198, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(199, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(200, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(201, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(202, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(203, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(204, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(205, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(206, 35, 23, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#4b2020', 'LOADED', '1'),
(207, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(208, 9, 1, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(209, 10, 7, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#3BFC2E66', 'LOADED', '1'),
(210, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(211, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(212, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(213, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(214, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(215, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(216, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(217, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(218, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(219, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1'),
(220, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '0'),
(221, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '0'),
(222, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '0'),
(223, 38, 26, 'CM 01 (250T)', '2W000000000000259', 'O Ring-027', '#5eb083', 'HOLD', '1');

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `plant_id` int(11) NOT NULL,
  `plant_name` varchar(100) NOT NULL,
  `plant_status` varchar(30) NOT NULL,
  `hex_number` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `modify_date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`plant_id`, `plant_name`, `plant_status`, `hex_number`, `status`, `created_by`, `modified_by`, `created_date_time`, `modify_date_time`) VALUES
(9, 'RPL/CHE/PROD', 'LOADED', '#3BFC2E66', '1', 0, 0, '0000-00-00 00:00:00', '2023-12-25 08:14:28'),
(10, 'RPL/CHE/PROD 1', 'LOADED', '#3BFC2E66', '1', 0, 0, '0000-00-00 00:00:00', '2023-12-25 08:14:46'),
(11, 'RPL/CHE/PROD 2', 'LOADED', '#3BFC2E66', '1', 0, 0, '0000-00-00 00:00:00', '2023-12-25 08:14:52'),
(24, 'RPL/CHE/PROD 3', 'HOLD', '#FAFF7E8C', '1', 0, 0, '0000-00-00 00:00:00', '2023-12-27 13:28:21'),
(34, 'pabaa', 'HOLD', '#0d0a24', '0', 0, 0, '0000-00-00 00:00:00', '2023-12-29 07:24:13'),
(35, 'plant 1', 'LOADED', '#4b2020', '0', 0, 0, '0000-00-00 00:00:00', '2023-12-29 10:05:28'),
(36, 'pabaa', 'EMPTY', '#5f246a', '0', 0, 0, '0000-00-00 00:00:00', '2023-12-29 10:06:38'),
(37, 'pabaa', 'LOADED', '#8fee7c', '0', 0, 0, '0000-00-00 00:00:00', '2023-12-29 12:12:38'),
(38, 'plant 1', 'HOLD', '#5eb083', '0', 0, 0, '0000-00-00 00:00:00', '2023-12-31 05:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `plant_status`
--

CREATE TABLE `plant_status` (
  `plant_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `hex_number` varchar(30) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `modify_date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plant_status`
--

INSERT INTO `plant_status` (`plant_status_id`, `status_name`, `hex_number`, `status`, `modify_date_time`) VALUES
(1, 'LOADED', '#8fee7c', '1', '2023-12-29 12:12:38'),
(2, 'HOLD', '#5eb083', '1', '2023-12-31 05:10:01'),
(3, 'EMPTY', '#5f246a', '1', '2023-12-29 10:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `dashboard_access` enum('0','1') NOT NULL DEFAULT '0',
  `line_access` enum('0','1') NOT NULL DEFAULT '0',
  `machine_access` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `plant_id`, `dashboard_access`, `line_access`, `machine_access`, `status`) VALUES
(4, 'Mixing Manager', 9, '0', '0', '1', '1'),
(5, 'Line Manager', 9, '0', '0', '0', '1'),
(6, 'Branch Manager', 10, '0', '0', '0', '1'),
(7, 'Mixing Manager', 11, '0', '0', '0', '1'),
(12, 'Branch Manager', 17, '0', '0', '0', '1'),
(13, 'Mixing Manager', 18, '0', '0', '0', '1'),
(14, 'Civil Engineer', 20, '0', '0', '0', '1'),
(15, 'Mixing Manager', 22, '0', '0', '0', '1'),
(16, 'Branch Manager', 22, '0', '0', '0', '1'),
(17, 'Branch Managerr', 26, '0', '0', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_status` varchar(30) NOT NULL DEFAULT 'Active',
  `plant_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `user_role` enum('u','sa') NOT NULL DEFAULT 'u',
  `dashboard_access` enum('0','1') NOT NULL DEFAULT '0',
  `line_access` enum('0','1') NOT NULL DEFAULT '0',
  `machine_access` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `user_status`, `plant_id`, `role_id`, `otp`, `user_role`, `dashboard_access`, `line_access`, `machine_access`, `status`) VALUES
(1, 'SaiChandra', 'saichandra2332@gmail.com', '1111', 'Active', 0, 0, 320285, 'sa', '1', '1', '1', '1'),
(2, 'pavani', 'pavani@gmail.com', 'Pavani@2002', 'Active', 9, 4, 0, 'u', '0', '0', '1', '1'),
(3, 'Ali', 'Ali@gmail.com', 'Ali', 'Active', 20, 14, 0, 'u', '0', '0', '0', '1'),
(4, 'Ali', 'Ali@gmail.com', 'Ali', 'Active', 22, 15, 0, 'u', '0', '0', '0', '1'),
(5, 'Ali', 'ali@gmail.com', 'Ali', 'Active', 9, 4, 0, 'u', '0', '0', '1', '1'),
(6, 'Dinesh', 'dinesh@gmail.com', 'Dinesh', 'Active', 10, 6, 0, 'u', '0', '0', '0', '1'),
(7, 'Mohan', 'mohan@gmail.com', 'Mohan', 'Active', 26, 17, 0, 'u', '0', '0', '0', '1'),
(8, 'Jagadesh', 'jagadesh@gmail.com', 'aaa', 'Active', 38, 18, 0, 'u', '0', '0', '0', '0'),
(9, 'Sai Chandra', 'saichandra2332@gmail.com', '2222', 'Active', 9, 4, 320285, 'u', '0', '0', '0', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lines_`
--
ALTER TABLE `lines_`
  ADD PRIMARY KEY (`line_id`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`machine_id`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`plant_id`);

--
-- Indexes for table `plant_status`
--
ALTER TABLE `plant_status`
  ADD PRIMARY KEY (`plant_status_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lines_`
--
ALTER TABLE `lines_`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `machine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `plants`
--
ALTER TABLE `plants`
  MODIFY `plant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `plant_status`
--
ALTER TABLE `plant_status`
  MODIFY `plant_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `student_details`
--
CREATE DATABASE IF NOT EXISTS `student_details` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `student_details`;

-- --------------------------------------------------------

--
-- Table structure for table `student_information`
--

CREATE TABLE `student_information` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `m_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `class` int(2) DEFAULT NULL,
  `marks` int(3) DEFAULT NULL,
  `contact` bigint(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_information`
--

INSERT INTO `student_information` (`f_id`, `f_name`, `m_name`, `l_name`, `age`, `gender`, `class`, `marks`, `contact`, `email`, `status`, `date_time`, `create_date_time`) VALUES
(2, 'sai', 'chandra', 'sabbavarapu', 22, 'm', 3, 99, 7386606346, 'saichandra2332@gmail', 1, '2023-10-03 00:00:00', '2023-10-03 06:30:51'),
(3, 'sai', 'chandra', 'sabbavarapu', 22, 'm', 3, 99, 7386606346, 'saichandra2332@gmail', 1, '2002-05-10 05:10:00', '2023-10-03 06:35:22'),
(4, 'sravanthi', '-', 'pyla', 18, 'f', 1, 98, 7036612349, 'pylalohiths2332@gmai', 1, '2023-10-18 13:16:00', '2023-10-03 07:43:07'),
(5, 'pavan', 'kumar', 'sabbavrapu', 24, 'm', 5, 97, 9398439892, 'pavankumar@gmail.com', 1, '2023-10-01 17:18:00', '2023-10-03 11:45:13'),
(6, 'demudu', '-', 'sabbavarapu', 49, 'm', 12, 99, 9949646346, 'sdemudu2332@gmail.co', 1, '2023-10-10 20:27:00', '2023-10-04 14:57:38'),
(7, 'devi', '-', 'sabbavarapu', 45, 'f', 10, 96, 9160498404, 'sdevijsds@gmail.com', 0, '2023-10-02 20:28:00', '2023-10-04 14:58:26'),
(8, 'yami', 'sri', '-', 19, 'f', 10, 88, 6544778897, 'yami27@gmail.com', 1, '2023-10-13 12:04:00', '2023-10-18 06:34:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student_information`
--
ALTER TABLE `student_information`
  ADD PRIMARY KEY (`f_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student_information`
--
ALTER TABLE `student_information`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
