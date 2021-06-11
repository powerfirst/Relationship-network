/*
Navicat MySQL Data Transfer

Source Server         : ThiHouse
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : thihouse

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-04-07 18:05:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `evaluationID` int(11) NOT NULL,
  `inspirationID` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `evaluateTime` date NOT NULL,
  `evaluationNote` varchar(255) NOT NULL,
  PRIMARY KEY (`evaluationID`) USING BTREE,
  KEY `FK_evalution_inspiration` (`inspirationID`) USING BTREE,
  CONSTRAINT `FK_evalution_inspiration` FOREIGN KEY (`inspirationID`) REFERENCES `inspiration` (`inspirationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('1', '1', '4', '2', '2021-11-29', '暂无');
INSERT INTO `evaluation` VALUES ('2', '2', '5', '3', '2021-11-30', '暂无');
INSERT INTO `evaluation` VALUES ('3', '2', '4', '4', '2021-10-31', '暂无');
INSERT INTO `evaluation` VALUES ('4', '4', '3', '5', '2021-12-12', '暂无');
INSERT INTO `evaluation` VALUES ('5', '5', '3', '2', '2021-11-01', '暂无');

-- ----------------------------
-- Table structure for fruit
-- ----------------------------
DROP TABLE IF EXISTS `fruit`;
CREATE TABLE `fruit` (
  `fruitID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `fruitLink` varchar(255) NOT NULL,
  `PublishTime` date NOT NULL,
  PRIMARY KEY (`fruitID`) USING BTREE,
  KEY `FK_fruit_project` (`projectID`) USING BTREE,
  CONSTRAINT `FK_fruit_project` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fruit
-- ----------------------------
INSERT INTO `fruit` VALUES ('1', '1', '0000001', '2021-10-01');
INSERT INTO `fruit` VALUES ('2', '2', '0000002', '2021-11-29');
INSERT INTO `fruit` VALUES ('3', '3', '0000003', '2021-10-10');
INSERT INTO `fruit` VALUES ('4', '4', '0000004', '2021-09-29');
INSERT INTO `fruit` VALUES ('5', '5', '0000005', '2021-12-19');

-- ----------------------------
-- Table structure for inspiration
-- ----------------------------
DROP TABLE IF EXISTS `inspiration`;
CREATE TABLE `inspiration` (
  `inspirationID` int(11) NOT NULL,
  `sourceID` int(11) DEFAULT NULL,
  `citeTimes` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL,
  `typeID` int(11) NOT NULL,
  `inspirationName` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`inspirationID`) USING BTREE,
  KEY `FK_inspiration_type` (`typeID`) USING BTREE,
  KEY `FK_user` (`userID`) USING BTREE,
  CONSTRAINT `FK_inspiration_type` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`),
  CONSTRAINT `FK_inspiration_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of inspiration
-- ----------------------------
INSERT INTO `inspiration` VALUES ('1', '1', '100', '暂无', '1', 'CodeBar线上IT教育平台', '3');
INSERT INTO `inspiration` VALUES ('2', '2', '2', '暂无', '1', 'C-Match衣搭', '1');
INSERT INTO `inspiration` VALUES ('3', '3', '999', '暂无', '2', '智造乡村振兴“幸福网”', '6');
INSERT INTO `inspiration` VALUES ('4', '4', '0', '暂无', '3', '玩转东奥会', '8');
INSERT INTO `inspiration` VALUES ('5', '5', '0', '暂无', '4', 'MIS在线学堂', '3');

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `keyword` varchar(25) NOT NULL,
  `inspirationID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  KEY `FK_keyword_type` (`typeID`) USING BTREE,
  KEY `FK_keyword_inspiration` (`inspirationID`) USING BTREE,
  CONSTRAINT `FK_keyword_inspiration` FOREIGN KEY (`inspirationID`) REFERENCES `inspiration` (`inspirationID`),
  CONSTRAINT `FK_keyword_type` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of keyword
-- ----------------------------

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `partnerID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  PRIMARY KEY (`partnerID`) USING BTREE,
  KEY `FK_partner_user` (`userID`) USING BTREE,
  KEY `FK_parter_project` (`projectID`) USING BTREE,
  CONSTRAINT `FK_parter_project` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`),
  CONSTRAINT `FK_partner_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of partner
-- ----------------------------
INSERT INTO `partner` VALUES ('1', '1', '1');
INSERT INTO `partner` VALUES ('2', '4', '1');
INSERT INTO `partner` VALUES ('3', '8', '4');
INSERT INTO `partner` VALUES ('4', '6', '4');
INSERT INTO `partner` VALUES ('5', '2', '5');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `projectID` int(11) NOT NULL,
  `circleTime` date NOT NULL,
  `projectLink` varchar(255) NOT NULL,
  PRIMARY KEY (`projectID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '2021-08-26', '000000000001');
INSERT INTO `project` VALUES ('2', '2021-07-15', '123456789999');
INSERT INTO `project` VALUES ('3', '2021-07-09', '233333333333');
INSERT INTO `project` VALUES ('4', '2021-09-11', '121212121212');
INSERT INTO `project` VALUES ('5', '2021-07-22', '111111111111');

-- ----------------------------
-- Table structure for projectsource
-- ----------------------------
DROP TABLE IF EXISTS `projectsource`;
CREATE TABLE `projectsource` (
  `proSourceID` int(11) NOT NULL,
  `inspirationID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  PRIMARY KEY (`proSourceID`) USING BTREE,
  KEY `FK_projecsourse_project` (`projectID`) USING BTREE,
  KEY `FK_projecsourse_inspiration` (`inspirationID`) USING BTREE,
  CONSTRAINT `FK_projecsourse_inspiration` FOREIGN KEY (`inspirationID`) REFERENCES `inspiration` (`inspirationID`),
  CONSTRAINT `FK_projecsourse_project` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of projectsource
-- ----------------------------
INSERT INTO `projectsource` VALUES ('1', '1', '1');
INSERT INTO `projectsource` VALUES ('2', '2', '2');
INSERT INTO `projectsource` VALUES ('3', '3', '3');
INSERT INTO `projectsource` VALUES ('4', '4', '4');
INSERT INTO `projectsource` VALUES ('5', '5', '5');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeID` int(11) NOT NULL,
  `typeName` varchar(10) NOT NULL,
  PRIMARY KEY (`typeID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `userID` int(11) NOT NULL,
  `userName` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `loginTime` date NOT NULL,
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Muhammad', '88888888', '2021-04-05');
INSERT INTO `user` VALUES ('2', 'Hudson', '66666666', '2021-04-28');
INSERT INTO `user` VALUES ('3', 'Lyla', '12121212', '2021-05-21');
INSERT INTO `user` VALUES ('4', 'Jasper', '35353535', '2021-06-02');
INSERT INTO `user` VALUES ('5', 'Talia', '12345678', '2021-04-29');
INSERT INTO `user` VALUES ('6', 'Anaya', '00000000', '2021-05-11');
INSERT INTO `user` VALUES ('7', 'Eliana', '55555555', '2020-11-29');
INSERT INTO `user` VALUES ('8', 'Ayaan', '23333333', '2021-04-07');
