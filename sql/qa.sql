/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : qa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-05-08 09:28:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admire`
-- ----------------------------
DROP TABLE IF EXISTS `admire`;
CREATE TABLE `admire` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Guid` int(14) unsigned NOT NULL,
  `Types` tinyint(8) unsigned NOT NULL,
  `Count` int(16) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admire
-- ----------------------------
INSERT INTO `admire` VALUES ('1', '1', '1', '2', '2017-05-05 08:59:03', '2017-05-05 08:58:25');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `Aid` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Content` text NOT NULL,
  `Tag` varchar(20) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Types` varchar(20) NOT NULL,
  `Status` tinyint(3) unsigned NOT NULL,
  `AdmireNum` int(14) unsigned NOT NULL,
  `CommentNum` int(14) unsigned NOT NULL,
  `ViewNum` int(14) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Aid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '5', '加回房间按时发货', '<p>as房间辣十几个拉几个啦</p>\n', '谁对接暗示法', '阿斯顿发马克思符号是', '运营', '1', '2', '3', '0', '2017-05-05 08:59:14', '2017-05-05 08:58:18');

-- ----------------------------
-- Table structure for `attendance`
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Status` tinyint(8) unsigned NOT NULL,
  `Ip` varchar(50) NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for `colorlife`
-- ----------------------------
DROP TABLE IF EXISTS `colorlife`;
CREATE TABLE `colorlife` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Tag` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Ablums` text NOT NULL,
  `AdmireNum` int(14) unsigned NOT NULL,
  `CommentNum` int(14) unsigned NOT NULL,
  `ViewNum` int(14) unsigned NOT NULL,
  `Status` tinyint(8) NOT NULL,
  `IsPublic` tinyint(4) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of colorlife
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Cid` int(14) unsigned NOT NULL,
  `Uid` int(14) unsigned NOT NULL,
  `TargetUid` int(14) unsigned NOT NULL,
  `Content` varchar(255) NOT NULL,
  `Types` tinyint(8) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '5', '5', '价格后方可举案说法静安寺', '1', '2017-05-05 08:58:37');
INSERT INTO `comment` VALUES ('2', '1', '2', '2', '看哈斯卡', '1', '2017-05-05 08:59:08');
INSERT INTO `comment` VALUES ('3', '1', '2', '2', '不好klan', '1', '2017-05-05 08:59:14');

