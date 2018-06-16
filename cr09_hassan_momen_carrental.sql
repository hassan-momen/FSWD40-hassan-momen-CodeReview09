-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 04:43 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_hassan_momen_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `country` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `street` varchar(55) DEFAULT NULL,
  `zip_code` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `country`, `city`, `street`, `zip_code`) VALUES
(1, 'austria', 'vienna', 'geblerg', 1170),
(2, 'austria', 'vienna', 'linzer strasse ', 1140),
(3, 'austira', 'vienna', 'langelnfieldgasse', 1130);

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `fk_return_id` int(11) DEFAULT NULL,
  `fk_a_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`agency_id`, `name`, `fk_return_id`, `fk_a_address_id`) VALUES
(1, 'drive now', 1, 1),
(2, 'drive now', 2, 2),
(3, 'drive now', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `a_address`
--

CREATE TABLE `a_address` (
  `a_address_id` int(11) NOT NULL,
  `country` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `street` varchar(55) DEFAULT NULL,
  `zip_code` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_address`
--

INSERT INTO `a_address` (`a_address_id`, `country`, `city`, `street`, `zip_code`) VALUES
(1, 'austria', 'vienna', 'herbotgasse', 1170),
(2, 'austira', 'vienna', 'langelnfieldgasse', 1130),
(3, 'austria', 'vienna', 'herbotgasse', 1110);

-- --------------------------------------------------------

--
-- Table structure for table `car_ental_online`
--

