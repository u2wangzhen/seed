/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : seed

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-04-18 22:36:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_fruit
-- ----------------------------
DROP TABLE IF EXISTS `t_fruit`;
CREATE TABLE `t_fruit` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `F_KEY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fruit
-- ----------------------------
INSERT INTO `t_fruit` VALUES ('60', 'menu');
INSERT INTO `t_fruit` VALUES ('61', 'menu');
INSERT INTO `t_fruit` VALUES ('62', 'menu');
INSERT INTO `t_fruit` VALUES ('65', 'menu');
INSERT INTO `t_fruit` VALUES ('66', 'model');
INSERT INTO `t_fruit` VALUES ('67', 'model');
INSERT INTO `t_fruit` VALUES ('70', 'model');
INSERT INTO `t_fruit` VALUES ('71', 'menu');
INSERT INTO `t_fruit` VALUES ('72', 'role');
INSERT INTO `t_fruit` VALUES ('73', 'model');
INSERT INTO `t_fruit` VALUES ('74', 'model');
INSERT INTO `t_fruit` VALUES ('75', 'model');
INSERT INTO `t_fruit` VALUES ('76', 'model');
INSERT INTO `t_fruit` VALUES ('77', 'account');
INSERT INTO `t_fruit` VALUES ('78', 'account');
INSERT INTO `t_fruit` VALUES ('79', 'role');
INSERT INTO `t_fruit` VALUES ('82', 'model');
INSERT INTO `t_fruit` VALUES ('87', 'model');
INSERT INTO `t_fruit` VALUES ('88', 'student');
INSERT INTO `t_fruit` VALUES ('89', 'teacher');
INSERT INTO `t_fruit` VALUES ('90', 'lesson');
INSERT INTO `t_fruit` VALUES ('91', 'price');
INSERT INTO `t_fruit` VALUES ('92', 'period');
INSERT INTO `t_fruit` VALUES ('93', 'menu');
INSERT INTO `t_fruit` VALUES ('94', 'model');
INSERT INTO `t_fruit` VALUES ('95', 'classaccount');
INSERT INTO `t_fruit` VALUES ('96', 'recharge');
INSERT INTO `t_fruit` VALUES ('97', 'student');
INSERT INTO `t_fruit` VALUES ('98', 'teacher');
INSERT INTO `t_fruit` VALUES ('99', 'teacher');
INSERT INTO `t_fruit` VALUES ('100', 'teacher');
INSERT INTO `t_fruit` VALUES ('101', 'teacher');
INSERT INTO `t_fruit` VALUES ('102', 'student');
INSERT INTO `t_fruit` VALUES ('103', 'student');
INSERT INTO `t_fruit` VALUES ('104', 'student');
INSERT INTO `t_fruit` VALUES ('105', 'student');
INSERT INTO `t_fruit` VALUES ('106', 'student');
INSERT INTO `t_fruit` VALUES ('107', 'lesson');
INSERT INTO `t_fruit` VALUES ('108', 'price');
INSERT INTO `t_fruit` VALUES ('109', 'price');
INSERT INTO `t_fruit` VALUES ('110', 'price');
INSERT INTO `t_fruit` VALUES ('111', 'lesson');
INSERT INTO `t_fruit` VALUES ('112', 'price');
INSERT INTO `t_fruit` VALUES ('113', 'price');
INSERT INTO `t_fruit` VALUES ('114', 'price');
INSERT INTO `t_fruit` VALUES ('115', 'price');
INSERT INTO `t_fruit` VALUES ('116', 'lesson');
INSERT INTO `t_fruit` VALUES ('117', 'price');
INSERT INTO `t_fruit` VALUES ('118', 'lesson');
INSERT INTO `t_fruit` VALUES ('119', 'price');
INSERT INTO `t_fruit` VALUES ('120', 'price');
INSERT INTO `t_fruit` VALUES ('121', 'price');
INSERT INTO `t_fruit` VALUES ('122', 'price');
INSERT INTO `t_fruit` VALUES ('123', 'price');
INSERT INTO `t_fruit` VALUES ('124', 'price');
INSERT INTO `t_fruit` VALUES ('125', 'price');
INSERT INTO `t_fruit` VALUES ('126', 'recharge');
INSERT INTO `t_fruit` VALUES ('128', 'lesson');
INSERT INTO `t_fruit` VALUES ('129', 'price');
INSERT INTO `t_fruit` VALUES ('130', 'price');
INSERT INTO `t_fruit` VALUES ('131', 'price');
INSERT INTO `t_fruit` VALUES ('132', 'price');
INSERT INTO `t_fruit` VALUES ('133', 'price');
INSERT INTO `t_fruit` VALUES ('134', 'period');
INSERT INTO `t_fruit` VALUES ('135', 'recharge');
INSERT INTO `t_fruit` VALUES ('136', 'period');
INSERT INTO `t_fruit` VALUES ('137', 'lesson');
INSERT INTO `t_fruit` VALUES ('138', 'price');
INSERT INTO `t_fruit` VALUES ('139', 'price');
INSERT INTO `t_fruit` VALUES ('140', 'price');
INSERT INTO `t_fruit` VALUES ('141', 'price');
INSERT INTO `t_fruit` VALUES ('142', 'lesson');
INSERT INTO `t_fruit` VALUES ('143', 'price');
INSERT INTO `t_fruit` VALUES ('144', 'price');
INSERT INTO `t_fruit` VALUES ('145', 'price');
INSERT INTO `t_fruit` VALUES ('146', 'price');
INSERT INTO `t_fruit` VALUES ('147', 'period');
INSERT INTO `t_fruit` VALUES ('148', 'classaccount');
INSERT INTO `t_fruit` VALUES ('149', 'recharge');

-- ----------------------------
-- Table structure for t_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_relation`;
CREATE TABLE `t_relation` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `main_id` bigint(20) NOT NULL,
  `other_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_relation
-- ----------------------------
INSERT INTO `t_relation` VALUES ('69', '62', '60');
INSERT INTO `t_relation` VALUES ('70', '65', '60');
INSERT INTO `t_relation` VALUES ('71', '66', '62');
INSERT INTO `t_relation` VALUES ('72', '67', '62');
INSERT INTO `t_relation` VALUES ('75', '70', '65');
INSERT INTO `t_relation` VALUES ('76', '71', '60');
INSERT INTO `t_relation` VALUES ('80', '73', '61');
INSERT INTO `t_relation` VALUES ('81', '74', '61');
INSERT INTO `t_relation` VALUES ('82', '75', '61');
INSERT INTO `t_relation` VALUES ('83', '76', '61');
INSERT INTO `t_relation` VALUES ('84', '77', '72');
INSERT INTO `t_relation` VALUES ('95', '78', '79');
INSERT INTO `t_relation` VALUES ('141', '82', '61');
INSERT INTO `t_relation` VALUES ('165', '87', '65');
INSERT INTO `t_relation` VALUES ('179', '90', '88');
INSERT INTO `t_relation` VALUES ('180', '90', '89');
INSERT INTO `t_relation` VALUES ('185', '91', '88');
INSERT INTO `t_relation` VALUES ('186', '91', '90');
INSERT INTO `t_relation` VALUES ('187', '92', '88');
INSERT INTO `t_relation` VALUES ('188', '92', '90');
INSERT INTO `t_relation` VALUES ('189', '93', '60');
INSERT INTO `t_relation` VALUES ('190', '94', '93');
INSERT INTO `t_relation` VALUES ('191', '79', '70');
INSERT INTO `t_relation` VALUES ('192', '79', '67');
INSERT INTO `t_relation` VALUES ('193', '79', '66');
INSERT INTO `t_relation` VALUES ('194', '79', '87');
INSERT INTO `t_relation` VALUES ('195', '79', '94');
INSERT INTO `t_relation` VALUES ('196', '72', '70');
INSERT INTO `t_relation` VALUES ('197', '72', '67');
INSERT INTO `t_relation` VALUES ('198', '72', '73');
INSERT INTO `t_relation` VALUES ('199', '72', '66');
INSERT INTO `t_relation` VALUES ('200', '72', '76');
INSERT INTO `t_relation` VALUES ('201', '72', '87');
INSERT INTO `t_relation` VALUES ('202', '72', '75');
INSERT INTO `t_relation` VALUES ('203', '72', '74');
INSERT INTO `t_relation` VALUES ('204', '72', '82');
INSERT INTO `t_relation` VALUES ('205', '72', '94');
INSERT INTO `t_relation` VALUES ('211', '107', '102');
INSERT INTO `t_relation` VALUES ('212', '107', '104');
INSERT INTO `t_relation` VALUES ('213', '107', '105');
INSERT INTO `t_relation` VALUES ('214', '107', '100');
INSERT INTO `t_relation` VALUES ('215', '108', '107');
INSERT INTO `t_relation` VALUES ('216', '108', '102');
INSERT INTO `t_relation` VALUES ('217', '109', '107');
INSERT INTO `t_relation` VALUES ('218', '109', '104');
INSERT INTO `t_relation` VALUES ('219', '110', '107');
INSERT INTO `t_relation` VALUES ('220', '110', '105');
INSERT INTO `t_relation` VALUES ('221', '111', '97');
INSERT INTO `t_relation` VALUES ('222', '111', '103');
INSERT INTO `t_relation` VALUES ('223', '111', '104');
INSERT INTO `t_relation` VALUES ('224', '111', '105');
INSERT INTO `t_relation` VALUES ('225', '111', '101');
INSERT INTO `t_relation` VALUES ('226', '112', '111');
INSERT INTO `t_relation` VALUES ('227', '112', '97');
INSERT INTO `t_relation` VALUES ('228', '113', '111');
INSERT INTO `t_relation` VALUES ('229', '113', '103');
INSERT INTO `t_relation` VALUES ('230', '114', '111');
INSERT INTO `t_relation` VALUES ('231', '114', '104');
INSERT INTO `t_relation` VALUES ('232', '115', '111');
INSERT INTO `t_relation` VALUES ('233', '115', '105');
INSERT INTO `t_relation` VALUES ('234', '116', '88');
INSERT INTO `t_relation` VALUES ('235', '116', '98');
INSERT INTO `t_relation` VALUES ('236', '117', '116');
INSERT INTO `t_relation` VALUES ('237', '117', '88');
INSERT INTO `t_relation` VALUES ('238', '118', '88');
INSERT INTO `t_relation` VALUES ('239', '118', '97');
INSERT INTO `t_relation` VALUES ('240', '118', '102');
INSERT INTO `t_relation` VALUES ('241', '118', '103');
INSERT INTO `t_relation` VALUES ('242', '118', '104');
INSERT INTO `t_relation` VALUES ('243', '118', '105');
INSERT INTO `t_relation` VALUES ('244', '118', '106');
INSERT INTO `t_relation` VALUES ('245', '118', '101');
INSERT INTO `t_relation` VALUES ('246', '119', '118');
INSERT INTO `t_relation` VALUES ('247', '119', '88');
INSERT INTO `t_relation` VALUES ('248', '120', '118');
INSERT INTO `t_relation` VALUES ('249', '120', '97');
INSERT INTO `t_relation` VALUES ('250', '121', '118');
INSERT INTO `t_relation` VALUES ('251', '121', '102');
INSERT INTO `t_relation` VALUES ('252', '122', '118');
INSERT INTO `t_relation` VALUES ('253', '122', '103');
INSERT INTO `t_relation` VALUES ('254', '123', '118');
INSERT INTO `t_relation` VALUES ('255', '123', '104');
INSERT INTO `t_relation` VALUES ('256', '124', '118');
INSERT INTO `t_relation` VALUES ('257', '124', '105');
INSERT INTO `t_relation` VALUES ('258', '125', '118');
INSERT INTO `t_relation` VALUES ('259', '125', '106');
INSERT INTO `t_relation` VALUES ('260', '96', '95');
INSERT INTO `t_relation` VALUES ('261', '126', '95');
INSERT INTO `t_relation` VALUES ('264', '128', '88');
INSERT INTO `t_relation` VALUES ('265', '128', '97');
INSERT INTO `t_relation` VALUES ('266', '128', '102');
INSERT INTO `t_relation` VALUES ('267', '128', '103');
INSERT INTO `t_relation` VALUES ('268', '128', '104');
INSERT INTO `t_relation` VALUES ('269', '128', '98');
INSERT INTO `t_relation` VALUES ('270', '129', '128');
INSERT INTO `t_relation` VALUES ('271', '129', '88');
INSERT INTO `t_relation` VALUES ('272', '130', '128');
INSERT INTO `t_relation` VALUES ('273', '130', '97');
INSERT INTO `t_relation` VALUES ('274', '131', '128');
INSERT INTO `t_relation` VALUES ('275', '131', '102');
INSERT INTO `t_relation` VALUES ('276', '132', '128');
INSERT INTO `t_relation` VALUES ('277', '132', '103');
INSERT INTO `t_relation` VALUES ('278', '133', '128');
INSERT INTO `t_relation` VALUES ('279', '133', '104');
INSERT INTO `t_relation` VALUES ('280', '134', '97');
INSERT INTO `t_relation` VALUES ('281', '134', '103');
INSERT INTO `t_relation` VALUES ('282', '134', '105');
INSERT INTO `t_relation` VALUES ('283', '134', '111');
INSERT INTO `t_relation` VALUES ('284', '135', '95');
INSERT INTO `t_relation` VALUES ('285', '95', '88');
INSERT INTO `t_relation` VALUES ('286', '95', '90');
INSERT INTO `t_relation` VALUES ('287', '136', '88');
INSERT INTO `t_relation` VALUES ('288', '136', '90');
INSERT INTO `t_relation` VALUES ('289', '137', '97');
INSERT INTO `t_relation` VALUES ('290', '137', '103');
INSERT INTO `t_relation` VALUES ('291', '137', '105');
INSERT INTO `t_relation` VALUES ('292', '137', '104');
INSERT INTO `t_relation` VALUES ('293', '137', '98');
INSERT INTO `t_relation` VALUES ('294', '138', '137');
INSERT INTO `t_relation` VALUES ('295', '138', '97');
INSERT INTO `t_relation` VALUES ('296', '139', '137');
INSERT INTO `t_relation` VALUES ('297', '139', '103');
INSERT INTO `t_relation` VALUES ('298', '140', '137');
INSERT INTO `t_relation` VALUES ('299', '140', '105');
INSERT INTO `t_relation` VALUES ('300', '141', '137');
INSERT INTO `t_relation` VALUES ('301', '141', '104');
INSERT INTO `t_relation` VALUES ('302', '142', '97');
INSERT INTO `t_relation` VALUES ('303', '142', '102');
INSERT INTO `t_relation` VALUES ('304', '142', '104');
INSERT INTO `t_relation` VALUES ('305', '142', '103');
INSERT INTO `t_relation` VALUES ('306', '142', '98');
INSERT INTO `t_relation` VALUES ('307', '143', '142');
INSERT INTO `t_relation` VALUES ('308', '143', '97');
INSERT INTO `t_relation` VALUES ('309', '144', '142');
INSERT INTO `t_relation` VALUES ('310', '144', '102');
INSERT INTO `t_relation` VALUES ('311', '145', '142');
INSERT INTO `t_relation` VALUES ('312', '145', '104');
INSERT INTO `t_relation` VALUES ('313', '146', '142');
INSERT INTO `t_relation` VALUES ('314', '146', '103');
INSERT INTO `t_relation` VALUES ('315', '147', '88');
INSERT INTO `t_relation` VALUES ('316', '147', '116');
INSERT INTO `t_relation` VALUES ('317', '148', '88');
INSERT INTO `t_relation` VALUES ('318', '148', '116');
INSERT INTO `t_relation` VALUES ('319', '149', '148');

-- ----------------------------
-- Table structure for t_seed_128
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_128`;
CREATE TABLE `t_seed_128` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(128) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_128
-- ----------------------------
INSERT INTO `t_seed_128` VALUES ('18', 'password', '123456', '77');
INSERT INTO `t_seed_128` VALUES ('19', 'password', '123456', '78');

