-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2016 at 06:19 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `visit_rda`
--

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
  `domain_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`domain_id`, `name`, `description`) VALUES
(1, 'IT', 'Information Technology'),
(2, 'Health', 'Ubuzima'),
(3, 'Bar Restaurent', 'xxxxxxx'),
(4, 'Public Institution', 'sssza'),
(5, 'Hotel', 'Hotels and Motels'),
(6, 'XXXXXX', 'ZSXSSD       '),
(7, 'Tourism Site', 'vv vvvsd');

-- --------------------------------------------------------

--
-- Table structure for table `entities`
--

CREATE TABLE IF NOT EXISTS `entities` (
  `inst_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `acronym` varchar(40) DEFAULT NULL,
  `address` varchar(40) NOT NULL,
  `tel` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `acct_no` varchar(40) NOT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entities`
--

INSERT INTO `entities` (`inst_id`, `name`, `acronym`, `address`, `tel`, `email`, `acct_no`, `domain_id`, `logo`, `reg_date`, `user_id`, `details`) VALUES
(1, 'Rwanda Governance Board', 'RGB', 'Giporoso', '07855502310', 'ggg@yahoo.com', '211P9', 4, NULL, '2015-11-17 17:45:29', 0, NULL),
(2, 'Fantastic', '--', 'Kigali', '0785550331', 'kaka@yahoo.com', 'BK-8897F', 3, '2!i2.jpg', '2015-11-17 18:19:42', 0, NULL),
(3, 'Gloria Hotel', 'Gh', 'Kigali Gasabo', '0783236883', 'ggg@yahoo.com', '90078', 3, '3!i1.jpg', '2015-11-17 19:23:53', 10191, NULL),
(4, 'Chez Manu', 'CzM', 'Kicukiro', '0785550331', 'heritierakili@yahoo.com', '90075', 3, '4!mphone.jpg', '2015-11-18 17:30:12', 10195, NULL),
(5, 'IT Business', 'IT Bus', 'Kigali', '0783236883', 'sabiti@yahoo.com', '092877P', 1, '5!mobile_sms_betting.png', '2015-11-18 18:44:26', 10196, 'We are good in providing solutions                                        '),
(6, 'Nyungwe Forest ', 'NY', 'Nyamagabe', '0782325675', 'ny@gmail.com', '10000004141', 7, '6!1020150834.jpg', '2015-11-20 04:42:16', 10197, 'We help u to visit Nyungwe national Park                               '),
(7, 'Victoria International Ltd', 'VINTL', 'Kigali', '2507224510', 'akili_heritier@yahoo.com', '0788886443', 7, '7!slide-22-tn.jpg', '2016-03-25 04:43:54', 10199, 'HHAHHAHAH                    '),
(8, 'Superior Web Design Ltd', 'SWDL', 'Kigali', '2507224510', 'onlineservicesp@gmail.com', '---', 1, '8!contact.png', '2016-05-04 18:43:12', 10201, 'SCJFHSJHSHDSJHDAJ'),
(9, 'Classic Hotel', 'CLH', 'Kicukiro-Kigarama', '0722345678', 'classic@gmail.com', '---', 3, '9!anigif3.gif', '2016-05-06 02:40:58', 10203, 'We are a hotel of 4stars                     ');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(40) DEFAULT NULL,
  `description` text,
  `cost` int(11) DEFAULT NULL,
  `duration` varchar(30) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `description`, `cost`, `duration`, `entity_id`) VALUES
(1, 'Rwanda Standards Board', 'ddf', 4000, '1', 3),
(2, 'Visiting Nyungwe', 'mmmm', 5000, '1', 6),
(3, 'Car Rental', 'bbbbb', 8000, '7Hrs', 7),
(4, 'Web Designing', 'cccwzaq', 2, '2', 8),
(5, 'Rent Of Conferance Hall', 'ccccccc', 3, '1h', 9);

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE IF NOT EXISTS `service_requests` (
  `request_id` int(11) NOT NULL,
  `request_date` date DEFAULT NULL,
  `sending_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `details` text,
  `qty` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `visitor_id` int(11) DEFAULT NULL,
  `request_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`request_id`, `request_date`, `sending_date`, `details`, `qty`, `service_id`, `visitor_id`, `request_status`) VALUES
(1, '2015-11-18', '2015-11-18 23:56:43', 'zcbnzsc', 0, 1, 1, 'Accepted'),
(2, '2015-11-20', '2016-05-04 21:04:35', 'xxxxx', 0, 1, 1, 'paid'),
(3, '2015-11-20', '2016-05-04 19:55:46', 'xxxxx', 0, 1, 1, 'paid'),
(4, '2015-11-19', '2015-11-20 05:42:41', 'vvvv  dgdg', 0, 2, 1, 'Rejected'),
(5, '2016-03-31', '2016-03-30 19:11:53', 'sgdshdgs ssjhdsj                                       ', 0, 2, 4, 'pending'),
(6, '2016-05-05', '2016-05-04 20:11:02', 'shdjshsjhjs sdhsjdhsj                                    ', 0, 4, 5, 'paid'),
(7, '2016-05-31', '2016-05-04 20:17:17', 'gdbgdbenhfndfn                                              ', 0, 4, 5, 'pending'),
(8, '2016-05-07', '2016-05-06 03:07:58', 'xhchsjfhsjsj                                      ', 0, 5, 6, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `service_request_payments`
--

CREATE TABLE IF NOT EXISTS `service_request_payments` (
  `payment_id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_request_payments`
--

INSERT INTO `service_request_payments` (`payment_id`, `payment_date`, `amount`, `request_id`) VALUES
(1, '2016-05-04', 4000, 3),
(2, '2016-05-04', 4000, 3),
(3, '2016-05-04', 4000, 3),
(4, '2016-05-04', 4000, 3),
(5, '2016-05-04', 2, 6),
(6, '2016-05-05', 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `names` varchar(50) NOT NULL,
  `usr_username` varchar(50) NOT NULL,
  `usr_password` varchar(50) NOT NULL,
  `usr_role` varchar(50) NOT NULL,
  `usr_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `names`, `usr_username`, `usr_password`, `usr_role`, `usr_status`) VALUES
