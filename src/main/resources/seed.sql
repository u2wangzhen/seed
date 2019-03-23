/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : seed

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-03-23 20:26:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_fruit`
-- ----------------------------
DROP TABLE IF EXISTS `t_fruit`;
CREATE TABLE `t_fruit` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `F_KEY` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fruit
-- ----------------------------
INSERT INTO `t_fruit` VALUES ('7', 'user');

-- ----------------------------
-- Table structure for `t_seed_32`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_32`;
CREATE TABLE `t_seed_32` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(16) DEFAULT NULL,
  `S_value` varchar(32) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seed_32
-- ----------------------------
INSERT INTO `t_seed_32` VALUES ('14', 'type', 'add', '7');
INSERT INTO `t_seed_32` VALUES ('15', 'name', 'wz', '7');
INSERT INTO `t_seed_32` VALUES ('16', 'age', '30', '7');
INSERT INTO `t_seed_32` VALUES ('17', 'password', 'gg', '7');
