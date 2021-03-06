/*
Navicat MySQL Data Transfer

Source Server         : ThiHouse
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : thihouse

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-04-04 14:30:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `evaluationID` varchar(15) NOT NULL,
  `inspirationID*` varchar(15) NOT NULL,
  `star` int(1) NOT NULL,
  `userID` varchar(15) NOT NULL,
  `evaluateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `evaluationNote` varchar(255) NOT NULL,
  PRIMARY KEY (`evaluationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for fruit
-- ----------------------------
DROP TABLE IF EXISTS `fruit`;
CREATE TABLE `fruit` (
  `fruitID` varchar(15) NOT NULL,
  `projectID` varchar(15) NOT NULL,
  `fruitLink` varchar(255) NOT NULL,
  `PublishTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fruitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fruit
-- ----------------------------

-- ----------------------------
-- Table structure for inspiration
-- ----------------------------
DROP TABLE IF EXISTS `inspiration`;
CREATE TABLE `inspiration` (
  `inspirationID` varchar(15) NOT NULL,
  `sourceID` varchar(15),
  `citeTimes` int NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL,
  `typeID` int NOT NULL,
  PRIMARY KEY (`inspirationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspiration
-- ----------------------------

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `keyword` varchar(25) NOT NULL,
  `inspirationID` varchar(15) NOT NULL,
  `typeID` int NOT NULL
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
  `projectID*` varchar(15) NOT NULL,
  PRIMARY KEY (`partnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partner
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `projectID` varchar(15) NOT NULL,
  `,circleTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `projectLink` varchar(255) NOT NULL,
  PRIMARY KEY (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for projectsource
-- ----------------------------
DROP TABLE IF EXISTS `projectsource`;
CREATE TABLE `projectsource` (
  `proSourceID` varchar(15) NOT NULL,
  `inspirationID` varchar(15),
  `projectID` varchar(15) NOT NULL,
  PRIMARY KEY (`proSourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectsource
-- ----------------------------

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

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` varchar(15) NOT NULL,
  `userName` varchar(15) NOT NULL,
  `contribution` varchar(255) DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  `loginTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