(10191, 'Gloria Hotel', 'gh', '123', 'entity', 'unlocked'),
(10192, 'Armand', 'abc', '123', 'admin', 'unlocked'),
(10193, 'Sano Eric', 'sano', '123', 'visitor', 'unlocked'),
(10194, 'SABITI Robert', 'sabiti', '123', 'visitor', 'locked'),
(10195, 'Chez Manu', 'manu', '123', 'entity', 'locked'),
(10196, 'IT Business', 'itbus', '123', 'entity', 'unlocked'),
(10197, 'Nyungwe Forest ', 'nyungwe', '123', 'entity', 'unlocked'),
(10198, 'RWANGALINDE Armand', 'armand', '123', 'visitor', 'locked'),
(10199, 'Victoria International Ltd', 'akili_heritier@yahoo.com', '123', 'entity', 'unlocked'),
(10200, 'Tuyisenge Desire', 'tuyi', '123', 'visitor', 'unlocked'),
(10201, 'Superior Web Design Ltd', 'swdl', '123', 'entity', 'unlocked'),
(10202, 'Akili Heritier', 'heritierakili@gmail.com', '123', 'visitor', 'unlocked'),
(10203, 'Classic Hotel', 'classic', '123', 'entity', 'unlocked'),
(10204, 'Manzi Sosthene', 'manzi', '123', 'visitor', 'unlocked');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE IF NOT EXISTS `visitors` (
  `visitor_id` int(11) NOT NULL,
  `names` varchar(40) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `occupation` varchar(40) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nationality` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`visitor_id`, `names`, `address`, `email`, `tel`, `occupation`, `user_id`, `nationality`) VALUES
(1, 'Sano Eric', 'Kimironko K345', 'beee@ddd.com', '0783236883', 'staff', 10193, 'RWANDESE'),
(2, 'SABITI Robert', 'Giporoso', 'ganza@yahoo.com', '0783236883', 'staff', 10194, 'RWANDESE'),
(3, 'RWANGALINDE Armand', 'Kigali Rwanda', 'arm@yahoo.com', '07823256758', 'IT Manager', 10198, 'Rwandan'),
(4, 'Tuyisenge Desire', 'Kigali', 'tuyi@gmail.com', '+2507224510', 'IT Manager', 10200, 'Rwandan'),
(5, 'Akili Heritier', 'Kigali', 'mpbejo@yahoo.fr', '2507224510', 'Business', 10202, 'Rwandan'),
(6, 'Manzi Sosthene', '1 Main St, San Jose, CA, 95131', 'mukligo@yahoo.fr', '4084244879', 'Business', 10204, '175222224855');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE IF NOT EXISTS `visits` (
  `visit_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visitor_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`visit_id`, `time`, `visitor_id`, `entity_id`, `date`) VALUES
(1, '2015-11-20 18:56:54', 1, 2, '2015-11-20'),
(2, '2015-11-21 00:43:41', 1, 5, '2015-11-20'),
(3, '2015-11-20 19:22:46', 1, 5, '2015-11-20'),
(4, '2015-11-20 05:22:15', 1, 6, '2015-11-19'),
(5, '2016-03-30 22:31:55', 4, 6, '2016-03-30'),
(6, '2016-04-08 16:29:44', 1, 6, '2016-04-08'),
(7, '2016-05-04 18:45:23', 5, 8, '2016-05-04'),
(8, '2016-05-06 02:44:53', 6, 9, '2016-05-05');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