-- ----------------------------
-- Table structure for t_seed_16
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_16`;
CREATE TABLE `t_seed_16` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(16) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_16
-- ----------------------------
INSERT INTO `t_seed_16` VALUES ('65', 'account', 'admin', '77');
INSERT INTO `t_seed_16` VALUES ('66', 'account', 'hx', '78');
INSERT INTO `t_seed_16` VALUES ('67', 'birthday', '2000-04-11', '88');
INSERT INTO `t_seed_16` VALUES ('68', 'createTime', '2019-04-16', '88');
INSERT INTO `t_seed_16` VALUES ('69', 'name', '佳悦', '88');
INSERT INTO `t_seed_16` VALUES ('70', 'birthday', '1986-04-16', '89');
INSERT INTO `t_seed_16` VALUES ('71', 'name', '贺老师', '89');
INSERT INTO `t_seed_16` VALUES ('72', 'tprice', '0', '90');
INSERT INTO `t_seed_16` VALUES ('73', 'bprice', '0', '90');
INSERT INTO `t_seed_16` VALUES ('74', 'createTime', '2019-04-16', '90');
INSERT INTO `t_seed_16` VALUES ('75', 'price', '234', '91');
INSERT INTO `t_seed_16` VALUES ('76', 'pdate', '2019-04-16', '92');
INSERT INTO `t_seed_16` VALUES ('77', 'date', '2019-04-18', '96');
INSERT INTO `t_seed_16` VALUES ('78', 'birthday', '2019-04-18', '97');
INSERT INTO `t_seed_16` VALUES ('79', 'createTime', '2019-04-17', '97');
INSERT INTO `t_seed_16` VALUES ('80', 'name', '熊浩明', '97');
INSERT INTO `t_seed_16` VALUES ('81', 'birthday', '2019-04-18', '98');
INSERT INTO `t_seed_16` VALUES ('82', 'name', '杨洋', '98');
INSERT INTO `t_seed_16` VALUES ('83', 'birthday', '2019-04-18', '99');
INSERT INTO `t_seed_16` VALUES ('84', 'name', '徐亮', '99');
INSERT INTO `t_seed_16` VALUES ('85', 'birthday', '2019-04-18', '100');
INSERT INTO `t_seed_16` VALUES ('86', 'name', '廖宁', '100');
INSERT INTO `t_seed_16` VALUES ('87', 'birthday', '2019-04-18', '101');
INSERT INTO `t_seed_16` VALUES ('88', 'name', '娜娜', '101');
INSERT INTO `t_seed_16` VALUES ('89', 'birthday', '2019-04-18', '102');
INSERT INTO `t_seed_16` VALUES ('90', 'createTime', '', '102');
INSERT INTO `t_seed_16` VALUES ('91', 'name', '冰玉', '102');
INSERT INTO `t_seed_16` VALUES ('92', 'birthday', '', '103');
INSERT INTO `t_seed_16` VALUES ('93', 'createTime', '', '103');
INSERT INTO `t_seed_16` VALUES ('94', 'name', '嘉琪', '103');
INSERT INTO `t_seed_16` VALUES ('95', 'birthday', '', '104');
INSERT INTO `t_seed_16` VALUES ('96', 'createTime', '', '104');
INSERT INTO `t_seed_16` VALUES ('97', 'name', '佳伟', '104');
INSERT INTO `t_seed_16` VALUES ('98', 'birthday', '', '105');
INSERT INTO `t_seed_16` VALUES ('99', 'createTime', '', '105');
INSERT INTO `t_seed_16` VALUES ('100', 'name', '知雨', '105');
INSERT INTO `t_seed_16` VALUES ('101', 'birthday', '', '106');
INSERT INTO `t_seed_16` VALUES ('102', 'createTime', '', '106');
INSERT INTO `t_seed_16` VALUES ('103', 'name', '海洋', '106');
INSERT INTO `t_seed_16` VALUES ('104', 'tprice', '0', '107');
INSERT INTO `t_seed_16` VALUES ('105', 'bprice', '0', '107');
INSERT INTO `t_seed_16` VALUES ('106', 'createTime', '2019-04-18', '107');
INSERT INTO `t_seed_16` VALUES ('107', 'price', '0', '108');
INSERT INTO `t_seed_16` VALUES ('108', 'price', '0', '109');
INSERT INTO `t_seed_16` VALUES ('109', 'price', '0', '110');
INSERT INTO `t_seed_16` VALUES ('110', 'tprice', '0', '111');
INSERT INTO `t_seed_16` VALUES ('111', 'bprice', '0', '111');
INSERT INTO `t_seed_16` VALUES ('112', 'createTime', '2019-04-18', '111');
INSERT INTO `t_seed_16` VALUES ('113', 'price', '0', '112');
INSERT INTO `t_seed_16` VALUES ('114', 'price', '0', '113');
INSERT INTO `t_seed_16` VALUES ('115', 'price', '0', '114');
INSERT INTO `t_seed_16` VALUES ('116', 'price', '0', '115');
INSERT INTO `t_seed_16` VALUES ('117', 'tprice', '0', '116');
INSERT INTO `t_seed_16` VALUES ('118', 'bprice', '0', '116');
INSERT INTO `t_seed_16` VALUES ('119', 'createTime', '2019-04-18', '116');
INSERT INTO `t_seed_16` VALUES ('120', 'price', '0', '117');
INSERT INTO `t_seed_16` VALUES ('121', 'tprice', '0', '118');
INSERT INTO `t_seed_16` VALUES ('122', 'bprice', '0', '118');
INSERT INTO `t_seed_16` VALUES ('123', 'createTime', '2019-04-18', '118');
INSERT INTO `t_seed_16` VALUES ('124', 'price', '0', '119');
INSERT INTO `t_seed_16` VALUES ('125', 'price', '0', '120');
INSERT INTO `t_seed_16` VALUES ('126', 'price', '0', '121');
INSERT INTO `t_seed_16` VALUES ('127', 'price', '0', '122');
INSERT INTO `t_seed_16` VALUES ('128', 'price', '0', '123');
INSERT INTO `t_seed_16` VALUES ('129', 'price', '0', '124');
INSERT INTO `t_seed_16` VALUES ('130', 'price', '0', '125');
INSERT INTO `t_seed_16` VALUES ('131', 'date', '2019-04-18', '126');
INSERT INTO `t_seed_16` VALUES ('133', 'tprice', '0', '128');
INSERT INTO `t_seed_16` VALUES ('134', 'bprice', '0', '128');
INSERT INTO `t_seed_16` VALUES ('135', 'createTime', '2019-04-18', '128');
INSERT INTO `t_seed_16` VALUES ('136', 'price', '0', '129');
INSERT INTO `t_seed_16` VALUES ('137', 'price', '0', '130');
INSERT INTO `t_seed_16` VALUES ('138', 'price', '0', '131');
INSERT INTO `t_seed_16` VALUES ('139', 'price', '0', '132');
INSERT INTO `t_seed_16` VALUES ('140', 'price', '0', '133');
INSERT INTO `t_seed_16` VALUES ('141', 'pdate', '2019-04-18', '134');
INSERT INTO `t_seed_16` VALUES ('142', 'date', '2019-04-18', '135');
INSERT INTO `t_seed_16` VALUES ('143', 'pdate', '2019-04-18', '136');
INSERT INTO `t_seed_16` VALUES ('144', 'tprice', '0', '137');
INSERT INTO `t_seed_16` VALUES ('145', 'bprice', '0', '137');
INSERT INTO `t_seed_16` VALUES ('146', 'createTime', '2019-04-18', '137');
INSERT INTO `t_seed_16` VALUES ('147', 'price', '0', '138');
INSERT INTO `t_seed_16` VALUES ('148', 'price', '0', '139');
INSERT INTO `t_seed_16` VALUES ('149', 'price', '0', '140');
INSERT INTO `t_seed_16` VALUES ('150', 'price', '0', '141');
INSERT INTO `t_seed_16` VALUES ('151', 'tprice', '0', '142');
INSERT INTO `t_seed_16` VALUES ('152', 'bprice', '0', '142');
INSERT INTO `t_seed_16` VALUES ('153', 'createTime', '2019-04-18', '142');
INSERT INTO `t_seed_16` VALUES ('154', 'price', '0', '143');
INSERT INTO `t_seed_16` VALUES ('155', 'price', '0', '144');
INSERT INTO `t_seed_16` VALUES ('156', 'price', '0', '145');
INSERT INTO `t_seed_16` VALUES ('157', 'price', '0', '146');
INSERT INTO `t_seed_16` VALUES ('158', 'pdate', '2019-04-18', '147');
INSERT INTO `t_seed_16` VALUES ('159', 'date', '2019-04-18', '149');

-- ----------------------------
-- Table structure for t_seed_2
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_2`;
CREATE TABLE `t_seed_2` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(2) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_2
-- ----------------------------
INSERT INTO `t_seed_2` VALUES ('38', 'sex', '女', '88');
INSERT INTO `t_seed_2` VALUES ('39', 'sex', '女', '89');
INSERT INTO `t_seed_2` VALUES ('40', 'sex', '男', '97');
INSERT INTO `t_seed_2` VALUES ('41', 'sex', '女', '98');
INSERT INTO `t_seed_2` VALUES ('42', 'sex', '男', '99');
INSERT INTO `t_seed_2` VALUES ('43', 'sex', '女', '100');
INSERT INTO `t_seed_2` VALUES ('44', 'sex', '女', '101');
INSERT INTO `t_seed_2` VALUES ('45', 'sex', '女', '102');
INSERT INTO `t_seed_2` VALUES ('46', 'sex', '男', '103');
INSERT INTO `t_seed_2` VALUES ('47', 'sex', '男', '104');
INSERT INTO `t_seed_2` VALUES ('48', 'sex', '女', '105');
INSERT INTO `t_seed_2` VALUES ('49', 'sex', '男', '106');

