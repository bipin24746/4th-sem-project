-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 03:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movieproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `phone_no`) VALUES
(1, 'bipin', 'sainjubipin24746@gmail.com', '$2y$10$nBrneGxlFdotk.56Ca/MFeFsr1S63IY9pB8TBUJP8FlBZPXou4bge', 1234567890),
(2, 'admin', 'admin12@gmail.com', '$2y$10$zbaoaE2nX.aidHcxB9mZHeRv7Zi4X/C.qVUAamRSWa1ye9FZp5zCC', 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `seat_num` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `user_id` int(11) NOT NULL,
  `paid` varchar(150) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `movie_id`, `show_date`, `show_time`, `seat_num`, `total_price`, `booking_date`, `booking_time`, `user_id`, `paid`, `image_path`) VALUES
(1, 19, '2023-12-01', '22:55:00', 12, 200, '2023-11-30', '14:07:39', 4, '1', ''),
(2, 19, '2023-12-01', '22:55:00', 16, 200, '2023-11-30', '14:09:42', 4, '1', ''),
(3, 19, '2023-12-01', '22:55:00', 17, 200, '2023-11-30', '14:10:30', 4, '1', ''),
(6, 19, '2023-12-01', '22:55:00', 23, 200, '2023-11-30', '16:58:21', 4, '1', ''),
(7, 19, '2023-12-01', '18:57:00', 12, 800, '2023-11-30', '17:02:12', 4, '1', ''),
(10, 19, '2023-12-01', '18:57:00', 23, 800, '2023-11-30', '17:02:12', 4, '1', ''),
(12, 19, '2023-12-01', '18:57:00', 29, 600, '2023-11-30', '17:03:23', 4, '1', ''),
(13, 19, '2023-12-01', '18:57:00', 34, 600, '2023-11-30', '17:03:23', 4, '1', ''),
(14, 19, '2023-12-01', '22:55:00', 5, 400, '2023-11-30', '17:06:48', 4, '1', ''),
(15, 19, '2023-12-01', '22:55:00', 10, 400, '2023-11-30', '17:06:48', 4, '1', ''),
(16, 19, '2023-12-01', '22:55:00', 33, 200, '2023-11-30', '17:08:22', 4, '1', ''),
(17, 19, '2023-12-01', '22:55:00', 32, 200, '2023-11-30', '17:09:19', 4, '1', ''),
(18, 19, '2023-12-01', '22:55:00', 34, 200, '2023-11-30', '17:11:55', 4, '1', ''),
(19, 19, '2023-12-01', '22:55:00', 15, 200, '2023-11-30', '17:16:28', 4, '1', ''),
(20, 19, '2023-12-01', '22:55:00', 35, 200, '2023-11-30', '17:17:39', 4, '1', '656872e7138bb_WIN_20230905_13_35_53_Pro.jpg'),
(21, 19, '2023-12-01', '22:55:00', 3, 200, '2023-11-30', '17:18:38', 4, '1', '6568731b572ca_WIN_20230905_13_33_50_Pro.jpg'),
(22, 19, '2023-12-01', '22:55:00', 27, 200, '2023-11-30', '17:20:20', 4, '1', '656873813e275_WIN_20230905_13_34_38_Pro.jpg'),
(62, 19, '2023-12-02', '19:16:00', 2, 400, '2023-11-30', '20:19:32', 1, '1', ''),
(63, 19, '2023-12-02', '19:16:00', 6, 400, '2023-11-30', '20:19:32', 1, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `genre` varchar(250) NOT NULL,
  `industry` varchar(250) NOT NULL,
  `language` varchar(250) NOT NULL,
  `release_date` varchar(255) NOT NULL,
  `actor` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `first_date` date NOT NULL,
  `second_date` date NOT NULL,
  `third_date` date NOT NULL,
  `first_show` time NOT NULL,
  `second_show` time NOT NULL,
  `third_show` time NOT NULL,
  `movie_duration` varchar(255) NOT NULL,
  `movie_director` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `name`, `genre`, `industry`, `language`, `release_date`, `actor`, `description`, `price`, `image`, `first_date`, `second_date`, `third_date`, `first_show`, `second_show`, `third_show`, `movie_duration`, `movie_director`) VALUES
(19, 'kgf 2', 'action', 'Bollywood', 'Hindi', '24/07/2022', 'avengers', '', 200, 's-l1600.jpg', '2023-12-02', '2023-12-02', '2023-11-30', '19:16:00', '18:56:00', '18:57:00', '2hrs 34min 7sec', 'marvel'),
(20, 'kgf 2', 'action', 'Bollywood', 'Hindi', '24/07/2022', 'avengers', '', 200, 's-l1600.jpg', '2023-11-29', '2023-11-30', '2023-12-01', '11:05:00', '12:05:00', '13:05:00', '2hrs 34min 7sec', 'marvel'),
(21, 'kgf 2', 'action', 'Bollywood', 'Hindi', '24/07/2022', 'avengers', '', 200, '244729379_275484634300135_7623849994428463443_n.jpg', '2023-12-01', '2023-12-03', '2023-12-02', '21:23:00', '20:23:00', '00:00:00', '2hrs 34min 7sec', 'marvel'),
(22, 'kgf 2', 'action', 'Bollywood', 'Hindi', '24/07/2022', 'avengers', '', 200, '', '2023-12-02', '2023-12-01', '2023-12-02', '00:00:00', '00:00:00', '00:00:00', '2hrs 34min 7sec', 'marvel');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone_no`) VALUES
(1, 'Bipin Sainju Shrestha', 'sainjubipin247460@gmail.com', '$2y$10$f/CZ0FAFyisV2yK7ucyjguzgFwqvwM1nmla7ECbNjC6T7FM6U/yqe', 0),
(4, 'bipin', 'sainjubipin24746@gmail.com', '$2y$10$c1eDbyNP3heO85FDqHvCROFsnhWuO2WwFQLklX8bMR2KMj0adC8dq', 0),
(5, 'bipin', 'sainjubipin2474@gmail.com', '$2y$10$.EEl1ZhTJoepZTXwFQ8HWezi8bHceumTJDaAeejE6zX93bDHu.VX.', 1234567890),
(6, 'bipin', 'sainjubipin2746@gmail.com', '$2y$10$IT0JeAOJ7QyOp4lAjchMTu.M3KVs5PEmASASsJK6pLHbe1rcNgmeK', 1234567890),
(7, 'bipin', 'sainjubipin24746@gmail.com', '$2y$10$/YnxBquA2152BkbB1tptku0ZcI3wssfc8DnHwBoB3wj0JNe2.YrhS', 1234567890),
(8, 'bipin', 'sainjubipin24746@gmail.com', '$2y$10$wbiCaphCgvV6NSto1lrl6OCOZ70BKJBRVQ6w4EThXWW/b5BKp9LHe', 1234567890);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
