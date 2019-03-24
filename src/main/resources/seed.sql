/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : seed

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-03-24 20:51:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_fruit`
-- ----------------------------
DROP TABLE IF EXISTS `t_fruit`;
CREATE TABLE `t_fruit` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `F_KEY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fruit
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_11`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_11`;
CREATE TABLE `t_seed_11` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(16) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_11
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_128`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_128`;
CREATE TABLE `t_seed_128` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(128) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_128
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_16`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_16`;
CREATE TABLE `t_seed_16` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(16) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_16
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_255`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_255`;
CREATE TABLE `t_seed_255` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(255) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_255
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_32`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_32`;
CREATE TABLE `t_seed_32` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(32) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seed_32
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_64`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_64`;
CREATE TABLE `t_seed_64` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(64) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_64
-- ----------------------------
