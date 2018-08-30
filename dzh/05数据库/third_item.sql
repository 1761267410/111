/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : third_item

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-08-07 23:37:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for f_class
-- ----------------------------
DROP TABLE IF EXISTS `f_class`;
CREATE TABLE `f_class` (
  `classid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `classname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classother` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_class
-- ----------------------------
INSERT INTO `f_class` VALUES ('0001', '一班', null, '0001');
INSERT INTO `f_class` VALUES ('0002', '二班', '', '0001');
INSERT INTO `f_class` VALUES ('0003', '三班', '', '0001');
INSERT INTO `f_class` VALUES ('0004', '四班', null, '0001');
INSERT INTO `f_class` VALUES ('0005', '五班', null, '0001');
INSERT INTO `f_class` VALUES ('0011', '一班', '', '0002');
INSERT INTO `f_class` VALUES ('0012', '二班', '', '0002');
INSERT INTO `f_class` VALUES ('0013', '三班', '', '0002');
INSERT INTO `f_class` VALUES ('0014', '四班', '', '0002');
INSERT INTO `f_class` VALUES ('0015', '五班', '', '0002');
INSERT INTO `f_class` VALUES ('0021', '一班', '', '0003');
INSERT INTO `f_class` VALUES ('0022', '二班', '', '0003');
INSERT INTO `f_class` VALUES ('0023', '三班', '', '0003');
INSERT INTO `f_class` VALUES ('0024', '四班', '', '0003');
INSERT INTO `f_class` VALUES ('0025', '五班', '', '0003');
INSERT INTO `f_class` VALUES ('0031', '一班', '', '0004');
INSERT INTO `f_class` VALUES ('0032', '二班', '', '0004');
INSERT INTO `f_class` VALUES ('0033', '三班', '', '0004');
INSERT INTO `f_class` VALUES ('0034', '四班', '', '0004');
INSERT INTO `f_class` VALUES ('0035', '五班', '', '0004');
INSERT INTO `f_class` VALUES ('0041', '一班', '', '0005');
INSERT INTO `f_class` VALUES ('0042', '二班', '', '0005');
INSERT INTO `f_class` VALUES ('0043', '三班', '', '0005');
INSERT INTO `f_class` VALUES ('0044', '四班', '', '0005');
INSERT INTO `f_class` VALUES ('0045', '五班', '', '0005');

-- ----------------------------
-- Table structure for f_dep
-- ----------------------------
DROP TABLE IF EXISTS `f_dep`;
CREATE TABLE `f_dep` (
  `depid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `depname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depother` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`depid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_dep
-- ----------------------------
INSERT INTO `f_dep` VALUES ('0001', '软件学院', '');
INSERT INTO `f_dep` VALUES ('0002', '化工系', '');
INSERT INTO `f_dep` VALUES ('0003', '海峡学院', '');
INSERT INTO `f_dep` VALUES ('0004', '计算机系', '');
INSERT INTO `f_dep` VALUES ('0005', '外语系', '');

-- ----------------------------
-- Table structure for f_flow
-- ----------------------------
DROP TABLE IF EXISTS `f_flow`;
CREATE TABLE `f_flow` (
  `flowId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creater` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creater_time` datetime DEFAULT NULL,
  `currentUser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flowName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flow_status` int(11) NOT NULL,
  PRIMARY KEY (`flowId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_flow
-- ----------------------------
INSERT INTO `f_flow` VALUES ('0351df1cddaa44d8a89339334029e90f', 'dtw', '2018-05-27 02:13:39', '', null, '0');
INSERT INTO `f_flow` VALUES ('2851d6b23aa64594a6c94ae8364d4e67', 'dtw', '2018-05-26 21:59:54', '', null, '0');
INSERT INTO `f_flow` VALUES ('2a29e4ef9d8449c7bc86c5ac6fe50860', 'dtw', '2018-05-27 01:57:09', '', null, '0');
INSERT INTO `f_flow` VALUES ('2f0a79565fb44abf9eb90e452c8056dd', 'dtw', '2018-05-27 01:58:16', '', null, '0');
INSERT INTO `f_flow` VALUES ('32298e25c53c4e3085731d1c351a2370', 'dtw', '2018-05-26 22:59:59', '', null, '0');
INSERT INTO `f_flow` VALUES ('3c304cc53f4d4a678738548abc373b8c', 'dtw', '2018-05-27 02:30:32', '', null, '0');
INSERT INTO `f_flow` VALUES ('5581987386294832959456547b884941', 'dtw', '2018-05-27 13:25:21', '', null, '0');
INSERT INTO `f_flow` VALUES ('755f9d534d9f46bfa34ffd1a57147f40', 'dtw', '2018-05-27 13:36:28', '', null, '0');
INSERT INTO `f_flow` VALUES ('7d4bd95032674fe787591f0e71429b56', 'dtw', '2018-05-27 01:57:27', '', null, '0');
INSERT INTO `f_flow` VALUES ('7d816a0e3cf44cc298d977d21b9b6888', 'dtw', '2018-05-27 12:10:57', '', null, '0');
INSERT INTO `f_flow` VALUES ('7de3eb56ef014e1b94020ec841c77f78', 'dtw', '2018-05-27 01:35:04', '', null, '0');
INSERT INTO `f_flow` VALUES ('8947c94cd37646fead3fe70d83fb9be8', '丁韬文', '2018-06-22 08:47:45', '', null, '0');
INSERT INTO `f_flow` VALUES ('a2cf0669f2c748d49a17fb7ef2bff25c', 'dtw', '2018-05-27 02:31:09', '', null, '0');
INSERT INTO `f_flow` VALUES ('a81351d8c4a341ca924dd30dda2344c4', 'dtw', '2018-05-27 01:51:31', '', null, '0');
INSERT INTO `f_flow` VALUES ('b6b96036a11e457b8be859ae9cad0093', 'dtw', '2018-05-27 02:35:18', '', null, '0');
INSERT INTO `f_flow` VALUES ('b7e8114dd2624fc2bf976716a31bfa53', 'dtw', '2018-05-27 13:29:12', '', null, '0');
INSERT INTO `f_flow` VALUES ('bdad14bf11544af88743e0dc1c762d4a', '丁韬文', '2018-08-07 23:19:57', '3167102100', null, '1');
INSERT INTO `f_flow` VALUES ('c0fce3b6900a4f91a52711e9f66d2b61', 'dtw', '2018-05-26 23:03:40', '', null, '0');
INSERT INTO `f_flow` VALUES ('c4a124dffa1548209c97f368fc0c8f7b', 'dtw', '2018-05-27 00:27:14', '', null, '0');
INSERT INTO `f_flow` VALUES ('cec4c700ae354d1fa21263f156ff3c9e', 'dtw', '2018-05-27 00:37:39', '', null, '0');
INSERT INTO `f_flow` VALUES ('d1994bd9cd7e4109afe2b45e3fb2b867', 'dtw', '2018-05-27 13:38:02', '', null, '0');
INSERT INTO `f_flow` VALUES ('d882856dde4b4fbb89484b6ebbc60548', 'qq', '2018-05-27 11:09:24', '', null, '0');
INSERT INTO `f_flow` VALUES ('f55ebbb981eb49ca9c6fa98986216031', 'dtw', '2018-05-27 02:31:22', '', null, '0');

-- ----------------------------
-- Table structure for f_flownode
-- ----------------------------
DROP TABLE IF EXISTS `f_flownode`;
CREATE TABLE `f_flownode` (
  `fnId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currentUser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flowId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nextUser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nodeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nodeSort` int(11) NOT NULL,
  `previousUser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusName` int(11) NOT NULL,
  PRIMARY KEY (`fnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_flownode
-- ----------------------------
INSERT INTO `f_flownode` VALUES ('0043d1ae401145cabbe67a646261a7e5', '2018-05-27 11:09:24', 'qq', '3167102100', 'd882856dde4b4fbb89484b6ebbc60548', null, '班主任审核', '0', '3167102100', '1');
INSERT INTO `f_flownode` VALUES ('0702a8dfe708475e8e1e840bedf835de', '2018-05-27 01:58:16', 'dtw', '3167102100', '2f0a79565fb44abf9eb90e452c8056dd', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('0b465604b26d4ac3a2d61d66283221c9', '2018-05-27 01:57:27', 'dtw', '3167102100', '7d4bd95032674fe787591f0e71429b56', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('0cb6a86cdcc240c2953ae4339c29cc70', '2018-05-27 02:13:57', null, '3167102700', '0351df1cddaa44d8a89339334029e90f', null, '系主任审核', '1', '3167102100', '0');
INSERT INTO `f_flownode` VALUES ('1750e1229f224494ad4b91b9e00c615a', '2018-06-22 08:47:45', '丁韬文', '3167102100', '8947c94cd37646fead3fe70d83fb9be8', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('197f19f097a74aa1a2514e45dea98545', '2018-05-27 02:31:38', null, '3167102621', 'f55ebbb981eb49ca9c6fa98986216031', '3167102100', '请假驳回', '1', null, '0');
INSERT INTO `f_flownode` VALUES ('2185c66932d9459196c28a5792c201f7', '2018-05-27 02:14:54', null, '3167102700', '0351df1cddaa44d8a89339334029e90f', null, '驳回之后重新审核', '3', null, '0');
INSERT INTO `f_flownode` VALUES ('331836ff7f574ca3869d54ae1fbc5fc1', '2018-05-27 02:13:39', 'dtw', '3167102100', '0351df1cddaa44d8a89339334029e90f', '3167102700', '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('33f45accf73f478fb8853b57cd0da275', '2018-05-27 01:51:31', 'dtw', '3167102100', 'a81351d8c4a341ca924dd30dda2344c4', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('49e2245b38db4855b170b61c550c1c07', '2018-05-27 12:11:11', null, null, '7d816a0e3cf44cc298d977d21b9b6888', null, '请假成功', '1', '3167102100', '0');
INSERT INTO `f_flownode` VALUES ('4a9e47b10e1c44f29f8973b9f5c88487', '2018-08-07 23:19:57', '丁韬文', '3167102100', 'bdad14bf11544af88743e0dc1c762d4a', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('4f1ba4fe4da848a1a0ba3786600ba631', '2018-05-27 02:30:32', 'dtw', '3167102100', '3c304cc53f4d4a678738548abc373b8c', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('5325bbaa9ea341a28617291de0381b01', '2018-05-27 01:35:04', 'dtw', '3167102100', '7de3eb56ef014e1b94020ec841c77f78', '3167102700', '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('5a556c2eac9e47788a6150abd2cec190', '2018-05-27 13:39:20', null, '3167102700', 'd1994bd9cd7e4109afe2b45e3fb2b867', null, '驳回之后重新审核', '3', null, '0');
INSERT INTO `f_flownode` VALUES ('5f3dc19e77c540c0a526e0b01ad8955b', '2018-05-27 00:37:54', null, null, 'cec4c700ae354d1fa21263f156ff3c9e', null, '请假成功', '1', '3167102100', '0');
INSERT INTO `f_flownode` VALUES ('617f4009e6eb49108aeb411d35a7b076', '2018-05-27 02:31:09', 'dtw', '3167102100', 'a2cf0669f2c748d49a17fb7ef2bff25c', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('637520b2e2fb4e1f8fe7dcc9e9babefb', '2018-05-27 02:32:42', null, null, 'f55ebbb981eb49ca9c6fa98986216031', null, '驳回之后重新审核', '4', null, '0');
INSERT INTO `f_flownode` VALUES ('73a81a5deddd40e7a194d518516e0639', '2018-05-27 13:38:17', null, '3167102700', 'd1994bd9cd7e4109afe2b45e3fb2b867', null, '系主任审核', '1', '3167102100', '2');
INSERT INTO `f_flownode` VALUES ('783a3f70efa24187817037fb7e653218', '2018-05-27 13:25:21', 'dtw', '3167102100', '5581987386294832959456547b884941', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('7bb38a9b47c6472e8d7eee9382f15cf5', '2018-05-27 02:35:33', null, '3167102621', 'b6b96036a11e457b8be859ae9cad0093', '3167102100', '请假驳回', '1', null, '0');
INSERT INTO `f_flownode` VALUES ('7dc63ac16b0f40ab8441ef5668b2e82c', '2018-05-27 02:35:18', 'dtw', '3167102100', 'b6b96036a11e457b8be859ae9cad0093', '3167102700', '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('7dd296d25cc3489696b7f73259a20048', '2018-05-27 02:14:29', null, '3167102621', '0351df1cddaa44d8a89339334029e90f', '3167102700', '请假驳回', '2', null, '0');
INSERT INTO `f_flownode` VALUES ('8783c19b1e684c2da332e4289d81bd45', '2018-05-27 13:36:28', 'dtw', '3167102100', '755f9d534d9f46bfa34ffd1a57147f40', null, '班主任审核', '0', '3167102621', '1');
INSERT INTO `f_flownode` VALUES ('8ea9c0979d9042129666552f92c01a12', '2018-05-27 00:37:39', 'dtw', '3167102100', 'cec4c700ae354d1fa21263f156ff3c9e', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('929e0149c9da47bda7efbfb79249c4b7', '2018-05-26 23:03:40', 'dtw', '3167102100', 'c0fce3b6900a4f91a52711e9f66d2b61', '3167102700', '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('949cfe2a3d8e4a25be97cd50017bb535', '2018-05-26 21:59:54', 'dtw', '3167102100', '2851d6b23aa64594a6c94ae8364d4e67', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('99ac97c579a7436fa6c1d4f5bc5aa64c', '2018-05-27 13:38:56', null, '3167102621', 'd1994bd9cd7e4109afe2b45e3fb2b867', '3167102700', '请假驳回', '2', null, '0');
INSERT INTO `f_flownode` VALUES ('9c610fc192ef4d3ea0616e43c3e8203c', '2018-05-27 02:31:52', null, '3167102100', 'f55ebbb981eb49ca9c6fa98986216031', null, '驳回之后重新审核', '2', null, '0');
INSERT INTO `f_flownode` VALUES ('a1de7dd6fafd4f9da0d505da92e470ec', '2018-05-27 13:29:12', 'dtw', '3167102100', 'b7e8114dd2624fc2bf976716a31bfa53', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('a48a5430dd94474cb1592df5c2df2a16', '2018-05-27 01:57:09', 'dtw', '3167102100', '2a29e4ef9d8449c7bc86c5ac6fe50860', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('ae4cf58560b2486ca41e52e1322e76a0', '2018-05-27 12:10:14', null, null, 'd882856dde4b4fbb89484b6ebbc60548', null, '请假成功', '1', '3167102100', '0');
INSERT INTO `f_flownode` VALUES ('b3739ffea34649c2a172b56e9b02e6ce', '2018-05-27 13:38:02', 'dtw', '3167102100', 'd1994bd9cd7e4109afe2b45e3fb2b867', '3167102700', '班主任审核', '0', '3167102621', '1');
INSERT INTO `f_flownode` VALUES ('b8627ab0ab384fe7a98a8f8057c13e19', '2018-05-27 02:31:22', 'dtw', '3167102100', 'f55ebbb981eb49ca9c6fa98986216031', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('b9f565443d2643efa5657f2a637e5c33', '2018-05-27 00:27:14', 'dtw', '3167102100', 'c4a124dffa1548209c97f368fc0c8f7b', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('ba8a7ce33f0d4af185d703f1e6589db2', '2018-06-25 14:43:05', null, null, '8947c94cd37646fead3fe70d83fb9be8', null, '请假成功', '1', '3167102100', '0');
INSERT INTO `f_flownode` VALUES ('c77149ad77bf46b7be1e34b93024fd9d', '2018-05-27 13:37:40', null, null, '755f9d534d9f46bfa34ffd1a57147f40', null, '请假成功', '1', '3167102100', '1');
INSERT INTO `f_flownode` VALUES ('d6a37595e3514d038b6ba81f49c44f14', '2018-05-27 12:10:57', 'dtw', '3167102100', '7d816a0e3cf44cc298d977d21b9b6888', null, '班主任审核', '0', '3167102621', '1');
INSERT INTO `f_flownode` VALUES ('e2908da581e74001b5a01b2a2a802f45', '2018-05-26 22:59:59', 'dtw', '3167102100', '32298e25c53c4e3085731d1c351a2370', null, '班主任审核', '0', '3167102621', '0');
INSERT INTO `f_flownode` VALUES ('e8fea2a11b654a808f9b24d486f33121', '2018-05-27 02:32:23', null, null, 'f55ebbb981eb49ca9c6fa98986216031', null, '驳回之后重新审核', '3', null, '0');

-- ----------------------------
-- Table structure for f_menu
-- ----------------------------
DROP TABLE IF EXISTS `f_menu`;
CREATE TABLE `f_menu` (
  `menu_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isleaf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_menu
-- ----------------------------

-- ----------------------------
-- Table structure for f_resource
-- ----------------------------
DROP TABLE IF EXISTS `f_resource`;
CREATE TABLE `f_resource` (
  `res_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_resource
-- ----------------------------

-- ----------------------------
-- Table structure for f_role
-- ----------------------------
DROP TABLE IF EXISTS `f_role`;
CREATE TABLE `f_role` (
  `role_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_role
-- ----------------------------
INSERT INTO `f_role` VALUES ('0', '系统管理员', '0');
INSERT INTO `f_role` VALUES ('1', '学生', '1');
INSERT INTO `f_role` VALUES ('2', '班主任', '2');
INSERT INTO `f_role` VALUES ('3', '系主任', '3');

-- ----------------------------
-- Table structure for f_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `f_role_menu`;
CREATE TABLE `f_role_menu` (
  `menuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roleid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`menuid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for f_sheet
-- ----------------------------
DROP TABLE IF EXISTS `f_sheet`;
CREATE TABLE `f_sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) NOT NULL,
  `end_day` datetime DEFAULT NULL,
  `flowId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flow_status` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `progress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_day` datetime DEFAULT NULL,
  `tele` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_sheet
-- ----------------------------
INSERT INTO `f_sheet` VALUES ('19', '2', '2018-05-04 00:00:00', '2851d6b23aa64594a6c94ae8364d4e67', '0', 'dtw', '1', '213123', '2018-05-02 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('20', '2', '2018-05-18 00:00:00', '32298e25c53c4e3085731d1c351a2370', '0', 'dtw', '1', '21312', '2018-05-16 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('21', '11', '2018-05-23 00:00:00', 'c0fce3b6900a4f91a52711e9f66d2b61', '0', 'dtw', '0', '213123', '2018-05-12 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('22', '2', '2018-05-04 00:00:00', 'c4a124dffa1548209c97f368fc0c8f7b', '0', 'dtw', '1', '21412', '2018-05-02 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('23', '2', '2018-05-05 00:00:00', 'cec4c700ae354d1fa21263f156ff3c9e', '0', 'dtw', '1', '213123', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('24', '25', '2018-05-28 00:00:00', '7de3eb56ef014e1b94020ec841c77f78', '0', 'dtw', '0', '123213123', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('25', '1', '2018-05-04 00:00:00', 'a81351d8c4a341ca924dd30dda2344c4', '0', 'dtw', '0', '23112', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('26', '1', '2018-05-04 00:00:00', '2a29e4ef9d8449c7bc86c5ac6fe50860', '0', 'dtw', '0', '23112312321', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('27', '1', '2018-05-03 00:00:00', '7d4bd95032674fe787591f0e71429b56', '0', 'dtw', '0', '321312', '2018-05-02 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('28', '2', '2018-05-05 00:00:00', '2f0a79565fb44abf9eb90e452c8056dd', '0', 'dtw', '0', '3213123', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('29', '14', '2018-05-16 00:00:00', '0351df1cddaa44d8a89339334029e90f', '0', 'dtw', '0', '123123', '2018-05-02 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('30', '2', '2018-05-04 00:00:00', '3c304cc53f4d4a678738548abc373b8c', '0', 'dtw', '2', '21321312', '2018-05-02 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('31', '1', '2018-05-05 00:00:00', 'a2cf0669f2c748d49a17fb7ef2bff25c', '0', 'dtw', '2', '21321', '2018-05-04 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('32', '1', '2018-05-05 00:00:00', 'f55ebbb981eb49ca9c6fa98986216031', '0', 'dtw', '2', '21321312', '2018-05-04 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('33', '3', '2018-05-05 00:00:00', 'b6b96036a11e457b8be859ae9cad0093', '0', 'dtw', '2', '213213', '2018-05-02 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('34', '2', '2018-05-29 00:00:00', 'd882856dde4b4fbb89484b6ebbc60548', '0', 'qq', '1', '412321', '2018-05-27 00:00:00', null, '事假', '3167102100');
INSERT INTO `f_sheet` VALUES ('35', '2', '2018-05-05 00:00:00', '7d816a0e3cf44cc298d977d21b9b6888', '0', 'dtw', '1', '21313', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('36', '2', '2018-05-05 00:00:00', '5581987386294832959456547b884941', '0', 'dtw', '2', '我不学了', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('37', '2', '2018-05-05 00:00:00', 'b7e8114dd2624fc2bf976716a31bfa53', '0', 'dtw', '2', '21312', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('38', '1', '2018-05-04 00:00:00', '755f9d534d9f46bfa34ffd1a57147f40', '0', 'dtw', '1', 'w buxu', '2018-05-03 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('39', '15', '2018-05-17 00:00:00', 'd1994bd9cd7e4109afe2b45e3fb2b867', '0', 'dtw', '0', '412312', '2018-05-02 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('40', '1', '2018-06-01 00:00:00', '8947c94cd37646fead3fe70d83fb9be8', '0', '丁韬文', '1', 'husada', '2018-05-31 00:00:00', null, '事假', '3167102621');
INSERT INTO `f_sheet` VALUES ('41', '2', '2018-08-04 00:00:00', 'bdad14bf11544af88743e0dc1c762d4a', '1', '丁韬文', '0', '213123', '2018-08-02 00:00:00', null, '事假', '3167102621');

-- ----------------------------
-- Table structure for f_user
-- ----------------------------
DROP TABLE IF EXISTS `f_user`;
CREATE TABLE `f_user` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tele` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of f_user
-- ----------------------------
INSERT INTO `f_user` VALUES ('', '06/05/2018', '0002', '0001', '727705453@qq.com', '', '', '1111111', '1', '男', '');
INSERT INTO `f_user` VALUES ('111', '', '0003', '0001', '', '111', '', '1111111', '', 'null', '11111111111');
INSERT INTO `f_user` VALUES ('3111111111', null, null, null, '727705453@qq.com', 'admin', null, 'admin123', '0', null, null);
INSERT INTO `f_user` VALUES ('31671020100', null, '0005', '0001', '727705453@qq.com', '360', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020104', null, '0001', '0001', '727705453@qq.com', '376', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020108', null, '0003', '0001', '727705453@qq.com', '392', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020111', null, '0001', '0001', '727705453@qq.com', '404', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020113', null, '0005', '0001', '727705453@qq.com', '412', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020117', null, '0002', '0001', '727705453@qq.com', '428', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020126', null, '0004', '0001', '727705453@qq.com', '464', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102013', null, '0002', '0001', '727705453@qq.com', '12', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020130', null, '0001', '0001', '727705453@qq.com', '480', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020137', null, '0002', '0001', '727705453@qq.com', '508', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020140', null, '0001', '0001', '727705453@qq.com', '520', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020142', null, '0002', '0001', '727705453@qq.com', '528', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020146', null, '0005', '0001', '727705453@qq.com', '544', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020154', null, '0001', '0001', '727705453@qq.com', '576', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020157', null, '0003', '0001', '727705453@qq.com', '588', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102016', null, '0001', '0001', '727705453@qq.com', '24', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020171', null, '0003', '0001', '727705453@qq.com', '644', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020174', null, '0004', '0001', '727705453@qq.com', '656', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020175', null, '0002', '0001', '727705453@qq.com', '660', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020178', null, '0005', '0001', '727705453@qq.com', '672', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020184', null, '0004', '0001', '727705453@qq.com', '696', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020191', null, '0005', '0001', '727705453@qq.com', '724', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020192', null, '0002', '0001', '727705453@qq.com', '728', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020193', null, '0003', '0001', '727705453@qq.com', '732', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671020205', null, '0003', '0001', '727705453@qq.com', '780', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102021', null, '0003', '0001', '727705453@qq.com', '44', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102029', null, '0002', '0001', '727705453@qq.com', '76', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102032', null, '0002', '0001', '727705453@qq.com', '88', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102037', null, '0005', '0001', '727705453@qq.com', '108', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102039', null, '0001', '0001', '727705453@qq.com', '116', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102053', null, '0005', '0001', '727705453@qq.com', '172', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102058', null, '0005', '0001', '727705453@qq.com', '192', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102059', null, '0003', '0001', '727705453@qq.com', '196', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102061', null, '0002', '0001', '727705453@qq.com', '204', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102063', null, '0004', '0001', '727705453@qq.com', '212', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102075', null, '0005', '0001', '727705453@qq.com', '260', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102087', null, '0004', '0001', '727705453@qq.com', '308', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102100', '2018-05-02', '0001', '0001', '727705453@qq.com', 'qq', null, '111111', '2', '男', '13178389033');
INSERT INTO `f_user` VALUES ('31671021102', null, '0014', '0002', '727705453@qq.com', '368', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021103', null, '0014', '0002', '727705453@qq.com', '372', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021110', null, '0012', '0002', '727705453@qq.com', '400', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102112', null, '0014', '0002', '727705453@qq.com', '8', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021120', null, '0013', '0002', '727705453@qq.com', '440', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021134', null, '0011', '0002', '727705453@qq.com', '496', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021139', null, '0011', '0002', '727705453@qq.com', '516', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021141', null, '0014', '0002', '727705453@qq.com', '524', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021143', null, '0013', '0002', '727705453@qq.com', '532', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102115', null, '0013', '0002', '727705453@qq.com', '20', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021158', null, '0011', '0002', '727705453@qq.com', '592', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021160', null, '0011', '0002', '727705453@qq.com', '600', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021161', null, '0012', '0002', '727705453@qq.com', '604', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021163', null, '0015', '0002', '727705453@qq.com', '612', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021166', null, '0014', '0002', '727705453@qq.com', '624', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021168', null, '0012', '0002', '727705453@qq.com', '632', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021169', null, '0011', '0002', '727705453@qq.com', '636', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021170', null, '0013', '0002', '727705453@qq.com', '640', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021179', null, '0011', '0002', '727705453@qq.com', '676', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102118', null, '0013', '0002', '727705453@qq.com', '32', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021187', null, '0014', '0002', '727705453@qq.com', '708', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021188', null, '0011', '0002', '727705453@qq.com', '712', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021194', null, '0014', '0002', '727705453@qq.com', '736', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021196', null, '0014', '0002', '727705453@qq.com', '744', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671021208', null, '0013', '0002', '727705453@qq.com', '792', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102122', null, '0014', '0002', '727705453@qq.com', '48', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102124', null, '0013', '0002', '727705453@qq.com', '56', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102126', null, '0013', '0002', '727705453@qq.com', '64', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102136', null, '0011', '0002', '727705453@qq.com', '104', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102141', null, '0014', '0002', '727705453@qq.com', '124', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102144', null, '0012', '0002', '727705453@qq.com', '136', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102145', null, '0015', '0002', '727705453@qq.com', '140', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102146', null, '0014', '0002', '727705453@qq.com', '144', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102172', null, '0011', '0002', '727705453@qq.com', '248', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102181', null, '0011', '0002', '727705453@qq.com', '284', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102188', null, '0011', '0002', '727705453@qq.com', '312', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102190', null, '0014', '0002', '727705453@qq.com', '320', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102191', null, '0013', '0002', '727705453@qq.com', '324', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102195', null, '0013', '0002', '727705453@qq.com', '340', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102198', null, '0011', '0002', '727705453@qq.com', '352', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102210', null, '0023', '0003', '727705453@qq.com', '0', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022114', null, '0021', '0003', '727705453@qq.com', '416', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022115', null, '0022', '0003', '727705453@qq.com', '420', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022121', null, '0024', '0003', '727705453@qq.com', '444', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022122', null, '0021', '0003', '727705453@qq.com', '448', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022128', null, '0025', '0003', '727705453@qq.com', '472', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022132', null, '0023', '0003', '727705453@qq.com', '488', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022133', null, '0021', '0003', '727705453@qq.com', '492', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022136', null, '0023', '0003', '727705453@qq.com', '504', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022138', null, '0025', '0003', '727705453@qq.com', '512', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022147', null, '0022', '0003', '727705453@qq.com', '548', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022148', null, '0024', '0003', '727705453@qq.com', '552', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022162', null, '0022', '0003', '727705453@qq.com', '608', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022164', null, '0025', '0003', '727705453@qq.com', '616', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022165', null, '0025', '0003', '727705453@qq.com', '620', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022167', null, '0024', '0003', '727705453@qq.com', '628', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102217', null, '0024', '0003', '727705453@qq.com', '28', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022173', null, '0022', '0003', '727705453@qq.com', '652', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022182', null, '0021', '0003', '727705453@qq.com', '688', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022186', null, '0022', '0003', '727705453@qq.com', '704', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022189', null, '0025', '0003', '727705453@qq.com', '716', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022198', null, '0022', '0003', '727705453@qq.com', '752', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022199', null, '0025', '0003', '727705453@qq.com', '756', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022200', null, '0022', '0003', '727705453@qq.com', '760', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022201', null, '0022', '0003', '727705453@qq.com', '764', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022202', null, '0022', '0003', '727705453@qq.com', '768', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022203', null, '0024', '0003', '727705453@qq.com', '772', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022204', null, '0024', '0003', '727705453@qq.com', '776', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671022206', null, '0023', '0003', '727705453@qq.com', '784', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102225', null, '0023', '0003', '727705453@qq.com', '60', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102227', null, '0022', '0003', '727705453@qq.com', '68', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102228', null, '0022', '0003', '727705453@qq.com', '72', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102250', null, '0022', '0003', '727705453@qq.com', '160', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102255', null, '0025', '0003', '727705453@qq.com', '180', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102266', null, '0023', '0003', '727705453@qq.com', '224', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102277', null, '0023', '0003', '727705453@qq.com', '268', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102279', null, '0024', '0003', '727705453@qq.com', '276', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023101', null, '0031', '0004', '727705453@qq.com', '364', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023107', null, '0031', '0004', '727705453@qq.com', '388', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023109', null, '0031', '0004', '727705453@qq.com', '396', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102311', null, '0032', '0004', '727705453@qq.com', '4', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023118', null, '0033', '0004', '727705453@qq.com', '432', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023119', null, '0033', '0004', '727705453@qq.com', '436', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023123', null, '0031', '0004', '727705453@qq.com', '452', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023124', null, '0033', '0004', '727705453@qq.com', '456', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023127', null, '0031', '0004', '727705453@qq.com', '468', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023131', null, '0033', '0004', '727705453@qq.com', '484', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023135', null, '0031', '0004', '727705453@qq.com', '500', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102314', null, '0034', '0004', '727705453@qq.com', '16', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023145', null, '0032', '0004', '727705453@qq.com', '540', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023150', null, '0035', '0004', '727705453@qq.com', '560', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023151', null, '0033', '0004', '727705453@qq.com', '564', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023152', null, '0035', '0004', '727705453@qq.com', '568', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023159', null, '0031', '0004', '727705453@qq.com', '596', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023172', null, '0033', '0004', '727705453@qq.com', '648', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023190', null, '0033', '0004', '727705453@qq.com', '720', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671023197', null, '0032', '0004', '727705453@qq.com', '748', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102323', null, '0034', '0004', '727705453@qq.com', '52', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102330', null, '0035', '0004', '727705453@qq.com', '80', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102331', null, '0032', '0004', '727705453@qq.com', '84', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102334', null, '0034', '0004', '727705453@qq.com', '96', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102335', null, '0034', '0004', '727705453@qq.com', '100', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102351', null, '0034', '0004', '727705453@qq.com', '164', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102354', null, '0032', '0004', '727705453@qq.com', '176', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102356', null, '0033', '0004', '727705453@qq.com', '184', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102367', null, '0032', '0004', '727705453@qq.com', '228', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102373', null, '0035', '0004', '727705453@qq.com', '252', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102376', null, '0032', '0004', '727705453@qq.com', '264', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102382', null, '0034', '0004', '727705453@qq.com', '288', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102384', null, '0034', '0004', '727705453@qq.com', '296', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102386', null, '0032', '0004', '727705453@qq.com', '304', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102389', null, '0033', '0004', '727705453@qq.com', '316', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102392', null, '0035', '0004', '727705453@qq.com', '328', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102394', null, '0032', '0004', '727705453@qq.com', '336', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102397', null, '0031', '0004', '727705453@qq.com', '348', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102399', null, '0032', '0004', '727705453@qq.com', '356', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024105', null, '0044', '0005', '727705453@qq.com', '380', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024106', null, '0042', '0005', '727705453@qq.com', '384', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024112', null, '0045', '0005', '727705453@qq.com', '408', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024116', null, '0042', '0005', '727705453@qq.com', '424', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024125', null, '0041', '0005', '727705453@qq.com', '460', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024129', null, '0041', '0005', '727705453@qq.com', '476', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024144', null, '0042', '0005', '727705453@qq.com', '536', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024149', null, '0041', '0005', '727705453@qq.com', '556', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024153', null, '0045', '0005', '727705453@qq.com', '572', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024155', null, '0044', '0005', '727705453@qq.com', '580', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024156', null, '0045', '0005', '727705453@qq.com', '584', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024176', null, '0042', '0005', '727705453@qq.com', '664', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024177', null, '0042', '0005', '727705453@qq.com', '668', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024180', null, '0044', '0005', '727705453@qq.com', '680', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024181', null, '0045', '0005', '727705453@qq.com', '684', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024183', null, '0045', '0005', '727705453@qq.com', '692', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024185', null, '0045', '0005', '727705453@qq.com', '700', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102419', null, '0042', '0005', '727705453@qq.com', '36', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024195', null, '0045', '0005', '727705453@qq.com', '740', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102420', null, '0045', '0005', '727705453@qq.com', '40', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024207', null, '0044', '0005', '727705453@qq.com', '788', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('31671024209', null, '0041', '0005', '727705453@qq.com', '796', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102433', null, '0045', '0005', '727705453@qq.com', '92', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102438', null, '0041', '0005', '727705453@qq.com', '112', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102440', null, '0044', '0005', '727705453@qq.com', '120', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102442', null, '0043', '0005', '727705453@qq.com', '128', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102443', null, '0045', '0005', '727705453@qq.com', '132', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102447', null, '0043', '0005', '727705453@qq.com', '148', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102448', null, '0044', '0005', '727705453@qq.com', '152', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102449', null, '0045', '0005', '727705453@qq.com', '156', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102452', null, '0044', '0005', '727705453@qq.com', '168', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102457', null, '0045', '0005', '727705453@qq.com', '188', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102460', null, '0044', '0005', '727705453@qq.com', '200', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102462', null, '0045', '0005', '727705453@qq.com', '208', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102464', null, '0043', '0005', '727705453@qq.com', '216', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102465', null, '0044', '0005', '727705453@qq.com', '220', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102468', null, '0043', '0005', '727705453@qq.com', '232', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102469', null, '0045', '0005', '727705453@qq.com', '236', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102470', null, '0044', '0005', '727705453@qq.com', '240', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102471', null, '0043', '0005', '727705453@qq.com', '244', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102474', null, '0045', '0005', '727705453@qq.com', '256', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102478', null, '0043', '0005', '727705453@qq.com', '272', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102480', null, '0043', '0005', '727705453@qq.com', '280', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102483', null, '0042', '0005', '727705453@qq.com', '292', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102485', null, '0044', '0005', '727705453@qq.com', '300', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102493', null, '0044', '0005', '727705453@qq.com', '332', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102496', null, '0043', '0005', '727705453@qq.com', '344', null, '111111', '1', null, null);
INSERT INTO `f_user` VALUES ('3167102621', '2018-05-03', '0001', '0001', '727705453@qq.com', '丁韬文', null, '111111', '1', '男', '13178389511');
INSERT INTO `f_user` VALUES ('3167102699', '06/06/2018', '0002', '0001', '727705453@qq.com', '猪里杰', '', '11111111', '1', '男', '13178389008');
INSERT INTO `f_user` VALUES ('3167102700', null, '0001', '0001', '727705453@qq.com', 'ww', null, '111111', '3', null, null);
