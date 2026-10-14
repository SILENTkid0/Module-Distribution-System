-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2026 at 06:43 PM
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
-- Database: `moduledistributionsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(8) NOT NULL,
  `admin_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_pass`) VALUES
(1, 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `module_id` varchar(20) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `subject_code` varchar(30) NOT NULL,
  `year_level` tinyint(4) NOT NULL DEFAULT 1,
  `semester` tinyint(4) NOT NULL DEFAULT 1,
  `available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_id`, `module_name`, `subject_code`, `year_level`, `semester`, `available`) VALUES
('ART 002', 'Art Appreciation', 'ART 002', 1, 2, 1),
('GEN 005', 'The Contemporary World', 'GEN 005', 2, 1, 1),
('GEN 008', 'Living in the IT Era', 'GEN 008', 1, 1, 1),
('ITE 031', 'Data Structures and Algorithms', 'ITE 031', 2, 1, 1),
('ITE 048', 'Discrete Structures', 'ITE 048', 2, 2, 1),
('ITE 083', 'IT Project Management', 'ITE 083', 2, 1, 1),
('ITE 186', 'Computer Programming 2', 'ITE 186', 1, 2, 1),
('ITE 260', 'Computer Programming 1', 'ITE 260', 1, 1, 1),
('ITE 292', 'Networking 1', 'ITE 292', 2, 1, 1),
('ITE 298', 'Information Management (including Fundamentals of Database)', 'ITE 298', 2, 1, 1),
('ITE 300', 'Object-Oriented Programming (OOP)', 'ITE 300', 2, 1, 1),
('ITE 302', 'Information Assurance Security 1', 'ITE 302', 3, 1, 1),
('ITE 310', 'Capstone Project', 'ITE 310', 4, 1, 1),
('ITE 314', 'Advanced Database', 'ITE 314', 3, 1, 1),
('ITE 359', 'Networking 2', 'ITE 359', 3, 1, 1),
('ITE 366', 'Introduction to Computing', 'ITE 366', 1, 1, 1),
('ITE 367', 'Managing IT Resources', 'ITE 367', 4, 1, 1),
('ITE 399', 'Human Computer Interaction', 'ITE 399', 3, 2, 1),
('NST 022', 'National Service Training Program 2', 'NST 022', 1, 2, 1),
('PED 031', 'Physical Activities Toward Health and Fitness (PathFit 2): Exercise-Based Fitness Activities', 'PED 031', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `student_id`, `type`, `title`, `message`, `created_at`) VALUES
(1, '0005', 'acquired', 'Module acquired', 'You have received your module.', '2026-10-13 20:52:26'),
(2, '0005', 'missed', 'Reservation missed', 'You have missed your reservation.', '2026-10-13 20:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `distribution_date` date NOT NULL,
  `slot_start` time NOT NULL,
  `slot_end` time NOT NULL,
  `status` enum('Pending','Acquired','Missed') NOT NULL DEFAULT 'Pending',
  `reminded` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `student_id`, `distribution_date`, `slot_start`, `slot_end`, `status`, `reminded`, `created_at`) VALUES
(1, '0004', '2026-10-14', '08:00:00', '08:30:00', 'Pending', 0, '2026-10-13 19:39:48'),
(2, '0005', '2026-10-14', '08:30:00', '09:00:00', 'Missed', 0, '2026-10-13 20:32:01'),
(3, '0005', '2026-10-14', '09:00:00', '09:30:00', 'Acquired', 0, '2026-10-13 20:35:27'),
(4, '0002', '2026-10-14', '09:00:00', '09:30:00', 'Pending', 0, '2026-10-13 23:33:09'),
(5, '0002', '2026-10-15', '11:30:00', '12:00:00', 'Pending', 0, '2026-10-13 23:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_items`
--

CREATE TABLE `reservation_items` (
  `reservation_id` int(11) NOT NULL,
  `module_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_items`
--

INSERT INTO `reservation_items` (`reservation_id`, `module_id`) VALUES
(1, 'ART 002'),
(1, 'GEN 005'),
(1, 'GEN 008'),
(2, 'GEN 005'),
(2, 'GEN 008'),
(3, 'ART 002'),
(3, 'GEN 005'),
(3, 'GEN 008'),
(4, 'ITE 048'),
(4, 'ITE 083'),
(4, 'ITE 186'),
(5, 'GEN 008'),
(5, 'ITE 048');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` varchar(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `section` varchar(20) NOT NULL,
  `student_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `last_name`, `first_name`, `course`, `section`, `student_pass`) VALUES
('0002', 'Obsioma', 'Ron Ethan', 'BSIT', 'COC-FAB-BSIT2-11', 'stud2'),
('0003', 'Canete', 'Steve', 'BSIT', 'COC-FAB-BSIT2-11', 'stud3'),
('0004', 'Allaga', 'Hans', 'BSIT', 'COC-FAB-BSIT2-11', 'stud4'),
('0005', 'Braceros', 'Ronald', 'BSIT', 'COC-BSIT2-11', 'stud5');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_reservations`
-- (See below for the actual view)
--
CREATE TABLE `v_reservations` (
`reservation_id` int(11)
,`student_id` varchar(20)
,`year_levels` mediumtext
,`semesters` mediumtext
,`reserved_modules` mediumtext
,`distribution_date` date
,`slot_start` time
,`slot_end` time
,`status` enum('Pending','Acquired','Missed')
,`reminded` tinyint(1)
);

-- --------------------------------------------------------

--
-- Structure for view `v_reservations`
--
DROP TABLE IF EXISTS `v_reservations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reservations`  AS SELECT `r`.`reservation_id` AS `reservation_id`, `r`.`student_id` AS `student_id`, group_concat(distinct elt(`m`.`year_level`,'1st Year','2nd Year','3rd Year','4th Year') order by `m`.`year_level` ASC separator ', ') AS `year_levels`, group_concat(distinct elt(`m`.`semester`,'1st Sem','2nd Sem') order by `m`.`semester` ASC separator ', ') AS `semesters`, group_concat(`m`.`subject_code` order by `m`.`subject_code` ASC separator ', ') AS `reserved_modules`, `r`.`distribution_date` AS `distribution_date`, `r`.`slot_start` AS `slot_start`, `r`.`slot_end` AS `slot_end`, `r`.`status` AS `status`, `r`.`reminded` AS `reminded` FROM ((`reservations` `r` left join `reservation_items` `ri` on(`ri`.`reservation_id` = `r`.`reservation_id`)) left join `modules` `m` on(`m`.`module_id` = `ri`.`module_id`)) GROUP BY `r`.`reservation_id`, `r`.`student_id`, `r`.`distribution_date`, `r`.`slot_start`, `r`.`slot_end`, `r`.`status`, `r`.`reminded` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_notif_student` (`student_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `idx_res_student` (`student_id`),
  ADD KEY `idx_res_slot` (`distribution_date`,`slot_start`);

--
-- Indexes for table `reservation_items`
--
ALTER TABLE `reservation_items`
  ADD PRIMARY KEY (`reservation_id`,`module_id`),
  ADD KEY `fk_item_mod` (`module_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_res_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_items`
--
ALTER TABLE `reservation_items`
  ADD CONSTRAINT `fk_item_mod` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_res` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
