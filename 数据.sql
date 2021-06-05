/*
Navicat MySQL Data Transfer

Source Server         : ThiHouse
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : gai1

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-04-05 22:36:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `evaluationID` varchar(15) NOT NULL,
  `inspirationID` varchar(15) NOT NULL,
  `star` int(1) NOT NULL,
  `userID` varchar(15) NOT NULL,
  `evaluateTime` date NOT NULL,
  `evaluationNote` varchar(255) NOT NULL,
  PRIMARY KEY (`evaluationID`),
  KEY `FK_evalution_inspiration` (`inspirationID`),
  CONSTRAINT `FK_evalution_inspiration` FOREIGN KEY (`inspirationID`) REFERENCES `inspiration` (`inspirationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('0000000001', '000000000000001', '4', '000000000000002', '2021-11-29', '暂无');
INSERT INTO `evaluation` VALUES ('0000000002', '000000000000002', '5', '000000000000003', '2021-11-30', '暂无');
INSERT INTO `evaluation` VALUES ('0000000003', '000000000000002', '4', '000000000000004', '2021-10-31', '暂无');
INSERT INTO `evaluation` VALUES ('0000000004', '000000000000004', '3', '000000000000005', '2021-12-12', '暂无');
INSERT INTO `evaluation` VALUES ('0000000005', '000000000000005', '3', '000000000000002', '2021-11-01', '暂无');

-- ----------------------------
-- Table structure for fruit
-- ----------------------------
DROP TABLE IF EXISTS `fruit`;
CREATE TABLE `fruit` (
  `fruitID` varchar(15) NOT NULL,
  `projectID` varchar(15) NOT NULL,
  `fruitLink` varchar(255) NOT NULL,
  `PublishTime` date NOT NULL,
  PRIMARY KEY (`fruitID`),
  KEY `FK_fruit_project` (`projectID`),
  CONSTRAINT `FK_fruit_project` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fruit
-- ----------------------------
INSERT INTO `fruit` VALUES ('00001', '0000000000001', '0000001', '2021-10-01');
INSERT INTO `fruit` VALUES ('00002', '0000000000002', '0000002', '2021-11-29');
INSERT INTO `fruit` VALUES ('00003', '0000000000003', '0000003', '2021-10-10');
INSERT INTO `fruit` VALUES ('00004', '0000000000004', '0000004', '2021-09-29');
INSERT INTO `fruit` VALUES ('00005', '0000000000005', '0000005', '2021-12-19');

-- ----------------------------
-- Table structure for inspiration
-- ----------------------------
DROP TABLE IF EXISTS `inspiration`;
CREATE TABLE `inspiration` (
  `inspirationID` varchar(15) NOT NULL,
  `sourceID` varchar(15) DEFAULT NULL,
  `citeTimes` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL,
  `typeID` int(11) NOT NULL,
  `inspirationName` varchar(255) NOT NULL,
  PRIMARY KEY (`inspirationID`),
  KEY `FK_inspiration_type` (`typeID`),
  CONSTRAINT `FK_inspiration_type` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspiration
-- ----------------------------
INSERT INTO `inspiration` VALUES ('000000000000001', '000000000000001', '100', '暂无', '1', 'CodeBar线上IT教育平台');
INSERT INTO `inspiration` VALUES ('000000000000002', '000000000000002', '2', '暂无', '1', 'C-Match衣搭');
INSERT INTO `inspiration` VALUES ('000000000000003', '000000000000003', '999', '暂无', '2', '智造乡村振兴“幸福网”');
INSERT INTO `inspiration` VALUES ('000000000000004', '000000000000004', '0', '暂无', '3', '玩转东奥会');
INSERT INTO `inspiration` VALUES ('000000000000005', '000000000000005', '0', '暂无', '4', 'MIS在线学堂');

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `keyword` varchar(25) NOT NULL,
  `inspirationID` varchar(15) NOT NULL,
  `typeID` int(11) NOT NULL,
  KEY `FK_keyword_type` (`typeID`),
  KEY `FK_keyword_inspiration` (`inspirationID`),
  CONSTRAINT `FK_keyword_inspiration` FOREIGN KEY (`inspirationID`) REFERENCES `inspiration` (`inspirationID`),
  CONSTRAINT `FK_keyword_type` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keyword
-- ----------------------------

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `partnerID` varchar(15) NOT NULL,
  `userID` varchar(15) NOT NULL,
  `projectID` varchar(15) NOT NULL,
  PRIMARY KEY (`partnerID`),
  KEY `FK_partner_user` (`userID`),
  KEY `FK_parter_project` (`projectID`),
  CONSTRAINT `FK_parter_project` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`),
  CONSTRAINT `FK_partner_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partner
-- ----------------------------
INSERT INTO `partner` VALUES ('001', '0000000001', '0000000000001');
INSERT INTO `partner` VALUES ('002', '0000000004', '0000000000001');
INSERT INTO `partner` VALUES ('003', '0000000008', '0000000000004');
INSERT INTO `partner` VALUES ('004', '0000000006', '0000000000004');
INSERT INTO `partner` VALUES ('005', '0000000002', '0000000000005');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `projectID` varchar(15) NOT NULL,
  `circleTime` date NOT NULL,
  `projectLink` varchar(255) NOT NULL,
  PRIMARY KEY (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('0000000000001', '2021-08-26', '000000000001');
INSERT INTO `project` VALUES ('0000000000002', '2021-07-15', '123456789999');
INSERT INTO `project` VALUES ('0000000000003', '2021-07-09', '233333333333');
INSERT INTO `project` VALUES ('0000000000004', '2021-09-11', '121212121212');
INSERT INTO `project` VALUES ('0000000000005', '2021-07-22', '111111111111');

-- ----------------------------
-- Table structure for projectsource
-- ----------------------------
DROP TABLE IF EXISTS `projectsource`;
CREATE TABLE `projectsource` (
  `proSourceID` varchar(15) NOT NULL,
  `inspirationID` varchar(15) NOT NULL,
  `projectID` varchar(15) NOT NULL,
  PRIMARY KEY (`proSourceID`),
  KEY `FK_projecsourse_project` (`projectID`),
  KEY `FK_projecsourse_inspiration` (`inspirationID`),
  CONSTRAINT `FK_projecsourse_inspiration` FOREIGN KEY (`inspirationID`) REFERENCES `inspiration` (`inspirationID`),
  CONSTRAINT `FK_projecsourse_project` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectsource
-- ----------------------------
INSERT INTO `projectsource` VALUES ('0001', '000000000000001', '0000000000001');
INSERT INTO `projectsource` VALUES ('0002', '000000000000002', '0000000000002');
INSERT INTO `projectsource` VALUES ('0003', '000000000000003', '0000000000003');
INSERT INTO `projectsource` VALUES ('0004', '000000000000004', '0000000000004');
INSERT INTO `projectsource` VALUES ('0005', '000000000000005', '0000000000005');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeID` int(15) NOT NULL,
  `typeName` varchar(10) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '程序设计应用');
INSERT INTO `type` VALUES ('2', '信息可视化设计');
INSERT INTO `type` VALUES ('3', '多媒体');
INSERT INTO `type` VALUES ('4', '数据库应用系统');
INSERT INTO `type` VALUES ('5', '工业设计');
INSERT INTO `type` VALUES ('6', '园林设计');
INSERT INTO `type` VALUES ('7', '生活');
INSERT INTO `type` VALUES ('8', '其他');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` varchar(15) NOT NULL,
  `userName` varchar(15) NOT NULL,
  `contribution` varchar(255) DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  `loginTime` date NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0000000001', 'Muhammad', '4', '88888888', '2021-04-05');
INSERT INTO `user` VALUES ('0000000002', 'Hudson', '3.5', '66666666', '2021-04-28');
INSERT INTO `user` VALUES ('0000000003', 'Lyla', '4.5', '12121212', '2021-05-21');
INSERT INTO `user` VALUES ('0000000004', ' Jasper', '1', '35353535', '2021-06-02');
INSERT INTO `user` VALUES ('0000000005', 'Talia', '4.5', '12345678', '2021-04-29');
INSERT INTO `user` VALUES ('0000000006', 'Anaya', '4.2', '00000000', '2021-05-11');
INSERT INTO `user` VALUES ('0000000007', 'Eliana', '4.8', '55555555', '2020-11-29');
INSERT INTO `user` VALUES ('0000000008', 'Ayaan', '3.5', '23333333', '2021-04-07');
