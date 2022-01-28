-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2021 at 01:27 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hutmetro_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tab_gift`
--

CREATE TABLE `tab_gift` (
  `gift_id` int(11) NOT NULL,
  `gift_name` varchar(255) NOT NULL,
  `gift_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tab_gift`
--

INSERT INTO `tab_gift` (`gift_id`, `gift_name`, `gift_file`) VALUES
(1, 'HADIAH 1', ''),
(2, 'HADIAH 2', ''),
(3, 'HADIAH 3', ''),
(4, 'HADIAH 4', ''),
(5, 'HADIAH 5', '');

-- --------------------------------------------------------

--
-- Table structure for table `tab_participants`
--

CREATE TABLE `tab_participants` (
  `participant_id` int(11) NOT NULL,
  `participant_name` varchar(255) NOT NULL,
  `participant_email` varchar(255) NOT NULL,
  `participant_wa` varchar(255) NOT NULL,
  `participant_birth_place` varchar(255) NOT NULL,
  `participant_birth_date` date NOT NULL,
  `participant_gender` int(11) NOT NULL,
  `participant_nip` varchar(255) NOT NULL,
  `participant_nik` varchar(255) NOT NULL,
  `participant_addr` text NOT NULL,
  `participant_unit_bisnis` varchar(255) NOT NULL,
  `participant_divisi` varchar(255) NOT NULL,
  `participant_department` varchar(255) NOT NULL,
  `participant_keberangkatan` int(11) NOT NULL,
  `participant_qr` varchar(255) NOT NULL,
  `addon` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tab_user`
--

CREATE TABLE `tab_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tab_user`
--

INSERT INTO `tab_user` (`user_id`, `user_name`, `user_pass`) VALUES
(1, 'admin', 'd54e5ae10222d681124b795096598b65');

-- --------------------------------------------------------

--
-- Table structure for table `tr_grandprize`
--