-- ----------------------------
-- Table structure for t_seed_24
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_24`;
CREATE TABLE `t_seed_24` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(24) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_24
-- ----------------------------
INSERT INTO `t_seed_24` VALUES ('18', 'startTime', '08:00:00', '92');
INSERT INTO `t_seed_24` VALUES ('19', 'endTime', '10:00:00', '92');
INSERT INTO `t_seed_24` VALUES ('22', 'startTime', '03:00:00', '134');
INSERT INTO `t_seed_24` VALUES ('23', 'endTime', '04:30:00', '134');
INSERT INTO `t_seed_24` VALUES ('24', 'startTime', '03:00:00', '136');
INSERT INTO `t_seed_24` VALUES ('25', 'endTime', '04:30:00', '136');
INSERT INTO `t_seed_24` VALUES ('26', 'startTime', '02:00:00', '147');
INSERT INTO `t_seed_24` VALUES ('27', 'endTime', '03:30:00', '147');

-- ----------------------------
-- Table structure for t_seed_255
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_255`;
CREATE TABLE `t_seed_255` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(255) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_255
-- ----------------------------
INSERT INTO `t_seed_255` VALUES ('38', 'remark', '', '88');
INSERT INTO `t_seed_255` VALUES ('39', 'remark', '', '89');
INSERT INTO `t_seed_255` VALUES ('40', 'remark', '', '91');
INSERT INTO `t_seed_255` VALUES ('41', 'remark', '', '92');
INSERT INTO `t_seed_255` VALUES ('42', 'remark', '1', '96');
INSERT INTO `t_seed_255` VALUES ('43', 'remark', '', '97');
INSERT INTO `t_seed_255` VALUES ('44', 'remark', '', '98');
INSERT INTO `t_seed_255` VALUES ('45', 'remark', '', '99');
INSERT INTO `t_seed_255` VALUES ('46', 'remark', '', '100');
INSERT INTO `t_seed_255` VALUES ('47', 'remark', '', '101');
INSERT INTO `t_seed_255` VALUES ('48', 'remark', '', '102');
INSERT INTO `t_seed_255` VALUES ('49', 'remark', '', '103');
INSERT INTO `t_seed_255` VALUES ('50', 'remark', '', '104');
INSERT INTO `t_seed_255` VALUES ('51', 'remark', '', '105');
INSERT INTO `t_seed_255` VALUES ('52', 'remark', '', '106');
INSERT INTO `t_seed_255` VALUES ('53', 'remark', '', '108');
INSERT INTO `t_seed_255` VALUES ('54', 'remark', '', '109');
INSERT INTO `t_seed_255` VALUES ('55', 'remark', '', '110');
INSERT INTO `t_seed_255` VALUES ('56', 'remark', '', '112');
INSERT INTO `t_seed_255` VALUES ('57', 'remark', '', '113');
INSERT INTO `t_seed_255` VALUES ('58', 'remark', '', '114');
INSERT INTO `t_seed_255` VALUES ('59', 'remark', '', '115');
INSERT INTO `t_seed_255` VALUES ('60', 'remark', '', '117');
INSERT INTO `t_seed_255` VALUES ('61', 'remark', '', '119');
INSERT INTO `t_seed_255` VALUES ('62', 'remark', '', '120');
INSERT INTO `t_seed_255` VALUES ('63', 'remark', '', '121');
INSERT INTO `t_seed_255` VALUES ('64', 'remark', '', '122');
INSERT INTO `t_seed_255` VALUES ('65', 'remark', '', '123');
INSERT INTO `t_seed_255` VALUES ('66', 'remark', '', '124');
INSERT INTO `t_seed_255` VALUES ('67', 'remark', '', '125');
INSERT INTO `t_seed_255` VALUES ('68', 'remark', '', '126');
INSERT INTO `t_seed_255` VALUES ('70', 'remark', '', '129');
INSERT INTO `t_seed_255` VALUES ('71', 'remark', '', '130');
INSERT INTO `t_seed_255` VALUES ('72', 'remark', '', '131');
INSERT INTO `t_seed_255` VALUES ('73', 'remark', '', '132');
INSERT INTO `t_seed_255` VALUES ('74', 'remark', '', '133');
INSERT INTO `t_seed_255` VALUES ('75', 'remark', '', '134');
INSERT INTO `t_seed_255` VALUES ('76', 'remark', '大大大', '135');
INSERT INTO `t_seed_255` VALUES ('77', 'remark', '', '136');
INSERT INTO `t_seed_255` VALUES ('78', 'remark', '', '138');
INSERT INTO `t_seed_255` VALUES ('79', 'remark', '', '139');
INSERT INTO `t_seed_255` VALUES ('80', 'remark', '', '140');
INSERT INTO `t_seed_255` VALUES ('81', 'remark', '', '141');
INSERT INTO `t_seed_255` VALUES ('82', 'remark', '', '143');
INSERT INTO `t_seed_255` VALUES ('83', 'remark', '', '144');
INSERT INTO `t_seed_255` VALUES ('84', 'remark', '', '145');
INSERT INTO `t_seed_255` VALUES ('85', 'remark', '', '146');
INSERT INTO `t_seed_255` VALUES ('86', 'remark', '', '147');
INSERT INTO `t_seed_255` VALUES ('87', 'remark', '', '149');

