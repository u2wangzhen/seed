/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : seed_hx

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-04-23 22:08:35
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fruit
-- ----------------------------
INSERT INTO `t_fruit` VALUES ('30', 'menu');
INSERT INTO `t_fruit` VALUES ('31', 'menu');
INSERT INTO `t_fruit` VALUES ('32', 'model');
INSERT INTO `t_fruit` VALUES ('33', 'model');
INSERT INTO `t_fruit` VALUES ('34', 'model');
INSERT INTO `t_fruit` VALUES ('35', 'model');
INSERT INTO `t_fruit` VALUES ('37', 'model');
INSERT INTO `t_fruit` VALUES ('38', 'role');
INSERT INTO `t_fruit` VALUES ('39', 'account');
INSERT INTO `t_fruit` VALUES ('40', 'menu');
INSERT INTO `t_fruit` VALUES ('41', 'menu');
INSERT INTO `t_fruit` VALUES ('42', 'menu');
INSERT INTO `t_fruit` VALUES ('43', 'model');
INSERT INTO `t_fruit` VALUES ('44', 'model');
INSERT INTO `t_fruit` VALUES ('45', 'model');
INSERT INTO `t_fruit` VALUES ('46', 'model');
INSERT INTO `t_fruit` VALUES ('47', 'model');
INSERT INTO `t_fruit` VALUES ('48', 'model');
INSERT INTO `t_fruit` VALUES ('49', 'role');