-- ----------------------------
-- Table structure for `deparment`
-- ----------------------------
DROP TABLE IF EXISTS `deparment`;
CREATE TABLE `deparment` (
  `DeparmentId` tinyint(8) unsigned NOT NULL AUTO_INCREMENT,
  `DeparmentName` varchar(100) NOT NULL,
  `ParentId` tinyint(8) unsigned NOT NULL,
  `Level` tinyint(8) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`DeparmentId`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deparment
-- ----------------------------
INSERT INTO `deparment` VALUES ('1', 'qa公司', '0', '1', '2017-01-01 09:16:02', '2017-01-18 09:16:05');
INSERT INTO `deparment` VALUES ('2', '技术部', '1', '2', '2017-01-18 09:16:48', '2017-01-18 09:16:52');
INSERT INTO `deparment` VALUES ('3', '后端技术中心', '2', '3', '2017-01-18 09:17:42', '2017-01-18 09:17:45');
INSERT INTO `deparment` VALUES ('4', 'PHP组', '3', '4', '2017-01-18 09:18:40', '2017-01-18 09:18:43');
INSERT INTO `deparment` VALUES ('5', 'C#组', '3', '4', '2017-01-18 09:19:39', '2017-01-18 09:19:42');
INSERT INTO `deparment` VALUES ('6', 'Go组', '3', '4', '2017-01-18 09:22:22', '2017-01-18 09:22:25');
INSERT INTO `deparment` VALUES ('7', '质量与运维组', '2', '3', '2017-01-18 09:23:21', '2017-01-18 09:23:23');
INSERT INTO `deparment` VALUES ('8', '测试组', '7', '4', '2017-01-18 09:24:05', '2017-01-18 09:24:08');
INSERT INTO `deparment` VALUES ('9', '运维组', '7', '4', '2017-01-18 09:24:58', '2017-01-18 09:25:01');
INSERT INTO `deparment` VALUES ('10', '前端组', '2', '3', '2017-01-18 09:26:02', '2017-01-18 09:26:05');
INSERT INTO `deparment` VALUES ('11', '设计组', '2', '3', '2017-01-18 09:27:12', '2017-01-18 09:27:15');
INSERT INTO `deparment` VALUES ('12', '支持部门', '1', '2', '2017-01-18 09:29:26', '2017-01-01 09:29:29');
INSERT INTO `deparment` VALUES ('13', '人事部', '12', '3', '2017-01-18 09:32:55', '2017-01-18 09:32:57');
INSERT INTO `deparment` VALUES ('14', '财务部', '12', '3', '2017-01-18 09:33:46', '2017-01-18 09:33:49');
INSERT INTO `deparment` VALUES ('15', '后勤部', '12', '3', '2017-02-01 01:00:00', '2017-02-02 00:00:00');
INSERT INTO `deparment` VALUES ('16', '运营部', '1', '2', '2017-02-02 00:00:00', '2017-02-02 00:00:00');
INSERT INTO `deparment` VALUES ('17', '运营一组', '16', '3', '2017-02-01 00:00:00', '2017-02-01 00:00:00');
INSERT INTO `deparment` VALUES ('18', '运营二组', '16', '3', '2017-02-01 00:00:00', '2017-02-02 00:00:00');
INSERT INTO `deparment` VALUES ('19', '节目部', '1', '2', '2017-02-01 00:00:00', '2017-02-02 00:00:00');
INSERT INTO `deparment` VALUES ('20', '节目一组', '19', '3', '2017-02-02 00:00:00', '2017-02-02 00:00:00');
INSERT INTO `deparment` VALUES ('21', '节目一组', '19', '3', '2017-02-02 00:00:00', '2017-02-02 00:00:00');
INSERT INTO `deparment` VALUES ('22', '项目组', '2', '3', '2017-02-01 00:00:00', '2017-02-02 00:00:00');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `Eid` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `DeId` tinyint(8) unsigned NOT NULL,
  `Job` varchar(50) NOT NULL,
  `Level` smallint(5) unsigned NOT NULL,
  `Role` smallint(5) unsigned NOT NULL,
  `Manager` smallint(5) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Eid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', '9', '运维工程师', '3', '2', '2', '2017-04-09 19:04:20', '2017-04-09 19:18:35');
INSERT INTO `employee` VALUES ('2', '2', '4', 'PHP工程师', '2', '1', '1', '2017-04-09 19:06:14', '2017-04-09 19:19:08');
INSERT INTO `employee` VALUES ('3', '3', '1', 'Qa公司CEO', '5', '7', '1', '2017-04-09 19:07:16', '2017-04-09 19:07:16');
INSERT INTO `employee` VALUES ('4', '4', '4', 'PHP工程师', '3', '2', '1', '2017-04-09 19:08:19', '2017-04-09 19:19:45');
INSERT INTO `employee` VALUES ('5', '5', '3', '后端技术中心架构师', '4', '4', '1', '2017-04-09 19:09:34', '2017-04-09 19:19:16');
INSERT INTO `employee` VALUES ('6', '6', '2', '技术部CEO', '5', '6', '1', '2017-04-09 19:10:40', '2017-04-09 19:19:30');
INSERT INTO `employee` VALUES ('7', '7', '14', '人事专员', '2', '1', '1', '2017-04-09 19:21:56', '2017-04-09 19:23:44');
INSERT INTO `employee` VALUES ('8', '8', '14', '人事部总监', '5', '6', '1', '2017-04-09 19:23:06', '2017-04-09 19:23:06');
INSERT INTO `employee` VALUES ('9', '9', '16', '物品管理员', '2', '1', '1', '2017-04-20 09:13:57', '2017-04-20 09:15:31');
INSERT INTO `employee` VALUES ('10', '10', '16', '物品管理组组长', '3', '2', '1', '2017-04-20 09:14:47', '2017-04-20 09:14:47');

-- ----------------------------
-- Table structure for `expense`
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Type` smallint(6) unsigned NOT NULL,
  `TotalAmounts` decimal(10,0) NOT NULL,
  `Detail` varchar(50) NOT NULL,
  `AttachMent` varchar(500) NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Application` varchar(50) NOT NULL,
  `ApplyTotalCount` int(14) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  `IsBack` tinyint(5) unsigned DEFAULT NULL,
  `GoodSDetailId` int(14) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for `goodsdetail`
-- ----------------------------
DROP TABLE IF EXISTS `goodsdetail`;
CREATE TABLE `goodsdetail` (
  `Unit` varchar(20) NOT NULL,
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `TotalCount` int(14) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `holidays`
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) NOT NULL,
  `Uid` int(11) unsigned NOT NULL,
  `TotalTime` varchar(45) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of holidays
-- ----------------------------

-- ----------------------------
-- Table structure for `leave`
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Type` varchar(50) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `Reason` varchar(100) NOT NULL,
  `AttachMent` varchar(500) DEFAULT NULL,
  `LongTime` varchar(50) NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES ('1', '2', '调休', '2017-04-04 00:00:00', '2017-04-05 23:59:00', 'asfnabsnfasb', '', '2', '2017-04-13 09:23:46', '2017-04-13 09:23:46');

-- ----------------------------
-- Table structure for `overtime`
-- ----------------------------
DROP TABLE IF EXISTS `overtime`;
CREATE TABLE `overtime` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `EqualizeType` varchar(50) NOT NULL,
  `IsOutside` varchar(10) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `LongTime` int(10) unsigned NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  `ExpireTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overtime
-- ----------------------------
INSERT INTO `overtime` VALUES ('1', '2', '加班费', '外勤', '2017-04-12 00:00:00', '2017-04-12 23:59:00', '1', '项目需求', '2017-04-13 08:55:44', '2017-04-13 08:55:44', '2017-10-25 09:32:08');
INSERT INTO `overtime` VALUES ('2', '2', '加班费', '外勤', '2017-04-04 00:00:00', '2017-04-07 23:59:00', '4', '项目需求', '2017-04-14 09:30:20', '2017-04-13 08:55:54', '2017-10-14 09:30:20');
INSERT INTO `overtime` VALUES ('3', '2', '加班费', '外勤', '2017-04-04 00:00:00', '2017-04-08 23:59:00', '5', '项目需求', '2017-04-13 08:56:05', '2017-04-13 08:56:05', null);
INSERT INTO `overtime` VALUES ('4', '2', '调休', '非外勤', '2017-04-06 00:00:00', '2017-04-08 23:59:00', '3', 'asvasvgqsg', '2017-04-14 09:33:52', '2017-04-14 09:33:52', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `overtimedetail`
-- ----------------------------
DROP TABLE IF EXISTS `overtimedetail`;
CREATE TABLE `overtimedetail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Uid` int(11) NOT NULL,
  `TotalTime` varchar(45) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overtimedetail
-- ----------------------------

-- ----------------------------
-- Table structure for `resume`
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(11) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Sex` varchar(3) NOT NULL,
  `Age` int(6) unsigned NOT NULL,
  `Eduction` text NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Tel` varchar(45) NOT NULL,
  `WorkExperience` text NOT NULL,
  `SelfQuality` varchar(45) NOT NULL,
  `Job` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume
-- ----------------------------

-- ----------------------------
-- Table structure for `returnrecord`
-- ----------------------------
DROP TABLE IF EXISTS `returnrecord`;
CREATE TABLE `returnrecord` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `GoodsName` varchar(100) NOT NULL,
  `Numbers` int(10) unsigned NOT NULL,
  `IsReturn` varchar(10) DEFAULT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  `ApplyTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of returnrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `reviewconfig`
-- ----------------------------
DROP TABLE IF EXISTS `reviewconfig`;
CREATE TABLE `reviewconfig` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Types` tinyint(5) unsigned NOT NULL,
  `Scene` varchar(50) NOT NULL,
  `Role` tinyint(5) unsigned NOT NULL,
  `Eid` smallint(8) unsigned NOT NULL,
  `Process` smallint(8) unsigned NOT NULL,
  `EndEid` smallint(8) NOT NULL,
  `EndUid` int(14) unsigned NOT NULL,
  `EndProcess` smallint(8) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewconfig
-- ----------------------------
INSERT INTO `reviewconfig` VALUES ('1', '1', 'leave', '1', '4', '2', '13', '7', '0', '2017-03-15 09:17:28', '2017-03-15 09:17:31');
INSERT INTO `reviewconfig` VALUES ('2', '2', 'leave', '1', '4', '3', '13', '7', '0', '2017-03-15 09:19:45', '2017-03-15 09:19:48');
INSERT INTO `reviewconfig` VALUES ('3', '3', 'leave', '1', '4', '3', '13', '7', '1', '2017-03-15 09:23:13', '2017-03-15 09:23:16');
INSERT INTO `reviewconfig` VALUES ('4', '1', 'leave', '2', '4', '1', '13', '7', '0', '2017-03-15 09:23:19', '2017-03-15 09:23:22');
INSERT INTO `reviewconfig` VALUES ('5', '2', 'leave', '2', '4', '2', '13', '7', '0', '2017-03-15 09:27:29', '2017-03-15 09:27:32');
INSERT INTO `reviewconfig` VALUES ('6', '3', 'leave', '2', '4', '2', '13', '7', '1', '2017-03-15 09:27:35', '2017-03-15 09:27:38');
INSERT INTO `reviewconfig` VALUES ('7', '1', 'leave', '3', '3', '1', '13', '7', '0', '2017-03-15 09:30:56', '2017-03-15 09:30:59');
INSERT INTO `reviewconfig` VALUES ('8', '2', 'leave', '3', '3', '2', '13', '7', '0', '2017-03-15 09:35:32', '2017-03-15 09:35:35');
INSERT INTO `reviewconfig` VALUES ('9', '3', 'leave', '3', '3', '2', '13', '7', '1', '2017-03-15 09:35:37', '2017-03-15 09:35:40');
INSERT INTO `reviewconfig` VALUES ('10', '1', 'leave', '4', '3', '1', '13', '7', '0', '2017-03-15 09:35:43', '2017-03-15 09:35:46');
INSERT INTO `reviewconfig` VALUES ('11', '2', 'leave', '4', '3', '1', '13', '7', '0', '2017-03-15 09:44:02', '2017-03-15 09:44:04');
INSERT INTO `reviewconfig` VALUES ('12', '3', 'leave', '4', '3', '2', '13', '7', '1', '2017-03-15 09:44:07', '2017-03-15 09:44:10');
INSERT INTO `reviewconfig` VALUES ('13', '1', 'leave', '5', '2', '1', '13', '7', '0', '2017-03-15 09:44:13', '2017-03-15 09:44:16');
INSERT INTO `reviewconfig` VALUES ('14', '2', 'leave', '5', '2', '1', '13', '7', '0', '2017-03-15 09:45:24', '2017-03-15 09:45:27');
INSERT INTO `reviewconfig` VALUES ('15', '3', 'leave', '5', '2', '1', '13', '7', '0', '2017-03-15 09:46:53', '2017-03-15 09:46:57');
INSERT INTO `reviewconfig` VALUES ('16', '1', 'leave', '6', '2', '0', '13', '7', '0', '2017-03-15 09:49:02', '2017-03-15 09:49:05');
INSERT INTO `reviewconfig` VALUES ('17', '2', 'leave', '6', '2', '0', '13', '7', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `reviewconfig` VALUES ('18', '3', 'leave', '6', '2', '0', '13', '7', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `reviewconfig` VALUES ('19', '1', 'overtime', '1', '4', '2', '0', '0', '0', '2017-04-14 09:00:16', '2017-04-15 09:00:23');
INSERT INTO `reviewconfig` VALUES ('20', '2', 'overtime', '1', '4', '3', '0', '0', '0', '2017-04-14 09:00:52', '2017-04-14 09:00:55');
INSERT INTO `reviewconfig` VALUES ('21', '3', 'overtime', '1', '4', '4', '0', '0', '0', '2017-04-23 09:01:43', '2017-04-29 09:01:47');
INSERT INTO `reviewconfig` VALUES ('22', '1', 'goods', '1', '4', '1', '0', '9', '0', '2017-04-20 09:19:47', '2017-04-20 09:19:50');
INSERT INTO `reviewconfig` VALUES ('23', '2', 'goods', '1', '4', '2', '0', '9', '0', '2017-04-20 09:21:04', '2017-04-20 09:21:07');
INSERT INTO `reviewconfig` VALUES ('24', '3', 'goods', '1', '4', '3', '0', '9', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `reviewconfig` VALUES ('25', '4', 'goods', '1', '4', '3', '0', '9', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `reviewnode`
-- ----------------------------
DROP TABLE IF EXISTS `reviewnode`;
CREATE TABLE `reviewnode` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `ReviewStatusId` int(14) unsigned NOT NULL,
  `OperateUid` int(14) unsigned NOT NULL,
  `Level` smallint(4) unsigned NOT NULL,
  `Status` tinyint(4) unsigned NOT NULL,
  `EndorseUid` int(14) unsigned DEFAULT '0',
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewnode
-- ----------------------------
INSERT INTO `reviewnode` VALUES ('1', '1', '4', '1', '2', '0', '2017-04-13 08:55:44', '2017-04-13 09:45:38', 'overtime');
INSERT INTO `reviewnode` VALUES ('2', '1', '5', '2', '2', '0', '2017-04-13 08:55:44', '2017-04-13 17:41:04', 'overtime');
INSERT INTO `reviewnode` VALUES ('3', '2', '4', '1', '2', '0', '2017-04-13 08:55:54', '2017-04-14 09:29:07', 'overtime');
INSERT INTO `reviewnode` VALUES ('4', '2', '5', '2', '2', '0', '2017-04-13 08:55:54', '2017-04-14 09:29:38', 'overtime');
INSERT INTO `reviewnode` VALUES ('5', '2', '6', '3', '2', '0', '2017-04-13 08:55:54', '2017-04-14 09:30:20', 'overtime');
INSERT INTO `reviewnode` VALUES ('15', '5', '6', '3', '1', '0', '2017-04-14 09:33:52', '2017-04-14 09:33:52', 'overtime');
INSERT INTO `reviewnode` VALUES ('14', '5', '5', '2', '1', '0', '2017-04-14 09:33:52', '2017-04-14 09:33:52', 'overtime');
INSERT INTO `reviewnode` VALUES ('13', '5', '4', '1', '2', '0', '2017-04-14 09:33:52', '2017-04-14 09:34:31', 'overtime');
INSERT INTO `reviewnode` VALUES ('10', '4', '4', '1', '2', '0', '2017-04-13 09:23:46', '2017-04-13 09:45:57', 'leave');
INSERT INTO `reviewnode` VALUES ('11', '4', '5', '2', '1', '0', '2017-04-13 09:23:46', '2017-04-13 09:23:46', 'leave');
INSERT INTO `reviewnode` VALUES ('12', '4', '7', '3', '1', '0', '2017-04-13 09:23:46', '2017-04-13 09:23:46', 'leave');

-- ----------------------------
-- Table structure for `reviewperson`
-- ----------------------------
DROP TABLE IF EXISTS `reviewperson`;
CREATE TABLE `reviewperson` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `ReviewStatusId` int(14) unsigned NOT NULL,
  `Auditor` int(14) unsigned NOT NULL,
  `Detail` varchar(100) DEFAULT 'null',
  `Status` tinyint(4) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Level` smallint(6) NOT NULL,
  `Uid` int(14) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewperson
-- ----------------------------
INSERT INTO `reviewperson` VALUES ('1', '1', '4', 'ok', '2', '2017-04-13 09:45:38', '2017-04-13 08:55:44', 'overtime', '1', '2');
INSERT INTO `reviewperson` VALUES ('2', '2', '4', 'ok！', '2', '2017-04-14 09:29:07', '2017-04-13 08:55:54', 'overtime', '1', '2');
INSERT INTO `reviewperson` VALUES ('4', '4', '4', 'ok！', '2', '2017-04-13 09:45:57', '2017-04-13 09:23:46', 'leave', '1', '2');
INSERT INTO `reviewperson` VALUES ('5', '1', '5', 'ok！', '2', '2017-04-13 17:41:04', '2017-04-13 09:45:38', 'overtime', '2', '2');
INSERT INTO `reviewperson` VALUES ('6', '4', '5', '', '1', '2017-04-13 09:45:57', '2017-04-13 09:45:57', 'leave', '2', '2');
INSERT INTO `reviewperson` VALUES ('7', '2', '5', 'ok!', '2', '2017-04-14 09:29:38', '2017-04-14 09:29:07', 'overtime', '2', '2');
INSERT INTO `reviewperson` VALUES ('8', '2', '6', 'ok！', '2', '2017-04-14 09:30:20', '2017-04-14 09:29:38', 'overtime', '3', '2');
INSERT INTO `reviewperson` VALUES ('9', '5', '4', 'ok！', '2', '2017-04-14 09:34:31', '2017-04-14 09:33:52', 'overtime', '1', '2');
INSERT INTO `reviewperson` VALUES ('10', '5', '5', '', '1', '2017-04-14 09:34:31', '2017-04-14 09:34:31', 'overtime', '2', '2');

-- ----------------------------
-- Table structure for `reviewstatus`
-- ----------------------------
DROP TABLE IF EXISTS `reviewstatus`;
CREATE TABLE `reviewstatus` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `ReviewId` int(14) unsigned NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Uid` int(14) unsigned NOT NULL,
  `Detail` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewstatus
-- ----------------------------
INSERT INTO `reviewstatus` VALUES ('1', '1', 'overtime', '2', '项目需求', '3', '2017-04-13 08:55:44', '2017-04-13 17:41:04');
INSERT INTO `reviewstatus` VALUES ('2', '2', 'overtime', '2', '项目需求', '3', '2017-04-13 08:55:54', '2017-04-14 09:30:20');
INSERT INTO `reviewstatus` VALUES ('3', '3', 'overtime', '2', '项目需求', '5', '2017-04-13 08:56:05', '2017-04-13 17:39:48');
INSERT INTO `reviewstatus` VALUES ('4', '1', 'leave', '2', 'asfnabsnfasb', '2', '2017-04-13 09:23:46', '2017-04-13 09:45:57');
INSERT INTO `reviewstatus` VALUES ('5', '4', 'overtime', '2', 'asvasvgqsg', '2', '2017-04-14 09:33:52', '2017-04-14 09:34:31');

-- ----------------------------
-- Table structure for `travel`
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Type` smallint(6) unsigned NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `LongTime` varchar(50) NOT NULL,
  `Reason` varchar(100) NOT NULL,
  `Destination` varchar(30) NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of travel
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Uid` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Salt` char(50) NOT NULL,
  `Password` char(64) NOT NULL,
  `Age` tinyint(8) unsigned NOT NULL,
  `Sex` smallint(3) unsigned NOT NULL,
  `Head` int(14) unsigned DEFAULT NULL,
  `Avatar` varchar(255) NOT NULL,
  `LastLoginIp` char(15) DEFAULT NULL,
  `ReLoginIp` char(15) DEFAULT NULL,
  `Created` datetime NOT NULL,
  `ReLoginTime` int(14) unsigned DEFAULT NULL,
  `LastLoginTime` int(14) DEFAULT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', 'admin', 'admin@qa.cn', 'UzwZNr', '606211b40d53991bdd1bcc2e5c2e692c571aa0200995df666c2d262a43839db5', '33', '2', '6', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:04:20', '0', '0', '2017-04-09 19:18:35');
INSERT INTO `user` VALUES ('2', '张超', 'chao', 'chao@qa.cn', '4j13Yp', '73323efbb00cafc00044787938d4c9586b499c164ca93d6c71ea10761b13d952', '26', '2', '4', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:06:14', '0', '0', '2017-04-09 19:19:08');
INSERT INTO `user` VALUES ('3', '嬴政', 'yingzheng', 'yingzheng@qa.cn', '4C3trP', 'b68a45af2d60d8a17be70067c2d439b1a268b33df7e90bba835896dcd4d20277', '40', '1', '1', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:07:16', '0', '0', '2017-04-09 19:07:16');
INSERT INTO `user` VALUES ('4', '王政', 'wangzheng', 'wangzheng@qa.cn', 'N8gY37', 'e139de3d01ebe9804157cab168fc3b08f30eaf13aabd3592193f4019b1e42c13', '30', '2', '5', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:08:18', '0', '0', '2017-04-09 19:19:45');
INSERT INTO `user` VALUES ('5', '李晓', 'lixiao', 'lixiao@qa.cn', 'bt0aFz', '40e28bb62ac6e48f85018f103ffa292d2888224e56c0f64714b7b5d2cf5f44c3', '32', '2', '6', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:09:34', '0', '0', '2017-04-09 19:19:16');
INSERT INTO `user` VALUES ('6', '张飞', 'zhangfei', 'zhangfei@qa.cn', 'dBsIpc', 'bcd1158cd08bedf4f6281b59c3cfd653882e7c2322333d1d5a6ba2e65cf7dd33', '34', '2', '3', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:10:40', '0', '0', '2017-04-09 19:19:30');
INSERT INTO `user` VALUES ('7', '李娟', 'lijuan', 'lijuan@qa.cn', 'i7y3ig', 'dfa5f274f73158ff2871b09f69495bd07f09edfab6806d681ed18da9bc17aea5', '30', '2', '8', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:21:56', '0', '0', '2017-04-09 19:23:44');
INSERT INTO `user` VALUES ('8', '王德', 'wangde', 'wangde@qa.cn', 'ZiNefr', '20b4c1f8760c7d750acdb7533e685250b24161b62e22a2714b6dd99f69018ad7', '34', '1', '3', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-09 19:23:06', '0', '0', '2017-04-09 19:23:06');
INSERT INTO `user` VALUES ('9', '李晓明', 'lixiaoming', 'lixiaoming@qa.cn', 'S6i3BG', '598107b2ba8fc1d57578117740f14f8491fbe533bbfc34bd9d9160a510c9df19', '32', '2', '10', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-20 09:13:57', '0', '0', '2017-04-20 09:15:31');
INSERT INTO `user` VALUES ('10', '郑晓', 'zhengxiao', 'zhengxiao@qa.cn', 'b0L450', '490f9108246d917c4822193a8745d16591279c2f7bb787e35840532400eb2352', '31', '1', '1', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-04-20 09:14:47', '0', '0', '2017-04-20 09:14:47');

-- ----------------------------
-- Table structure for `useradmire`
-- ----------------------------
DROP TABLE IF EXISTS `useradmire`;
CREATE TABLE `useradmire` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Guid` int(14) unsigned NOT NULL,
  `Types` tinyint(8) unsigned NOT NULL,
  `Status` tinyint(3) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useradmire
-- ----------------------------
INSERT INTO `useradmire` VALUES ('1', '5', '李晓', '1', '1', '0', '2017-05-05 08:58:25');
INSERT INTO `useradmire` VALUES ('2', '2', '张超', '1', '1', '0', '2017-05-05 08:59:03');

-- ----------------------------
-- Table structure for `userdetail`
-- ----------------------------
DROP TABLE IF EXISTS `userdetail`;
CREATE TABLE `userdetail` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Habit` varchar(255) NOT NULL,
  `Motto` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Eduction` varchar(255) NOT NULL,
  `PhoneNum` varchar(12) NOT NULL,
  `Birthday` datetime NOT NULL,
  `Skill` text NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `usertoken`
-- ----------------------------
DROP TABLE IF EXISTS `usertoken`;
CREATE TABLE `usertoken` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Token` char(64) NOT NULL,
  `ExpireTime` int(14) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertoken
-- ----------------------------

-- ----------------------------
-- Table structure for `yearholiday`
-- ----------------------------
DROP TABLE IF EXISTS `yearholiday`;
CREATE TABLE `yearholiday` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(11) unsigned NOT NULL,
  `TotalTime` varchar(45) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yearholiday
-- ----------------------------
