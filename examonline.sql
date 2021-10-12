-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2021 at 05:53 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `added_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `email`, `username`, `password`, `contact`, `added_date`, `updated_date`, `image_name`) VALUES
(1, 'Online Exam System', 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '9866296009', '2021-04-03', '2021-09-02', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `course_id` int(10) NOT NULL,
  `faculty` varchar(150) CHARACTER SET utf8 NOT NULL,
  `course_name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `is_active` varchar(10) CHARACTER SET utf8 NOT NULL,
  `added_date` date NOT NULL,
  `updated_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`course_id`, `faculty`, `course_name`, `is_active`, `added_date`, `updated_date`) VALUES
(9, 'BCA', 'E-Bussiness', 'yes', '2021-09-03', '2021-09-03'),
(10, 'CSIT', 'Introduction to management', 'yes', '2021-09-03', '0000-00-00'),
(11, 'BCA', 'Introduction to management', 'yes', '2021-09-05', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faculty`
--

CREATE TABLE `tbl_faculty` (
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `faculty_name` varchar(150) NOT NULL,
  `time_duration` int(11) NOT NULL,
  `qns_per_set` int(11) NOT NULL,
  `total_english` int(10) UNSIGNED NOT NULL,
  `total_math` int(10) UNSIGNED NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `added_date` date NOT NULL,
  `updated_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_faculty`
--

INSERT INTO `tbl_faculty` (`faculty_id`, `faculty_name`, `time_duration`, `qns_per_set`, `total_english`, `total_math`, `is_active`, `added_date`, `updated_date`) VALUES
(2, 'BCA', 10, 180, 100, 80, 'yes', '2017-04-04', '2021-09-03'),
(6, 'CSIT', 10, 180, 100, 80, 'yes', '2021-09-03', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE `tbl_question` (
  `question_id` int(10) UNSIGNED NOT NULL,
  `question` longtext NOT NULL,
  `first_answer` varchar(255) NOT NULL,
  `second_answer` varchar(255) NOT NULL,
  `third_answer` varchar(255) NOT NULL,
  `fourth_answer` varchar(255) NOT NULL,
  `answer` int(11) NOT NULL,
  `reason` longtext NOT NULL,
  `marks` decimal(10,0) NOT NULL,
  `category` varchar(100) NOT NULL,
  `faculty` varchar(150) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `added_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`question_id`, `question`, `first_answer`, `second_answer`, `third_answer`, `fourth_answer`, `answer`, `reason`, `marks`, `category`, `faculty`, `is_active`, `added_date`, `updated_date`, `image_name`) VALUES
(109, '<p>who is jon snow?</p>\r\n', 'lannister', 'targerian', 'stark', 'baratheon', 2, '<p>he is a son of rheagal targerian and lyanna stark</p>\r\n', '5', 'English', '2', 'yes', '2021-09-03', '2021-09-05', ''),
(110, '<p>solve this</p>\r\n', '5', '2', '3', '4', 1, '<p>5 is ans</p>\r\n', '5', 'English', '2', 'yes', '2021-09-03', '2021-09-05', 'Exam_Question1889a191b9a46398e488616e0cbfe94a.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_result`
--

CREATE TABLE `tbl_result` (
  `result_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) UNSIGNED NOT NULL,
  `question_id` int(11) UNSIGNED NOT NULL,
  `user_answer` int(11) UNSIGNED NOT NULL,
  `right_answer` int(11) UNSIGNED NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_result`
--

INSERT INTO `tbl_result` (`result_id`, `student_id`, `question_id`, `user_answer`, `right_answer`, `added_date`) VALUES
(87, 1, 110, 1, 1, '2021-09-03'),
(88, 1, 109, 2, 2, '2021-09-03'),
(89, 1, 110, 2, 1, '2021-09-04'),
(90, 1, 109, 2, 2, '2021-09-04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_result_summary`
--

CREATE TABLE `tbl_result_summary` (
  `summary_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) UNSIGNED NOT NULL,
  `marks` decimal(10,2) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_result_summary`
--

INSERT INTO `tbl_result_summary` (`summary_id`, `student_id`, `marks`, `added_date`) VALUES
(43, 1, '10.00', '2021-09-03'),
(44, 1, '5.00', '2021-09-04'),
(50, 1, '10.00', '2021-09-05'),
(51, 1, '5.00', '2021-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `added_date` date NOT NULL,
  `updated_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `first_name`, `last_name`, `email`, `username`, `password`, `contact`, `gender`, `faculty`, `is_active`, `added_date`, `updated_date`) VALUES
(1, 'Student', 'Don', 'student@gmail.com', 'student', 'student', '9836725323', 'male', '2', 'yes', '2017-06-27', '2021-09-05'),
(2, 'bikash', 'don', 'bk@gmail.com', 'bk', 'bk', '9876543210', 'male', '6', 'yes', '2021-09-03', '2021-09-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `tbl_result`
--
ALTER TABLE `tbl_result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `tbl_result_summary`
--
ALTER TABLE `tbl_result_summary`
  ADD PRIMARY KEY (`summary_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `course_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  MODIFY `faculty_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_question`
--
ALTER TABLE `tbl_question`
  MODIFY `question_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `tbl_result`
--
ALTER TABLE `tbl_result`
  MODIFY `result_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `tbl_result_summary`
--
ALTER TABLE `tbl_result_summary`
  MODIFY `summary_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