-- ----------------------------
-- Table structure for t_seed_32
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_32`;
CREATE TABLE `t_seed_32` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(32) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_32
-- ----------------------------
INSERT INTO `t_seed_32` VALUES ('18', 'name', '应用', '60');
INSERT INTO `t_seed_32` VALUES ('19', 'name', '系统', '61');
INSERT INTO `t_seed_32` VALUES ('20', 'name', '资源', '62');
INSERT INTO `t_seed_32` VALUES ('23', 'name', '课务', '65');
INSERT INTO `t_seed_32` VALUES ('24', 'name', '老师', '66');
INSERT INTO `t_seed_32` VALUES ('25', 'name', '学生', '67');
INSERT INTO `t_seed_32` VALUES ('28', 'name', '课程', '70');
INSERT INTO `t_seed_32` VALUES ('29', 'name', '统计', '71');
INSERT INTO `t_seed_32` VALUES ('30', 'name', '账号', '73');
INSERT INTO `t_seed_32` VALUES ('31', 'name', '角色', '74');
INSERT INTO `t_seed_32` VALUES ('32', 'name', '目录', '75');
INSERT INTO `t_seed_32` VALUES ('33', 'name', '模块', '76');
INSERT INTO `t_seed_32` VALUES ('36', 'name', '数据', '82');
INSERT INTO `t_seed_32` VALUES ('41', 'name', '课时', '87');
INSERT INTO `t_seed_32` VALUES ('42', 'name', '课时账户', '93');
INSERT INTO `t_seed_32` VALUES ('43', 'name', '课时账户', '94');

-- ----------------------------
-- Table structure for t_seed_4
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_4`;
CREATE TABLE `t_seed_4` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(4) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_4
-- ----------------------------
INSERT INTO `t_seed_4` VALUES ('29', 'grade', '高三', '90');
INSERT INTO `t_seed_4` VALUES ('30', 'phour', '2', '92');
INSERT INTO `t_seed_4` VALUES ('31', 'times', '10', '96');
INSERT INTO `t_seed_4` VALUES ('32', 'grade', '高二', '107');
INSERT INTO `t_seed_4` VALUES ('33', 'grade', '高二', '111');
INSERT INTO `t_seed_4` VALUES ('34', 'grade', '高三', '116');
INSERT INTO `t_seed_4` VALUES ('35', 'grade', '高三', '118');
INSERT INTO `t_seed_4` VALUES ('36', 'times', '5', '126');
INSERT INTO `t_seed_4` VALUES ('38', 'grade', '初三', '128');
INSERT INTO `t_seed_4` VALUES ('39', 'phour', '1.5', '134');
INSERT INTO `t_seed_4` VALUES ('40', 'times', '5', '135');
INSERT INTO `t_seed_4` VALUES ('41', 'phour', '1.5', '136');
INSERT INTO `t_seed_4` VALUES ('42', 'grade', '高三', '137');
INSERT INTO `t_seed_4` VALUES ('43', 'grade', '高三', '142');
INSERT INTO `t_seed_4` VALUES ('44', 'phour', '1.5', '147');
INSERT INTO `t_seed_4` VALUES ('45', 'times', '10', '149');