-- ----------------------------
-- Table structure for `t_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_relation`;
CREATE TABLE `t_relation` (
  `id` varchar(36) NOT NULL,
  `main_id` bigint(20) NOT NULL,
  `other_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_relation
-- ----------------------------
INSERT INTO `t_relation` VALUES ('06fc59ea-839e-4885-a092-01a26b408aab', '38', '33');
INSERT INTO `t_relation` VALUES ('0c18844a-85fd-4e73-a821-9c725e8d9ee2', '49', '44');
INSERT INTO `t_relation` VALUES ('0d5a2177-1363-45f7-b9fc-83baaad2347c', '37', '31');
INSERT INTO `t_relation` VALUES ('122cad3c-7f35-48ba-ad91-769340e611ac', '48', '42');
INSERT INTO `t_relation` VALUES ('2c73ba12-d7d2-46b9-8369-33f5eb0a6f89', '49', '47');
INSERT INTO `t_relation` VALUES ('369d90ef-167f-4dfa-af5e-8654b73454ce', '43', '41');
INSERT INTO `t_relation` VALUES ('4de9d8d3-a60f-452d-9611-2bb199ca2c2a', '47', '40');
INSERT INTO `t_relation` VALUES ('52321a71-e8db-4cd1-8822-8770cdcbcb51', '38', '35');
INSERT INTO `t_relation` VALUES ('5725ffe5-803b-4995-bd4a-5d18fb1272d6', '46', '40');
INSERT INTO `t_relation` VALUES ('628b81e0-00a0-422d-ab9a-ee62d314b0b0', '41', '30');
INSERT INTO `t_relation` VALUES ('6535d583-e77a-475f-9f3a-b2413d11b37d', '49', '45');
INSERT INTO `t_relation` VALUES ('8046b017-669f-4569-a9a1-c3e293e2c957', '39', '38');
INSERT INTO `t_relation` VALUES ('8b78fe05-72d9-4254-a058-3777810fca4a', '38', '34');
INSERT INTO `t_relation` VALUES ('8bda9d6e-8d34-4304-9c2f-3e87d5819ca0', '40', '30');
INSERT INTO `t_relation` VALUES ('98ef681a-69e9-4c7a-9c1e-c73c7207eeab', '44', '41');
INSERT INTO `t_relation` VALUES ('9ddf379b-9503-4b91-94b7-6bc56b9c524b', '49', '48');
INSERT INTO `t_relation` VALUES ('9f7df2c7-2aa5-4040-b3a5-659783fdbb65', '33', '31');
INSERT INTO `t_relation` VALUES ('a16f1e58-e707-4a96-837a-a5fe41542af1', '42', '30');
INSERT INTO `t_relation` VALUES ('c0e7f483-fb44-431d-965c-908400a838d6', '49', '43');
INSERT INTO `t_relation` VALUES ('c232503b-1309-457b-bc49-7a0232e7e164', '45', '40');
INSERT INTO `t_relation` VALUES ('ebd17b63-a021-4c6b-bc50-1d9a09a2b0d2', '39', '49');
INSERT INTO `t_relation` VALUES ('f14193fa-4761-4fb6-9368-f1d975dcba68', '49', '46');
INSERT INTO `t_relation` VALUES ('f5c3840f-c90d-4f21-9fa6-8631f7ce0ebd', '38', '32');
INSERT INTO `t_relation` VALUES ('fb74e336-0b65-4a5e-a707-7390ef89fc62', '35', '31');
INSERT INTO `t_relation` VALUES ('fb7d98a0-68f2-46b5-a932-3cdbb8c8a313', '34', '31');
INSERT INTO `t_relation` VALUES ('fc516237-3c79-4115-a610-ad13c3b38193', '38', '37');
INSERT INTO `t_relation` VALUES ('fd8413f3-69ca-4577-b41a-05c15b8ef9b4', '32', '31');

-- ----------------------------
-- Table structure for `t_seed_128`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_128`;
CREATE TABLE `t_seed_128` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(128) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_128
-- ----------------------------
INSERT INTO `t_seed_128` VALUES ('36d50f53-7c7a-4aa8-b1bd-192dacae4b0e', 'password', '774cebe300467d94cbc4d9fdfa8fe5da', '39');

-- ----------------------------
-- Table structure for `t_seed_16`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_16`;
CREATE TABLE `t_seed_16` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(16) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_16
-- ----------------------------
INSERT INTO `t_seed_16` VALUES ('016fb7f9-4c50-41fc-985e-04e3c591fb38', 'account', 'admin', '39');

-- ----------------------------
-- Table structure for `t_seed_2`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_2`;
CREATE TABLE `t_seed_2` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(2) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_2
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_24`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_24`;
CREATE TABLE `t_seed_24` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(24) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_24
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_255`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_255`;
CREATE TABLE `t_seed_255` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(255) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_255
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_32`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_32`;
CREATE TABLE `t_seed_32` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(32) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_32
-- ----------------------------
INSERT INTO `t_seed_32` VALUES ('2a61130a-7c9f-4366-9d46-8b0b26d171f1', 'name', '薪资收入统计', '48');
INSERT INTO `t_seed_32` VALUES ('386acb87-ea66-45c8-a31c-f2900d6caced', 'name', '角色', '33');
INSERT INTO `t_seed_32` VALUES ('4e41c979-dec1-4302-98fa-b8bda7836113', 'name', '课程管理', '45');
INSERT INTO `t_seed_32` VALUES ('5f67e8fb-7af6-49a3-a4f6-3b1f46e2f866', 'name', '课务', '40');
INSERT INTO `t_seed_32` VALUES ('6976837b-45e5-4845-abf9-ad75a2f2988f', 'name', '模块', '35');
INSERT INTO `t_seed_32` VALUES ('7c8fdaaa-b459-4e1b-a5f7-fda467719795', 'name', '账号', '32');
INSERT INTO `t_seed_32` VALUES ('ad993497-b092-49a2-a36c-0bb26be697e0', 'name', '菜单', '34');
INSERT INTO `t_seed_32` VALUES ('aedd6b00-11fe-497f-97c9-e0bc0ffe53ef', 'name', '课时管理', '46');
INSERT INTO `t_seed_32` VALUES ('b5f700b6-738c-4792-93f6-0faf95cc5f0b', 'name', '课时账户', '47');
INSERT INTO `t_seed_32` VALUES ('bffda677-9761-4402-8f2e-7312551e4630', 'name', '统计', '42');
INSERT INTO `t_seed_32` VALUES ('c6abbf40-541e-4003-9dd7-4344f75e4a5a', 'name', '数据', '37');
INSERT INTO `t_seed_32` VALUES ('cb2e6bc3-9064-4d8a-ab3d-28bbe74d1f9a', 'name', '老师', '44');
INSERT INTO `t_seed_32` VALUES ('cb514dbc-fc3c-4b85-ab2b-b729693b0d52', 'name', '学生', '43');
INSERT INTO `t_seed_32` VALUES ('d0ae4c77-8391-405a-bee8-546c8e5175ef', 'name', '系统', '31');
INSERT INTO `t_seed_32` VALUES ('f067f1cc-da27-432a-ae9a-f4d3ee74ac6a', 'name', '应用', '30');
INSERT INTO `t_seed_32` VALUES ('f0b09cf3-fbe3-4645-836f-d02f69d11181', 'name', '资源', '41');

-- ----------------------------
-- Table structure for `t_seed_4`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_4`;
CREATE TABLE `t_seed_4` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(4) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_4
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seed_64`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_64`;
CREATE TABLE `t_seed_64` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(64) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_64
-- ----------------------------
INSERT INTO `t_seed_64` VALUES ('06ba2f81-fdcc-4958-99ed-e28703187b63', 'path', '/account', '32');
INSERT INTO `t_seed_64` VALUES ('228079be-5b24-425b-acd2-c7b50a6804c5', 'path', '/teacher', '44');
INSERT INTO `t_seed_64` VALUES ('28305fe6-57ce-4cb3-ac5a-9ea3b650eb68', 'path', '/period', '46');
INSERT INTO `t_seed_64` VALUES ('31346590-bc90-4043-abe4-5a193f2d94d0', 'path', '/model', '35');
INSERT INTO `t_seed_64` VALUES ('4ed0b8d2-b1ed-4425-9d37-9aab5891ae10', 'path', '/student', '43');
INSERT INTO `t_seed_64` VALUES ('64b3399b-e77e-4023-950d-41f4e2a5dd23', 'path', '/fruit', '37');
INSERT INTO `t_seed_64` VALUES ('91f5c352-9f97-44eb-b832-8bbd7f228cf6', 'path', '/classaccount', '47');
INSERT INTO `t_seed_64` VALUES ('ad849dcd-7d1d-4ad8-a1e8-f59debbd4bce', 'path', '/role', '33');
INSERT INTO `t_seed_64` VALUES ('cd6f56d3-2ea1-45c3-9f97-6dbd97559869', 'path', '/lesson', '45');
INSERT INTO `t_seed_64` VALUES ('dd2724da-2cd6-42f5-9f74-b9dca4e1201e', 'path', '/menu', '34');
INSERT INTO `t_seed_64` VALUES ('f14e124a-7b62-46ca-b64d-ebbb723017ff', 'path', '/total/toSalary', '48');

-- ----------------------------
-- Table structure for `t_seed_8`
-- ----------------------------
DROP TABLE IF EXISTS `t_seed_8`;
CREATE TABLE `t_seed_8` (
  `id` varchar(36) NOT NULL,
  `S_key` varchar(32) DEFAULT NULL,
  `S_value` varchar(8) DEFAULT NULL,
  `S_fid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_seed_8
-- ----------------------------
INSERT INTO `t_seed_8` VALUES ('26ca0329-711a-4ea0-bdbd-27d0e26120cf', 'name', '王震', '39');
INSERT INTO `t_seed_8` VALUES ('c260026d-38eb-4ee8-a393-7d600d5443d7', 'name', '学管', '49');
INSERT INTO `t_seed_8` VALUES ('d6853d1e-bd89-4da6-803c-33ca5f99282b', 'name', '管理员', '38');
