-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2022 at 09:13 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_num` varchar(12) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'asdfasdf', 'adfdaf@gmail.com', '232344345', 'safdffsdfgdfg', '2020-11-27 20:47:32'),
(2, 'fname', 'femail@gmail.com', '3423435464', 'Hi this is first message.', '2020-11-24 17:56:42'),
(3, 'agsdhtht', 'alfasdfkj@gmail.com', '245254563635', 'falkfjldskfjlkdjf', '2020-11-27 20:55:01'),
(4, 'adfdsflkj', 'ghfdghdf@gmail.com', '3435234', 'agjdlfgjdfljgk', '2020-11-27 21:01:13'),
(5, 'adfdsflkj', 'ghfdghdf@gmail.com', '3435234', 'agjdlfgjdfljgk', '2020-11-27 21:06:31'),
(6, 'adfdsflkj', 'ghfdghdf@gmail.com', '3435234', 'agjdlfgjdfljgk', '2020-11-27 21:06:36'),
(7, 'user', 'user@gmail.com', '9934232393', 'Hello this is first user\r\n', '2020-11-28 00:11:36'),
(8, 'user', 'user@gmail.com', '9934232393', 'Hello this is first user\r\n', '2020-11-28 00:17:07'),
(9, 'eeasdf', 'fddfsa@gmail.com', '23234425343', 'adfdf afdadfsdf', '2021-03-29 00:58:52'),
(10, 'khizar', 'khizar@gmail.com', '', '', '2021-04-08 12:10:12'),
(11, 'khizar', 'khizar@gmail.com', '3244667889', 'hi', '2021-04-08 12:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `pimage` varchar(12) NOT NULL,
  `ptitle` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `psubtitle` text NOT NULL,
  `pcontent` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `pimage`, `ptitle`, `slug`, `psubtitle`, `pcontent`, `date`) VALUES
(1, 'home-bg.jpg', 'test post', 'first-post', 'Hello this is test post', 'Yeah this updated first post my first ever post on my website and i\'m very excited', '2020-12-05 19:06:00'),
(2, '', 'second_post', 'second-post', 'this is the second post', 'As she sat watching the world go by, something caught her eye. It wasn\'t so much its color or shape, but the way it was moving. She squinted to see if she could better understand what it was and where it was going, but it didn\'t help. As she continued to stare into the distance, she didn\'t understand why this uneasiness was building inside her body. She felt like she should get up and run. If only she could make out what it was. At that moment, she comprehended what it was and where it was heading, and she knew her life would never be the same.', '2020-12-01 18:51:38'),
(4, 'about-bg.jpg', 'forth_post', 'forth-post', 'this is forth post', 'Since they are still preserved in the rocks for us to see, they must have been formed quite recently, that is, geologically speaking. What can explain these striations and their common orientation? Did you ever hear about the Great Ice Age or the Pleistocene Epoch? Less than one million years ago, in fact, some 12,000 years ago, an ice sheet many thousands of feet thick rode over Burke Mountain in a southeastward direction. The many boulders frozen to the underside of the ice sheet tended to scratch the rocks over which they rode. The scratches or striations seen in the park rocks were caused by these attached boulders. The ice sheet also plucked and rounded Burke Mountain into the shape it possesses today.', '2020-12-05 10:37:29'),
(6, '', 'sixth_post', 'sixth-post', 'this is sixth post', 'Stranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last.', '2020-12-01 18:56:13'),
(7, 'fadsf', 'asfsdff', 'dfdf', 'safsd', 'sdfadf', '2020-12-04 19:38:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