-- ----------------------------
-- Table structure for t_seed_64
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_64`;
CREATE TABLE `t_seed_64` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(64) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_64
-- ----------------------------
INSERT INTO `t_seed_64` VALUES ('39', 'path', '/teacher', '66');
INSERT INTO `t_seed_64` VALUES ('40', 'path', '/student', '67');
INSERT INTO `t_seed_64` VALUES ('43', 'path', '/lesson', '70');
INSERT INTO `t_seed_64` VALUES ('44', 'path', '/account', '73');
INSERT INTO `t_seed_64` VALUES ('45', 'path', '/role', '74');
INSERT INTO `t_seed_64` VALUES ('46', 'path', '/menu', '75');
INSERT INTO `t_seed_64` VALUES ('47', 'path', '/model', '76');
INSERT INTO `t_seed_64` VALUES ('50', 'path', '/fruit', '82');
INSERT INTO `t_seed_64` VALUES ('55', 'path', '/period', '87');
INSERT INTO `t_seed_64` VALUES ('56', 'school', '铁一', '88');
INSERT INTO `t_seed_64` VALUES ('57', 'name', '佳悦英语一对一', '90');
INSERT INTO `t_seed_64` VALUES ('58', 'path', '/classaccount', '94');
INSERT INTO `t_seed_64` VALUES ('59', 'name', '111', '95');
INSERT INTO `t_seed_64` VALUES ('60', 'school', '铁一', '97');
INSERT INTO `t_seed_64` VALUES ('61', 'school', '铁一', '102');
INSERT INTO `t_seed_64` VALUES ('62', 'school', '铁一', '103');
INSERT INTO `t_seed_64` VALUES ('63', 'school', '铁一', '104');
INSERT INTO `t_seed_64` VALUES ('64', 'school', '铁一', '105');
INSERT INTO `t_seed_64` VALUES ('65', 'school', '铁一', '106');
INSERT INTO `t_seed_64` VALUES ('66', 'name', '小班化学', '107');
INSERT INTO `t_seed_64` VALUES ('67', 'name', '小班英语', '111');
INSERT INTO `t_seed_64` VALUES ('68', 'name', '佳悦一对一', '116');
INSERT INTO `t_seed_64` VALUES ('69', 'name', '英语小班', '118');
INSERT INTO `t_seed_64` VALUES ('70', 'name', '杨洋小班数学', '128');
INSERT INTO `t_seed_64` VALUES ('71', 'name', 'new', '137');
INSERT INTO `t_seed_64` VALUES ('72', 'name', '按时发生', '142');
INSERT INTO `t_seed_64` VALUES ('73', 'name', '佳悦数学', '148');

-- ----------------------------
-- Table structure for t_seed_8
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_8`;
CREATE TABLE `t_seed_8` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(8) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_8
-- ----------------------------
INSERT INTO `t_seed_8` VALUES ('35', 'name', '管理员', '72');
INSERT INTO `t_seed_8` VALUES ('36', 'name', '王震', '77');
INSERT INTO `t_seed_8` VALUES ('37', 'name', '慧心', '78');
INSERT INTO `t_seed_8` VALUES ('38', 'name', '学管', '79');
INSERT INTO `t_seed_8` VALUES ('39', 'subject', '英语', '89');
INSERT INTO `t_seed_8` VALUES ('40', 'subject', '英语', '90');
INSERT INTO `t_seed_8` VALUES ('41', 'subject', '数学', '98');
INSERT INTO `t_seed_8` VALUES ('42', 'subject', '数学', '99');
INSERT INTO `t_seed_8` VALUES ('43', 'subject', '化学', '100');
INSERT INTO `t_seed_8` VALUES ('44', 'subject', '英语', '101');
INSERT INTO `t_seed_8` VALUES ('45', 'subject', '化学', '107');
INSERT INTO `t_seed_8` VALUES ('46', 'subject', '英语', '111');
INSERT INTO `t_seed_8` VALUES ('47', 'subject', '数学', '116');
INSERT INTO `t_seed_8` VALUES ('48', 'subject', '英语', '118');
INSERT INTO `t_seed_8` VALUES ('49', 'subject', '数学', '128');
INSERT INTO `t_seed_8` VALUES ('50', 'subject', '数学', '137');
INSERT INTO `t_seed_8` VALUES ('51', 'subject', '数学', '142');
