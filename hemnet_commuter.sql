-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:23002
-- Generation Time: Sep 06, 2020 at 08:37 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hemnet_commuter_cache`
--

-- --------------------------------------------------------

--
-- Table structure for table `commute_locations`
--

CREATE TABLE `commute_locations` (
  `id` int(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `max_time` int(12) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commute_map`
--

CREATE TABLE `commute_map` (
  `id` int(20) NOT NULL,
  `request_str` text NOT NULL,
  `commute_id` int(20) DEFAULT NULL,
  `map_id` varchar(255) NOT NULL,
  `layer_name` varchar(255) NOT NULL,
  `result` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commute_times`
--

CREATE TABLE `commute_times` (
  `id` int(20) NOT NULL,
  `commute_id` int(20) NOT NULL,
  `house_id` int(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `distance_text` varchar(255) DEFAULT NULL,
  `distance_value` int(20) DEFAULT NULL,
  `duration_text` varchar(255) DEFAULT NULL,
  `duration_value` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `typeSummary` varchar(255) NOT NULL,
  `project` int(1) NOT NULL DEFAULT '0',
  `new_construction` int(1) NOT NULL DEFAULT '0',
  `ongoing_bidding` int(1) NOT NULL DEFAULT '0',
  `foreclosure` int(1) NOT NULL DEFAULT '0',
  `upcoming` int(1) NOT NULL DEFAULT '0',
  `has_price_change` int(1) NOT NULL DEFAULT '0',
  `rooms` varchar(10) NOT NULL,
  `age` int(5) NOT NULL,
  `deactivated_before_open_house` int(1) NOT NULL DEFAULT '0',
  `image_url` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `locations_string` varchar(255) NOT NULL,
  `should_display_showings` int(1) NOT NULL DEFAULT '0',
  `lat` varchar(30) NOT NULL,
  `lng` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `land_area` int(30) NOT NULL,
  `living_area` int(30) NOT NULL,
  `supplemental_area` int(30) NOT NULL,
  `size_total` int(30) NOT NULL,
  `created` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `house_comments`
--

CREATE TABLE `house_comments` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `house_ratings`
--

CREATE TABLE `house_ratings` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `house_tags`
--

CREATE TABLE `house_tags` (
  `id` int(12) NOT NULL,
  `house_id` int(12) NOT NULL,
  `tag_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_searches`
--

CREATE TABLE `saved_searches` (
  `id` int(12) NOT NULL,
  `search_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(12) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commute_locations`
--
ALTER TABLE `commute_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commute_map`
--
ALTER TABLE `commute_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commute_times`
--
ALTER TABLE `commute_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `house_comments`
--
ALTER TABLE `house_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `house_ratings`
--
ALTER TABLE `house_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `house_tags`
--
ALTER TABLE `house_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_searches`
--
ALTER TABLE `saved_searches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `search_id` (`search_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commute_locations`
--
ALTER TABLE `commute_locations`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commute_map`
--
ALTER TABLE `commute_map`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commute_times`
--
ALTER TABLE `commute_times`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_comments`
--
ALTER TABLE `house_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_ratings`
--
ALTER TABLE `house_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_tags`
--
ALTER TABLE `house_tags`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_searches`
--
ALTER TABLE `saved_searches`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
