/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : qa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-03-31 10:24:16
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admire
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('1', '1', '1', '127.0.0.1', '2017-03-27 08:40:33', '2017-03-27 08:40:33');
INSERT INTO `attendance` VALUES ('2', '1', '1', '127.0.0.1', '2017-03-27 08:40:46', '2017-03-27 08:40:46');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of colorlife
-- ----------------------------
INSERT INTO `colorlife` VALUES ('1', '1', 'asfas', 'asdas', 'asdasd', '[\"http://localhost:8087/static/img/colorlife/e1375384d236e57392142090acdf5609.jpg\",\"http://localhost:8087/static/img/colorlife/4530d2cdd30a6da0cd822b8e2bd02810.jpg\",\"http://localhost:8087/static/img/colorlife/368d3d41bd459394c714e83164c40e99.jpg\"]', '0', '0', '0', '1', '2', '2017-03-22 08:53:59', '2017-03-22 08:53:59');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', '9', '运维工程师', '1', '1', '2', '2017-02-23 11:42:05', '2017-02-23 11:43:58');
INSERT INTO `employee` VALUES ('2', '2', '16', '物品申请管理', '2', '1', '1', '2017-02-27 08:38:16', '2017-02-27 09:11:40');
INSERT INTO `employee` VALUES ('3', '3', '16', '物品申请管理', '2', '1', '1', '2017-02-27 08:39:21', '2017-02-27 08:42:52');
INSERT INTO `employee` VALUES ('4', '4', '16', '后勤组管理员', '2', '2', '1', '2017-02-27 08:41:59', '2017-02-27 08:41:59');
INSERT INTO `employee` VALUES ('5', '5', '16', '考勤管理专员', '2', '1', '1', '2017-03-15 09:03:49', '2017-03-15 09:13:17');
INSERT INTO `employee` VALUES ('6', '6', '14', '人事总监', '3', '6', '1', '2017-03-15 09:05:24', '2017-03-15 09:05:24');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Application` varchar(50) DEFAULT NULL,
  `TotalCount` int(14) unsigned NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for `leave`
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------

-- ----------------------------
-- Table structure for `overtime`
-- ----------------------------
DROP TABLE IF EXISTS `overtime`;
CREATE TABLE `overtime` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Uid` int(14) unsigned NOT NULL,
  `Types` tinyint(5) unsigned NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `LongTime` int(10) unsigned NOT NULL,
  `Status` tinyint(5) unsigned NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `Updated` datetime NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overtime
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewconfig
-- ----------------------------
INSERT INTO `reviewconfig` VALUES ('1', '1', 'leave', '1', '2', '2', '13', '5', '0', '2017-03-15 09:17:28', '2017-03-15 09:17:31');
INSERT INTO `reviewconfig` VALUES ('2', '2', 'leave', '1', '2', '3', '13', '5', '0', '2017-03-15 09:19:45', '2017-03-15 09:19:48');
INSERT INTO `reviewconfig` VALUES ('3', '3', 'leave', '1', '2', '3', '13', '5', '1', '2017-03-15 09:23:13', '2017-03-15 09:23:16');
INSERT INTO `reviewconfig` VALUES ('4', '1', 'leave', '2', '2', '1', '13', '5', '0', '2017-03-15 09:23:19', '2017-03-15 09:23:22');
INSERT INTO `reviewconfig` VALUES ('5', '2', 'leave', '2', '2', '2', '13', '5', '0', '2017-03-15 09:27:29', '2017-03-15 09:27:32');
INSERT INTO `reviewconfig` VALUES ('6', '3', 'leave', '2', '2', '2', '13', '5', '1', '2017-03-15 09:27:35', '2017-03-15 09:27:38');
INSERT INTO `reviewconfig` VALUES ('7', '1', 'leave', '3', '2', '1', '13', '5', '0', '2017-03-15 09:30:56', '2017-03-15 09:30:59');
INSERT INTO `reviewconfig` VALUES ('8', '2', 'leave', '3', '2', '2', '13', '5', '0', '2017-03-15 09:35:32', '2017-03-15 09:35:35');
INSERT INTO `reviewconfig` VALUES ('9', '3', 'leave', '3', '2', '2', '13', '5', '1', '2017-03-15 09:35:37', '2017-03-15 09:35:40');
INSERT INTO `reviewconfig` VALUES ('10', '1', 'leave', '4', '2', '1', '13', '5', '0', '2017-03-15 09:35:43', '2017-03-15 09:35:46');
INSERT INTO `reviewconfig` VALUES ('11', '2', 'leave', '4', '2', '1', '13', '5', '0', '2017-03-15 09:44:02', '2017-03-15 09:44:04');
INSERT INTO `reviewconfig` VALUES ('12', '3', 'leave', '4', '2', '2', '13', '5', '1', '2017-03-15 09:44:07', '2017-03-15 09:44:10');
INSERT INTO `reviewconfig` VALUES ('13', '1', 'leave', '5', '2', '1', '13', '5', '0', '2017-03-15 09:44:13', '2017-03-15 09:44:16');
INSERT INTO `reviewconfig` VALUES ('14', '2', 'leave', '5', '2', '1', '13', '5', '0', '2017-03-15 09:45:24', '2017-03-15 09:45:27');
INSERT INTO `reviewconfig` VALUES ('15', '3', 'leave', '5', '2', '1', '13', '5', '0', '2017-03-15 09:46:53', '2017-03-15 09:46:57');
INSERT INTO `reviewconfig` VALUES ('16', '1', 'leave', '6', '2', '0', '13', '5', '0', '2017-03-15 09:49:02', '2017-03-15 09:49:05');
INSERT INTO `reviewconfig` VALUES ('17', '2', 'leave', '6', '2', '0', '13', '5', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `reviewconfig` VALUES ('18', '3', 'leave', '6', '2', '0', '13', '5', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewnode
-- ----------------------------

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
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewperson
-- ----------------------------

-- ----------------------------
-- Table structure for `reviewstatus`
-- ----------------------------
DROP TABLE IF EXISTS `reviewstatus`;
CREATE TABLE `reviewstatus` (
  `Id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  `Uid` int(14) unsigned NOT NULL,
  `Detail` varchar(100) NOT NULL,
  `Status` tinyint(4) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviewstatus
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', 'admin', 'admin@qa.cn', 'Tf6517', '96587636c8477aa646eac03bbd6ae8e8b957dd7b102bbb75bbbaad04e18ebc84', '33', '2', '1', 'http://localhost:8087/static/img/user/935f61ff2688db99066c140eb195ef35.jpg', '', '', '2017-02-23 11:42:05', '0', '0', '2017-03-14 09:44:44');
INSERT INTO `user` VALUES ('2', '李鑫', 'lixin', 'lixin@qa.cn', 'm1l43K', 'dff04244e0ede12dbdd5a35ec4364573901c687724b113aefc82d3d70d5ac478', '28', '2', '4', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-02-27 08:38:16', '0', '0', '2017-02-27 09:11:40');
INSERT INTO `user` VALUES ('3', '王珂', 'wangke', 'wangke@qa.cn', 'f608MT', '45a4f7983903feb8d621b9cc4ce1cad9e514da57ccf7d5826409dbb459f0adc6', '33', '2', '4', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-02-27 08:39:21', '0', '0', '2017-02-27 08:42:52');
INSERT INTO `user` VALUES ('4', '陈宁', 'chenning', 'chenning@qa.cn', '76KuZ1', '872c4a4215fa437b81f082f64e0103370b38748b21ba997038365690ce178f69', '36', '1', '1', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-02-27 08:41:59', '0', '0', '2017-02-27 08:42:12');
INSERT INTO `user` VALUES ('5', '李娟', 'lijuan', 'lijuan@qa.cn', 'fKiOZl', 'd8471d1a37dbfd23082fa77063e2bda437bbac2b0ce5d892efc5a0015fa51882', '32', '2', '6', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-03-15 09:03:49', '0', '0', '2017-03-15 09:13:17');
INSERT INTO `user` VALUES ('6', '张寅', 'zhangyin', 'zhangyin@qa.cn', '8Y446k', 'dab2c139a82732a794cb5b63d60a22e43ca7c8097762b811d69919bf7f184713', '34', '1', '1', 'http://localhost:8087/static/img/user/default.jpg', '', '', '2017-03-15 09:05:24', '0', '0', '2017-03-15 09:05:24');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useradmire
-- ----------------------------

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
