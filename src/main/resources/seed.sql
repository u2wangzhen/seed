/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : seed

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-03-22 21:16:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_fruit
-- ----------------------------
DROP TABLE IF EXISTS `t_fruit`;
CREATE TABLE `t_fruit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEY` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fruit
-- ----------------------------

-- ----------------------------
-- Table structure for t_seed_32
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_32`;
CREATE TABLE `t_seed_32` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(16) DEFAULT NULL,
  `S_value` varchar(32) DEFAULT NULL,
  `S_fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seed_32
-- ----------------------------
INSERT INTO `t_seed_32` VALUES ('1', '1', '1', '1');
INSERT INTO `t_seed_32` VALUES ('2', 'name', 'u2', '1');
INSERT INTO `t_seed_32` VALUES ('3', 'name', 'u2', '1');