CREATE TABLE `tr_grandprize` (
  `grandprize_id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `gift_id` int(11) NOT NULL,
  `addon` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tr_registration`
--

CREATE TABLE `tr_registration` (
  `registration_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `is_antigen` int(11) NOT NULL,
  `antigen_datetime` datetime DEFAULT NULL,
  `is_verify` int(11) NOT NULL,
  `verify_datetime` datetime DEFAULT NULL,
  `is_taken_doorprize` int(11) NOT NULL,
  `taken_doorprize_datetime` datetime DEFAULT NULL,
  `addon` datetime NOT NULL,
  `modion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_allow_grandprize`
-- (See below for the actual view)
--
CREATE TABLE `view_allow_grandprize` (
`registration_id` int(11)
,`participant_id` int(11)
,`is_antigen` int(11)
,`antigen_datetime` datetime
,`is_verify` int(11)
,`verify_datetime` datetime
,`is_taken_doorprize` int(11)
,`taken_doorprize_datetime` datetime
,`addon` datetime
,`modion` datetime
,`participant_name` varchar(255)
,`participant_email` varchar(255)
,`participant_wa` varchar(255)
,`participant_birth_place` varchar(255)
,`participant_birth_date` date
,`participant_gender` int(11)
,`participant_nip` varchar(255)
,`participant_nik` varchar(255)
,`participant_addr` text
,`participant_unit_bisnis` varchar(255)
,`participant_divisi` varchar(255)
,`participant_department` varchar(255)
,`participant_keberangkatan` int(11)
,`participant_qr` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_participants`
-- (See below for the actual view)
--
CREATE TABLE `view_participants` (
`participant_id` int(11)
,`participant_name` varchar(255)
,`participant_email` varchar(255)
,`participant_wa` varchar(255)
,`participant_birth_place` varchar(255)
,`participant_birth_date` date
,`participant_gender` int(11)
,`participant_nip` varchar(255)
,`participant_nik` varchar(255)
,`participant_addr` text
,`participant_unit_bisnis` varchar(255)
,`participant_divisi` varchar(255)
,`participant_department` varchar(255)
,`participant_keberangkatan` int(11)
,`participant_qr` varchar(255)
,`addon` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_registration`
-- (See below for the actual view)
--
CREATE TABLE `view_registration` (
`registration_id` int(11)
,`participant_id` int(11)
,`is_antigen` int(11)
,`antigen_datetime` datetime
,`is_verify` int(11)
,`verify_datetime` datetime
,`is_taken_doorprize` int(11)
,`taken_doorprize_datetime` datetime
,`addon` datetime
,`modion` datetime
,`participant_name` varchar(255)
,`participant_email` varchar(255)
,`participant_wa` varchar(255)
,`participant_birth_place` varchar(255)
,`participant_birth_date` date
,`participant_gender` int(11)
,`participant_nip` varchar(255)
,`participant_nik` varchar(255)
,`participant_addr` text
,`participant_unit_bisnis` varchar(255)
,`participant_divisi` varchar(255)
,`participant_department` varchar(255)
,`participant_keberangkatan` int(11)
,`participant_qr` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_report_antigen`
-- (See below for the actual view)
--
CREATE TABLE `view_report_antigen` (
`registration_id` int(11)
,`participant_id` int(11)
,`is_antigen` int(11)
,`antigen_datetime` datetime
,`is_verify` int(11)
,`verify_datetime` datetime
,`is_taken_doorprize` int(11)
,`taken_doorprize_datetime` datetime
,`addon` datetime
,`modion` datetime
,`participant_name` varchar(255)
,`participant_email` varchar(255)
,`participant_wa` varchar(255)
,`participant_birth_place` varchar(255)
,`participant_birth_date` date
,`participant_gender` int(11)
,`participant_nip` varchar(255)
,`participant_nik` varchar(255)
,`participant_addr` text
,`participant_unit_bisnis` varchar(255)
,`participant_divisi` varchar(255)
,`participant_department` varchar(255)
,`participant_keberangkatan` int(11)
,`participant_qr` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_report_attendance`
-- (See below for the actual view)
--
CREATE TABLE `view_report_attendance` (
`registration_id` int(11)
,`participant_id` int(11)
,`is_antigen` int(11)
,`antigen_datetime` datetime
,`is_verify` int(11)
,`verify_datetime` datetime
,`is_taken_doorprize` int(11)
,`taken_doorprize_datetime` datetime
,`addon` datetime
,`modion` datetime
,`participant_name` varchar(255)
,`participant_email` varchar(255)
,`participant_wa` varchar(255)
,`participant_birth_place` varchar(255)
,`participant_birth_date` date
,`participant_gender` int(11)
,`participant_nip` varchar(255)
,`participant_nik` varchar(255)
,`participant_addr` text
,`participant_unit_bisnis` varchar(255)
,`participant_divisi` varchar(255)
,`participant_department` varchar(255)
,`participant_keberangkatan` int(11)
,`participant_qr` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_report_doorprize`
-- (See below for the actual view)
--
CREATE TABLE `view_report_doorprize` (
`registration_id` int(11)
,`participant_id` int(11)
,`is_antigen` int(11)
,`antigen_datetime` datetime
,`is_verify` int(11)
,`verify_datetime` datetime
,`is_taken_doorprize` int(11)
,`taken_doorprize_datetime` datetime
,`addon` datetime
,`modion` datetime
,`participant_name` varchar(255)
,`participant_email` varchar(255)
,`participant_wa` varchar(255)
,`participant_birth_place` varchar(255)
,`participant_birth_date` date
,`participant_gender` int(11)
,`participant_nip` varchar(255)
,`participant_nik` varchar(255)
,`participant_addr` text
,`participant_unit_bisnis` varchar(255)
,`participant_divisi` varchar(255)
,`participant_department` varchar(255)
,`participant_keberangkatan` int(11)
,`participant_qr` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_report_grandprize`
-- (See below for the actual view)
--
CREATE TABLE `view_report_grandprize` (
`grandprize_id` int(11)
,`registration_id` int(11)
,`gift_id` int(11)
,`addon` datetime
,`participant_id` int(11)
,`is_antigen` int(11)
,`antigen_datetime` datetime
,`is_verify` int(11)
,`verify_datetime` datetime
,`is_taken_doorprize` int(11)
,`taken_doorprize_datetime` datetime
,`gift_name` varchar(255)
,`gift_file` varchar(255)
,`participant_name` varchar(255)
,`participant_email` varchar(255)
,`participant_wa` varchar(255)
,`participant_birth_place` varchar(255)
,`participant_birth_date` date
,`participant_gender` int(11)
,`participant_nip` varchar(255)
,`participant_nik` varchar(255)
,`participant_addr` text
,`participant_unit_bisnis` varchar(255)
,`participant_divisi` varchar(255)
,`participant_department` varchar(255)
,`participant_keberangkatan` int(11)
,`participant_qr` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `view_allow_grandprize`
--
DROP TABLE IF EXISTS `view_allow_grandprize`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_allow_grandprize`  AS SELECT `a`.`registration_id` AS `registration_id`, `a`.`participant_id` AS `participant_id`, `a`.`is_antigen` AS `is_antigen`, `a`.`antigen_datetime` AS `antigen_datetime`, `a`.`is_verify` AS `is_verify`, `a`.`verify_datetime` AS `verify_datetime`, `a`.`is_taken_doorprize` AS `is_taken_doorprize`, `a`.`taken_doorprize_datetime` AS `taken_doorprize_datetime`, `a`.`addon` AS `addon`, `a`.`modion` AS `modion`, `b`.`participant_name` AS `participant_name`, `b`.`participant_email` AS `participant_email`, `b`.`participant_wa` AS `participant_wa`, `b`.`participant_birth_place` AS `participant_birth_place`, `b`.`participant_birth_date` AS `participant_birth_date`, `b`.`participant_gender` AS `participant_gender`, `b`.`participant_nip` AS `participant_nip`, `b`.`participant_nik` AS `participant_nik`, `b`.`participant_addr` AS `participant_addr`, `b`.`participant_unit_bisnis` AS `participant_unit_bisnis`, `b`.`participant_divisi` AS `participant_divisi`, `b`.`participant_department` AS `participant_department`, `b`.`participant_keberangkatan` AS `participant_keberangkatan`, `b`.`participant_qr` AS `participant_qr` FROM (`tr_registration` `a` left join `tab_participants` `b` on(`a`.`participant_id` = `b`.`participant_id`)) WHERE `a`.`is_antigen` = 1 AND `a`.`is_verify` = 1 AND !(`a`.`registration_id` in (select `tr_grandprize`.`registration_id` from `tr_grandprize`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_participants`
--
DROP TABLE IF EXISTS `view_participants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_participants`  AS SELECT `tab_participants`.`participant_id` AS `participant_id`, `tab_participants`.`participant_name` AS `participant_name`, `tab_participants`.`participant_email` AS `participant_email`, `tab_participants`.`participant_wa` AS `participant_wa`, `tab_participants`.`participant_birth_place` AS `participant_birth_place`, `tab_participants`.`participant_birth_date` AS `participant_birth_date`, `tab_participants`.`participant_gender` AS `participant_gender`, `tab_participants`.`participant_nip` AS `participant_nip`, `tab_participants`.`participant_nik` AS `participant_nik`, `tab_participants`.`participant_addr` AS `participant_addr`, `tab_participants`.`participant_unit_bisnis` AS `participant_unit_bisnis`, `tab_participants`.`participant_divisi` AS `participant_divisi`, `tab_participants`.`participant_department` AS `participant_department`, `tab_participants`.`participant_keberangkatan` AS `participant_keberangkatan`, `tab_participants`.`participant_qr` AS `participant_qr`, `tab_participants`.`addon` AS `addon` FROM `tab_participants` ;

-- --------------------------------------------------------

--
-- Structure for view `view_registration`
--
DROP TABLE IF EXISTS `view_registration`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_registration`  AS SELECT `a`.`registration_id` AS `registration_id`, `a`.`participant_id` AS `participant_id`, `a`.`is_antigen` AS `is_antigen`, `a`.`antigen_datetime` AS `antigen_datetime`, `a`.`is_verify` AS `is_verify`, `a`.`verify_datetime` AS `verify_datetime`, `a`.`is_taken_doorprize` AS `is_taken_doorprize`, `a`.`taken_doorprize_datetime` AS `taken_doorprize_datetime`, `a`.`addon` AS `addon`, `a`.`modion` AS `modion`, `b`.`participant_name` AS `participant_name`, `b`.`participant_email` AS `participant_email`, `b`.`participant_wa` AS `participant_wa`, `b`.`participant_birth_place` AS `participant_birth_place`, `b`.`participant_birth_date` AS `participant_birth_date`, `b`.`participant_gender` AS `participant_gender`, `b`.`participant_nip` AS `participant_nip`, `b`.`participant_nik` AS `participant_nik`, `b`.`participant_addr` AS `participant_addr`, `b`.`participant_unit_bisnis` AS `participant_unit_bisnis`, `b`.`participant_divisi` AS `participant_divisi`, `b`.`participant_department` AS `participant_department`, `b`.`participant_keberangkatan` AS `participant_keberangkatan`, `b`.`participant_qr` AS `participant_qr` FROM (`tr_registration` `a` left join `tab_participants` `b` on(`a`.`participant_id` = `b`.`participant_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_report_antigen`
--
DROP TABLE IF EXISTS `view_report_antigen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_report_antigen`  AS SELECT `a`.`registration_id` AS `registration_id`, `a`.`participant_id` AS `participant_id`, `a`.`is_antigen` AS `is_antigen`, `a`.`antigen_datetime` AS `antigen_datetime`, `a`.`is_verify` AS `is_verify`, `a`.`verify_datetime` AS `verify_datetime`, `a`.`is_taken_doorprize` AS `is_taken_doorprize`, `a`.`taken_doorprize_datetime` AS `taken_doorprize_datetime`, `a`.`addon` AS `addon`, `a`.`modion` AS `modion`, `b`.`participant_name` AS `participant_name`, `b`.`participant_email` AS `participant_email`, `b`.`participant_wa` AS `participant_wa`, `b`.`participant_birth_place` AS `participant_birth_place`, `b`.`participant_birth_date` AS `participant_birth_date`, `b`.`participant_gender` AS `participant_gender`, `b`.`participant_nip` AS `participant_nip`, `b`.`participant_nik` AS `participant_nik`, `b`.`participant_addr` AS `participant_addr`, `b`.`participant_unit_bisnis` AS `participant_unit_bisnis`, `b`.`participant_divisi` AS `participant_divisi`, `b`.`participant_department` AS `participant_department`, `b`.`participant_keberangkatan` AS `participant_keberangkatan`, `b`.`participant_qr` AS `participant_qr` FROM (`tr_registration` `a` left join `tab_participants` `b` on(`a`.`participant_id` = `b`.`participant_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_report_attendance`
--
DROP TABLE IF EXISTS `view_report_attendance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_report_attendance`  AS SELECT `a`.`registration_id` AS `registration_id`, `a`.`participant_id` AS `participant_id`, `a`.`is_antigen` AS `is_antigen`, `a`.`antigen_datetime` AS `antigen_datetime`, `a`.`is_verify` AS `is_verify`, `a`.`verify_datetime` AS `verify_datetime`, `a`.`is_taken_doorprize` AS `is_taken_doorprize`, `a`.`taken_doorprize_datetime` AS `taken_doorprize_datetime`, `a`.`addon` AS `addon`, `a`.`modion` AS `modion`, `b`.`participant_name` AS `participant_name`, `b`.`participant_email` AS `participant_email`, `b`.`participant_wa` AS `participant_wa`, `b`.`participant_birth_place` AS `participant_birth_place`, `b`.`participant_birth_date` AS `participant_birth_date`, `b`.`participant_gender` AS `participant_gender`, `b`.`participant_nip` AS `participant_nip`, `b`.`participant_nik` AS `participant_nik`, `b`.`participant_addr` AS `participant_addr`, `b`.`participant_unit_bisnis` AS `participant_unit_bisnis`, `b`.`participant_divisi` AS `participant_divisi`, `b`.`participant_department` AS `participant_department`, `b`.`participant_keberangkatan` AS `participant_keberangkatan`, `b`.`participant_qr` AS `participant_qr` FROM (`tr_registration` `a` left join `tab_participants` `b` on(`a`.`participant_id` = `b`.`participant_id`)) WHERE `a`.`is_antigen` <> 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_report_doorprize`
--
DROP TABLE IF EXISTS `view_report_doorprize`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_report_doorprize`  AS SELECT `a`.`registration_id` AS `registration_id`, `a`.`participant_id` AS `participant_id`, `a`.`is_antigen` AS `is_antigen`, `a`.`antigen_datetime` AS `antigen_datetime`, `a`.`is_verify` AS `is_verify`, `a`.`verify_datetime` AS `verify_datetime`, `a`.`is_taken_doorprize` AS `is_taken_doorprize`, `a`.`taken_doorprize_datetime` AS `taken_doorprize_datetime`, `a`.`addon` AS `addon`, `a`.`modion` AS `modion`, `b`.`participant_name` AS `participant_name`, `b`.`participant_email` AS `participant_email`, `b`.`participant_wa` AS `participant_wa`, `b`.`participant_birth_place` AS `participant_birth_place`, `b`.`participant_birth_date` AS `participant_birth_date`, `b`.`participant_gender` AS `participant_gender`, `b`.`participant_nip` AS `participant_nip`, `b`.`participant_nik` AS `participant_nik`, `b`.`participant_addr` AS `participant_addr`, `b`.`participant_unit_bisnis` AS `participant_unit_bisnis`, `b`.`participant_divisi` AS `participant_divisi`, `b`.`participant_department` AS `participant_department`, `b`.`participant_keberangkatan` AS `participant_keberangkatan`, `b`.`participant_qr` AS `participant_qr` FROM (`tr_registration` `a` left join `tab_participants` `b` on(`a`.`participant_id` = `b`.`participant_id`)) WHERE `a`.`is_antigen` <> 0 AND `a`.`is_verify` <> 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_report_grandprize`
--
DROP TABLE IF EXISTS `view_report_grandprize`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_report_grandprize`  AS SELECT `a`.`grandprize_id` AS `grandprize_id`, `a`.`registration_id` AS `registration_id`, `a`.`gift_id` AS `gift_id`, `a`.`addon` AS `addon`, `b`.`participant_id` AS `participant_id`, `b`.`is_antigen` AS `is_antigen`, `b`.`antigen_datetime` AS `antigen_datetime`, `b`.`is_verify` AS `is_verify`, `b`.`verify_datetime` AS `verify_datetime`, `b`.`is_taken_doorprize` AS `is_taken_doorprize`, `b`.`taken_doorprize_datetime` AS `taken_doorprize_datetime`, `c`.`gift_name` AS `gift_name`, `c`.`gift_file` AS `gift_file`, `d`.`participant_name` AS `participant_name`, `d`.`participant_email` AS `participant_email`, `d`.`participant_wa` AS `participant_wa`, `d`.`participant_birth_place` AS `participant_birth_place`, `d`.`participant_birth_date` AS `participant_birth_date`, `d`.`participant_gender` AS `participant_gender`, `d`.`participant_nip` AS `participant_nip`, `d`.`participant_nik` AS `participant_nik`, `d`.`participant_addr` AS `participant_addr`, `d`.`participant_unit_bisnis` AS `participant_unit_bisnis`, `d`.`participant_divisi` AS `participant_divisi`, `d`.`participant_department` AS `participant_department`, `d`.`participant_keberangkatan` AS `participant_keberangkatan`, `d`.`participant_qr` AS `participant_qr` FROM (((`tr_grandprize` `a` left join `tr_registration` `b` on(`a`.`registration_id` = `b`.`registration_id`)) left join `tab_gift` `c` on(`a`.`gift_id` = `c`.`gift_id`)) left join `tab_participants` `d` on(`b`.`participant_id` = `d`.`participant_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tab_gift`
--
ALTER TABLE `tab_gift`
  ADD PRIMARY KEY (`gift_id`);

--
-- Indexes for table `tab_participants`
--
ALTER TABLE `tab_participants`
  ADD PRIMARY KEY (`participant_id`);

--
-- Indexes for table `tab_user`
--
ALTER TABLE `tab_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tr_grandprize`
--
ALTER TABLE `tr_grandprize`
  ADD PRIMARY KEY (`grandprize_id`);

--
-- Indexes for table `tr_registration`
--
ALTER TABLE `tr_registration`
  ADD PRIMARY KEY (`registration_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tab_gift`
--
ALTER TABLE `tab_gift`
  MODIFY `gift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tab_participants`
--
ALTER TABLE `tab_participants`
  MODIFY `participant_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tab_user`
--
ALTER TABLE `tab_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tr_grandprize`
--
ALTER TABLE `tr_grandprize`
  MODIFY `grandprize_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_registration`
--
ALTER TABLE `tr_registration`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
