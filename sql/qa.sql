/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : qa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-02-21 09:55:42
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admire
-- ----------------------------
INSERT INTO `admire` VALUES ('1', '1', '1', '1', '2017-02-21 09:39:12', '2017-02-21 09:39:12');
INSERT INTO `admire` VALUES ('2', '1', '2', '1', '2017-02-21 09:40:23', '2017-02-21 09:40:23');
INSERT INTO `admire` VALUES ('3', '2', '1', '1', '2017-02-21 09:42:22', '2017-02-21 09:42:22');
INSERT INTO `admire` VALUES ('4', '2', '2', '1', '2017-02-21 09:43:58', '2017-02-21 09:43:58');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', '蓝瘦香菇', '<p>另外，南宁普通话的调子是十分婉转绵柔的，在说话的时候会呈现类似&ldquo;平仄平仄&rdquo;&ldquo;仄平平&rdquo;的起伏或者一线式的<a href=\"http://baike.baidu.com/view/1370558.htm\" target=\"_blank\">同调</a>，像唱歌一样有音律感。第四调的音有时会转为类似第一调的音。比如，&ldquo;这样是不行的&rdquo;，前面四个字用简谱表示就是&ldquo;6 6 6 6 &rdquo;(比如&ldquo;样&rdquo;就可以通过&ldquo;央&rdquo;字的简短发音发出来)，而后面两个字发音为&ldquo;x&iacute;ng dě&rdquo;。</p>\n\n<p>于是乎&ldquo;难受，想哭&rdquo;结合了南普的调子和壮调就变成了&ldquo;<a href=\"http://baike.baidu.com/item/%E8%93%9D%E7%98%A6%EF%BC%8C%E9%A6%99%E8%8F%87\" target=\"_blank\">蓝瘦，香菇</a>&rdquo;。当然，现在的年轻人经过在学校长时间的生活，普通话能够说得很好，但是各个地方说话的<a href=\"http://baike.baidu.com/view/92484.htm\" target=\"_blank\">音调</a>还是会在普通话中有所保留，就像北京有京腔一样，正所谓<a href=\"http://baike.baidu.com/view/604396.htm\" target=\"_blank\">乡音</a>难改。当然，近些年来在年轻人中间逐渐兴起<a href=\"http://baike.baidu.com/subview/67810/11102729.htm\" target=\"_blank\">模仿</a>中年人用不标准口音来交流的潮流，一方面是因为方言中有许多可以准确表达意思的精辟词汇难以用普通话来解释，另一方面地方口音拥有的特殊<a href=\"http://baike.baidu.com/subview/363017/12980408.htm\" target=\"_blank\">腔调</a>更加有韵味也更能表达出人的情感。特别是在河池地区都安县，这种潮流在年轻人中间体现出了明显的趋势。</p>\n\n<p>有了南普腔与壮调普通话的加成，也就难怪区区一个&ldquo;蓝瘦，香菇&rdquo;能够火遍祖国大江南北了。</p>\n\n<p>2016年12月14日，语言文字规范类刊物《咬文嚼字》杂志社发布了&ldquo;2016年十大流行语&rdquo;，&ldquo;蓝瘦，香菇&rdquo;入选。</p>\n', '蓝瘦香菇', '蓝瘦香菇', '随笔', '1', '1', '2', '0', '2017-02-21 09:39:27', '2017-02-21 09:38:04');
INSERT INTO `article` VALUES ('2', '1', 'PHP （超文本预处理器）', '<p>PHP（外文名:PHP: Hypertext Preprocessor，中文名：&ldquo;<a href=\"http://baike.baidu.com/view/156868.htm\" target=\"_blank\">超文本</a><a href=\"http://baike.baidu.com/view/499651.htm\" target=\"_blank\">预处理器</a>&rdquo;）是一种通用<a href=\"http://baike.baidu.com/view/9664.htm\" target=\"_blank\">开源</a><a href=\"http://baike.baidu.com/view/76320.htm\" target=\"_blank\">脚本语言</a>。<a href=\"http://baike.baidu.com/view/135635.htm\" target=\"_blank\">语法</a>吸收了<a href=\"http://baike.baidu.com/view/1219.htm\" target=\"_blank\">C语言</a>、<a href=\"http://baike.baidu.com/view/29.htm\" target=\"_blank\">Java</a>和<a href=\"http://baike.baidu.com/view/46614.htm\" target=\"_blank\">Perl</a>的特点，利于学习，使用<a href=\"http://baike.baidu.com/view/344354.htm\" target=\"_blank\">广泛</a>，主要适用于<a href=\"http://baike.baidu.com/view/3912.htm\" target=\"_blank\">Web</a>开发领域。PHP 独特的<a href=\"http://baike.baidu.com/view/135635.htm\" target=\"_blank\">语法</a>混合了<a href=\"http://baike.baidu.com/view/10075.htm\" target=\"_blank\">C</a>、<a href=\"http://baike.baidu.com/view/29.htm\" target=\"_blank\">Java</a>、<a href=\"http://baike.baidu.com/view/46614.htm\" target=\"_blank\">Perl</a>以及<a href=\"http://baike.baidu.com/view/99.htm\" target=\"_blank\">PHP</a>自创的语法。它可以比<a href=\"http://baike.baidu.com/view/32614.htm\" target=\"_blank\">CGI</a>或者<a href=\"http://baike.baidu.com/view/46614.htm\" target=\"_blank\">Perl</a>更快速地执行<a href=\"http://baike.baidu.com/view/348756.htm\" target=\"_blank\">动态网页</a>。用PHP做出的<a href=\"http://baike.baidu.com/view/2065821.htm\" target=\"_blank\">动态页面</a>与其他的<a href=\"http://baike.baidu.com/view/552871.htm\" target=\"_blank\">编程语言</a>相比，<a href=\"http://baike.baidu.com/subview/99/5828265.htm\" target=\"_blank\">PHP</a>是将<a href=\"http://baike.baidu.com/view/17674.htm\" target=\"_blank\">程序</a>嵌入到<a href=\"http://baike.baidu.com/view/692.htm\" target=\"_blank\">HTML</a>（<a href=\"http://baike.baidu.com/view/5286041.htm\" target=\"_blank\">标准通用标记语言</a>下的一个应用）文档中去执行，执行效率比完全生成<a href=\"http://baike.baidu.com/view/692.htm\" target=\"_blank\">HTML</a>标记的<a href=\"http://baike.baidu.com/subview/32614/12037322.htm\" target=\"_blank\">CGI</a>要高许多；PHP还可以执行<a href=\"http://baike.baidu.com/view/69568.htm\" target=\"_blank\">编译</a>后代码，编译可以达到<a href=\"http://baike.baidu.com/view/40927.htm\" target=\"_blank\">加密</a>和<a href=\"http://baike.baidu.com/view/548.htm\" target=\"_blank\">优化</a>代码运行，使代码运行更快。</p>\n', 'PHP （超文本预处理器）', 'PHP （超文本预处理器）', '技术分享', '1', '1', '4', '0', '2017-02-21 09:52:28', '2017-02-21 09:42:17');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of colorlife
-- ----------------------------
INSERT INTO `colorlife` VALUES ('1', '1', '蓝瘦香菇', '蓝瘦香菇', '蓝瘦香菇', '[\"http://localhost:8087/static/img/colorlife/9298f759e1d66eff70cbc1b2e821f3c9.jpg\",\"http://localhost:8087/static/img/colorlife/8045163b5990c53ed8c51d5ef4154485.jpg\",\"http://localhost:8087/static/img/colorlife/217de5017cd4fd34bdd0048845949280.jpg\"]', '1', '2', '0', '1', '2', '2017-02-21 09:55:13', '2017-02-21 09:40:15');
INSERT INTO `colorlife` VALUES ('2', '1', 'php', 'php', 'php', '[\"http://localhost:8087/static/img/colorlife/3c2718d334cf42f28725d422cb305b90.jpg\"]', '1', '2', '0', '1', '2', '2017-02-21 09:44:09', '2017-02-21 09:43:48');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '1', '好好笑', '1', '2017-02-21 09:39:22');
INSERT INTO `comment` VALUES ('2', '1', '1', '1', '很好笑', '1', '2017-02-21 09:39:27');
INSERT INTO `comment` VALUES ('3', '2', '1', '1', 'php', '1', '2017-02-21 09:42:28');
INSERT INTO `comment` VALUES ('4', '2', '1', '1', 'js', '1', '2017-02-21 09:42:32');
INSERT INTO `comment` VALUES ('5', '2', '1', '1', 'java', '1', '2017-02-21 09:42:39');
INSERT INTO `comment` VALUES ('6', '2', '1', '1', 'haokan\n', '2', '2017-02-21 09:44:03');
INSERT INTO `comment` VALUES ('7', '2', '1', '1', '很好看', '2', '2017-02-21 09:44:09');
INSERT INTO `comment` VALUES ('8', '2', '1', '1', 'lihao', '1', '2017-02-21 09:52:28');
INSERT INTO `comment` VALUES ('9', '1', '1', '1', '好看', '2', '2017-02-21 09:54:17');
INSERT INTO `comment` VALUES ('10', '1', '1', '1', '相当的好看', '2', '2017-02-21 09:55:13');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
  `Role` varchar(50) NOT NULL,
  `Manager` smallint(5) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Eid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', '9', '运维工程师', '2', '组长', '2', '2017-02-21 09:35:22', '2017-02-21 09:35:22');

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
  `Avatar` varchar(255) NOT NULL,
  `LastLoginIp` char(15) DEFAULT NULL,
  `ReLoginIp` char(15) DEFAULT NULL,
  `Created` datetime NOT NULL,
  `ReLoginTime` int(14) unsigned DEFAULT NULL,
  `LastLoginTime` int(14) DEFAULT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', 'admin', 'admin@qa.cn', '9WLfMX', '5175d0ba034d1f15c6942bb5bac85abbb9a9751af81bea16aec04a979cd88e2a', '27', '1', 'http://localhost:8087/static/img/user/5b8f068b4fef3673a45ff6d8cf66b34d.jpg', '', '', '2017-02-21 09:35:22', '0', '0', '2017-02-21 09:41:42');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useradmire
-- ----------------------------
INSERT INTO `useradmire` VALUES ('1', '1', '管理员', '1', '1', '0', '2017-02-21 09:39:12');
INSERT INTO `useradmire` VALUES ('2', '1', '管理员', '1', '2', '0', '2017-02-21 09:40:23');
INSERT INTO `useradmire` VALUES ('3', '1', '管理员', '2', '1', '0', '2017-02-21 09:42:22');
INSERT INTO `useradmire` VALUES ('4', '1', '管理员', '2', '2', '0', '2017-02-21 09:43:58');

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
