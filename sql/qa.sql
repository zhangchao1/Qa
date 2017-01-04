-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2017 at 09:25 PM
-- Server version: 5.7.13-0ubuntu0.16.04.2
-- PHP Version: 5.6.26-1+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admire`
--

CREATE TABLE `admire` (
  `Id` int(14) UNSIGNED NOT NULL,
  `Guid` int(14) UNSIGNED NOT NULL,
  `Types` tinyint(8) UNSIGNED NOT NULL,
  `Count` int(16) UNSIGNED NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `Aid` int(14) UNSIGNED NOT NULL,
  `Uid` int(14) UNSIGNED NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Content` text NOT NULL,
  `Tag` varchar(20) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Types` varchar(20) NOT NULL,
  `Status` tinyint(3) UNSIGNED NOT NULL,
  `AdmireNum` int(14) UNSIGNED NOT NULL,
  `CommentNum` int(14) UNSIGNED NOT NULL,
  `ViewNum` int(14) UNSIGNED NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `Id` int(14) UNSIGNED NOT NULL,
  `Cid` int(14) UNSIGNED NOT NULL,
  `Uid` int(14) UNSIGNED NOT NULL,
  `TargetUid` int(14) UNSIGNED NOT NULL,
  `Content` varchar(255) NOT NULL,
  `Types` tinyint(8) UNSIGNED NOT NULL,
  `Created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `useradmire`
--

CREATE TABLE `useradmire` (
  `Id` int(14) UNSIGNED NOT NULL,
  `Uid` int(14) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Guid` int(14) UNSIGNED NOT NULL,
  `Types` tinyint(8) UNSIGNED NOT NULL,
  `Created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admire`
--
ALTER TABLE `admire`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`Aid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `useradmire`
--
ALTER TABLE `useradmire`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admire`
--
ALTER TABLE `admire`
  MODIFY `Id` int(14) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `Aid` int(14) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `Id` int(14) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `useradmire`
--
ALTER TABLE `useradmire`
  MODIFY `Id` int(14) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