CREATE TABLE `car_ental_online` (
  `car_rental_online_id` int(11) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_cars_types_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_ental_online`
--

INSERT INTO `car_ental_online` (`car_rental_online_id`, `url`, `fk_customer_id`, `fk_cars_types_id`) VALUES
(1, 'www.car/rental.com', 1, 1),
(2, 'www.car/rental.com', 3, 3),
(3, 'www.car/rental.com', 2, 2),
(4, 'www.car/rental.com', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `car_rental`
--

CREATE TABLE `car_rental` (
  `car_rental_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_c_r_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_rental`
--

INSERT INTO `car_rental` (`car_rental_id`, `name`, `fk_reservation_id`, `fk_c_r_address_id`) VALUES
(1, 'drive now', 1, 2),
(2, 'drive now', 2, 3),
(3, 'drive now', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `car_status`
--

CREATE TABLE `car_status` (
  `car_status_id` int(11) NOT NULL,
  `Check_gasoline` varchar(80) DEFAULT NULL,
  `Check_the_wheels` varchar(80) DEFAULT NULL,
  `fk_result_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_status`
--

INSERT INTO `car_status` (`car_status_id`, `Check_gasoline`, `Check_the_wheels`, `fk_result_id`) VALUES
(1, 'gasoline full', 'wheele its fine', 1),
(2, 'gasoline full ', 'wheel is bad', 1),
(3, 'no gasoline', 'wheel is fine', 2),
(4, 'gasoline full', 'wheel is fine', 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_types`
--

CREATE TABLE `car_types` (
  `car_types_id` int(11) NOT NULL,
  `name` enum('bmw','tesla','mercedes','ferrari','mazda') DEFAULT NULL,
  `car_type` enum('sport','family','4*4 car') DEFAULT NULL,
  `moudel` int(4) DEFAULT NULL,
  `color` enum('white','blue','red','yellow','black') DEFAULT NULL,
  `horse_power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_types`
--

INSERT INTO `car_types` (`car_types_id`, `name`, `car_type`, `moudel`, `color`, `horse_power`) VALUES
(1, 'bmw', 'sport', 2017, 'red', 500),
(2, 'ferrari', 'sport', 2018, 'black', 700),
(3, 'tesla', 'family', 2015, 'white', 250);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `fk_car_rental_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `fk_car_rental_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `driving_licence` enum('yes','no') DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `age`, `driving_licence`, `fk_address`) VALUES
(1, 'hassan', 'momen', 21, 'yes', 1),
(2, 'tomas', 'bauer', 30, 'yes', 2),
(3, 'tamir', 'hosnie', 35, 'yes', 3);

-- --------------------------------------------------------

--
-- Table structure for table `c_r_addres`
--

CREATE TABLE `c_r_addres` (
  `c_r_address_id` int(11) NOT NULL,
  `country` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `street` varchar(55) DEFAULT NULL,
  `zip_code` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_r_addres`
--

INSERT INTO `c_r_addres` (`c_r_address_id`, `country`, `city`, `street`, `zip_code`) VALUES
(1, 'austria', 'vienna', 'herbotgasse', 1110),
(2, 'austria', 'vienna', 'herbotgasse', 1130),
(3, 'austria', 'vienna', 'herbotgasse', 1170);

-- --------------------------------------------------------

--
-- Table structure for table `date_reseration`
--

CREATE TABLE `date_reseration` (
  `date_reservation_id` int(11) NOT NULL,
  `date_reservation_start` date DEFAULT NULL,
  `date_reservation_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `date_reseration`
--

INSERT INTO `date_reseration` (`date_reservation_id`, `date_reservation_start`, `date_reservation_end`) VALUES
(1, '2018-06-06', '2018-06-14'),
(2, '2018-06-06', '2018-06-22'),
(3, '2018-06-10', '2018-06-17');

-- --------------------------------------------------------

--
-- Table structure for table `inspection_center`
--

CREATE TABLE `inspection_center` (
  `inspection_center_id` int(11) NOT NULL,
  `fk_agency_id` int(11) DEFAULT NULL,
  `fk_car_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `The_test_result` varchar(256) DEFAULT NULL,
  `result_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`result_id`, `The_test_result`, `result_date`) VALUES
(1, 'car is so good', '2018-06-11'),
(2, 'no gasoline in car', '2018-06-20'),
(3, 'wheely its fine', '2018-06-23');

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `return_id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `fk_client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return`
--

INSERT INTO `return` (`return_id`, `return_date`, `fk_client_id`) VALUES
(1, '2018-06-05', 1),
(2, '2018-06-21', 2),
(3, '2018-06-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rseration`
--

CREATE TABLE `rseration` (
  `reservation_id` int(11) NOT NULL,
  `price` int(5) DEFAULT NULL,
  `fk_car_ental_online_id` int(11) DEFAULT NULL,
  `fk_date_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rseration`
--

INSERT INTO `rseration` (`reservation_id`, `price`, `fk_car_ental_online_id`, `fk_date_reservation_id`) VALUES
(1, 150, 1, 3),
(2, 250, 3, 2),
(3, 250, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `fk_return_id` (`fk_return_id`),
  ADD KEY `fk_a_address_id` (`fk_a_address_id`);

--
-- Indexes for table `a_address`
--
ALTER TABLE `a_address`
  ADD PRIMARY KEY (`a_address_id`);

--
-- Indexes for table `car_ental_online`
--
ALTER TABLE `car_ental_online`
  ADD PRIMARY KEY (`car_rental_online_id`),
  ADD KEY `fk_cars_types_id` (`fk_cars_types_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `car_rental`
--
ALTER TABLE `car_rental`
  ADD PRIMARY KEY (`car_rental_id`),
  ADD KEY `fk_reseration_id` (`fk_reservation_id`),
  ADD KEY `fk_c_r_address_id` (`fk_c_r_address_id`);

--
-- Indexes for table `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`car_status_id`),
  ADD KEY `fk_result_id` (`fk_result_id`);

--
-- Indexes for table `car_types`
--
ALTER TABLE `car_types`
  ADD PRIMARY KEY (`car_types_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_car_rental_id` (`fk_car_rental_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Indexes for table `c_r_addres`
--
ALTER TABLE `c_r_addres`
  ADD PRIMARY KEY (`c_r_address_id`);

--
-- Indexes for table `date_reseration`
--
ALTER TABLE `date_reseration`
  ADD PRIMARY KEY (`date_reservation_id`);

--
-- Indexes for table `inspection_center`
--
ALTER TABLE `inspection_center`
  ADD PRIMARY KEY (`inspection_center_id`),
  ADD KEY `fk_agency_id` (`fk_agency_id`),
  ADD KEY `fk_car_status` (`fk_car_status`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_client_id` (`fk_client_id`);

--
-- Indexes for table `rseration`
--
ALTER TABLE `rseration`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_car_ental_online_id` (`fk_car_ental_online_id`),
  ADD KEY `fk_date_reseration_id` (`fk_date_reservation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `a_address`
--
ALTER TABLE `a_address`
  MODIFY `a_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car_ental_online`
--
ALTER TABLE `car_ental_online`
  MODIFY `car_rental_online_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_rental`
--
ALTER TABLE `car_rental`
  MODIFY `car_rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car_status`
--
ALTER TABLE `car_status`
  MODIFY `car_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_types`
--
ALTER TABLE `car_types`
  MODIFY `car_types_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `c_r_addres`
--
ALTER TABLE `c_r_addres`
  MODIFY `c_r_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `date_reseration`
--
ALTER TABLE `date_reseration`
  MODIFY `date_reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inspection_center`
--
ALTER TABLE `inspection_center`
  MODIFY `inspection_center_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rseration`
--
ALTER TABLE `rseration`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_return_id`) REFERENCES `return` (`return_id`),
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`fk_a_address_id`) REFERENCES `a_address` (`a_address_id`);

--
-- Constraints for table `car_ental_online`
--
ALTER TABLE `car_ental_online`
  ADD CONSTRAINT `car_ental_online_ibfk_1` FOREIGN KEY (`fk_cars_types_id`) REFERENCES `car_types` (`car_types_id`),
  ADD CONSTRAINT `car_ental_online_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `car_rental`
--
ALTER TABLE `car_rental`
  ADD CONSTRAINT `car_rental_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `rseration` (`reservation_id`),
  ADD CONSTRAINT `car_rental_ibfk_2` FOREIGN KEY (`fk_c_r_address_id`) REFERENCES `c_r_addres` (`c_r_address_id`);

--
-- Constraints for table `car_status`
--
ALTER TABLE `car_status`
  ADD CONSTRAINT `car_status_ibfk_1` FOREIGN KEY (`fk_result_id`) REFERENCES `result` (`result_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`fk_car_rental_id`) REFERENCES `car_rental` (`car_rental_id`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `inspection_center`
--
ALTER TABLE `inspection_center`
  ADD CONSTRAINT `inspection_center_ibfk_1` FOREIGN KEY (`fk_agency_id`) REFERENCES `agency` (`agency_id`),
  ADD CONSTRAINT `inspection_center_ibfk_2` FOREIGN KEY (`fk_car_status`) REFERENCES `car_status` (`car_status_id`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `return_ibfk_1` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `rseration`
--
ALTER TABLE `rseration`
  ADD CONSTRAINT `rseration_ibfk_1` FOREIGN KEY (`fk_car_ental_online_id`) REFERENCES `car_ental_online` (`car_rental_online_id`),
  ADD CONSTRAINT `rseration_ibfk_2` FOREIGN KEY (`fk_date_reservation_id`) REFERENCES `date_reseration` (`date_reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
